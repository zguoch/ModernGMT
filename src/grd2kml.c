/*--------------------------------------------------------------------
 *	$Id$
 *
 *	Copyright (c) 1991-2017 by P. Wessel, W. H. F. Smith, R. Scharroo, J. Luis and F. Wobbe
 *	See LICENSE.TXT file for copying and redistribution conditions.
 *
 *	This program is free software; you can redistribute it and/or modify
 *	it under the terms of the GNU Lesser General Public License as published by
 *	the Free Software Foundation; version 3 or any later version.
 *
 *	This program is distributed in the hope that it will be useful,
 *	but WITHOUT ANY WARRANTY; without even the implied warranty of
 *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *	GNU Lesser General Public License for more details.
 *
 *	Contact info: gmt.soest.hawaii.edu
 *--------------------------------------------------------------------*/
/*
 * Author:	Paul Wessel
 * Date:	8-NOV-2017
 * Version:	6 API
 *
 * Brief synopsis: grd2kml reads a single grid and makes a Google Earth
 * image quadtree.  Optionally supply an intensity grid and a CPT.
 *
 */

#include "gmt_dev.h"

#define THIS_MODULE_NAME	"grd2kml"
#define THIS_MODULE_LIB		"core"
#define THIS_MODULE_PURPOSE	"Create KML image quadtree from single grid"
#define THIS_MODULE_KEYS	"<G{,CC(,IG("
#define THIS_MODULE_NEEDS	""
#define THIS_MODULE_OPTIONS	"-Vf"

struct GRD2KML_CTRL {
	struct GRD2KM_In {
		bool active;
		char *file;
	} In;
	struct GRD2KML_C {	/* -C<cpt> */
		bool active;
		char *file;
	} C;
	struct GRD2KML_D {	/* -D */
		bool active;
	} D;
	struct GRD2KML_E {	/* -E<url> */
		bool active;
		char *url;
	} E;
	struct GRD2KML_F {	/* -F */
		bool active;
		char filter;
	} F;
	struct GRD2KML_N {	/* -N<prefix> */
		bool active;
		char *prefix;
	} N;
	struct GRD2KML_I {	/* -I[<intensfile>|<value>|<modifiers>] */
		bool active;
		bool constant;
		bool derive;
		double value;
		char *azimuth;	/* Default azimuth(s) for shading */
		char *file;
		char *method;	/* Default scaling method */
	} I;
	struct GRD2KML_L {	/* -L<size> */
		bool active;
		unsigned int size;
	} L;
	struct GRD2KML_S {	/* -S */
		bool active;
	} S;
};

/* Structure used to keep track of which tile and its 4 possible underlings */
struct GMT_QUADTREE {
	unsigned int level, q;
	unsigned int row, col;
	char tag[16];
	double wesn[4];
	struct GMT_QUADTREE *next[4];
};

GMT_LOCAL void *New_Ctrl (struct GMT_CTRL *GMT) {	/* Allocate and initialize a new control structure */
	struct GRD2KML_CTRL *C;

	C = gmt_M_memory (GMT, NULL, 1, struct GRD2KML_CTRL);

	/* Initialize values whose defaults are not 0/false/NULL */
	C->F.filter = 'g';
	C->I.method  = strdup ("t1");	/* Default normalization for shading when -I is used */
	C->L.size = 256;
	return (C);
}

GMT_LOCAL void Free_Ctrl (struct GMT_CTRL *GMT, struct GRD2KML_CTRL *C) {	/* Deallocate control structure */
	if (!C) return;
	gmt_M_str_free (C->In.file);
	gmt_M_str_free (C->C.file);
	gmt_M_str_free (C->N.prefix);
	gmt_M_str_free (C->I.file);
	gmt_M_str_free (C->I.azimuth);
	gmt_M_str_free (C->I.method);
	gmt_M_free (GMT, C);
}

GMT_LOCAL int usage (struct GMTAPI_CTRL *API, int level) {
	gmt_show_name_and_purpose (API, THIS_MODULE_LIB, THIS_MODULE_NAME, THIS_MODULE_PURPOSE);
	if (level == GMT_MODULE_PURPOSE) return (GMT_NOERROR);
	GMT_Message (API, GMT_TIME_NONE, "usage: grd2kml <grid> -N<name> [-C<cpt>] [-D] [-E<url>] [-F<filter>] [-I[<intensgrid>|<value>|<modifiers>]] [-L<size>]\n");
	GMT_Message (API, GMT_TIME_NONE, "	[%s] [%s]\n\n", GMT_V_OPT, GMT_f_OPT);

	if (level == GMT_SYNOPSIS) return (GMT_MODULE_SYNOPSIS);

	GMT_Message (API, GMT_TIME_NONE, "\t<grid> is the data set to be plotted.  Its z-values are in user units and will be\n");
	GMT_Message (API, GMT_TIME_NONE, "\t  converted to colors via the CPT [rainbow].\n");
	GMT_Message (API, GMT_TIME_NONE, "\t-N Sets file name prefix for image directory and KML file. If the directory\n");
	GMT_Message (API, GMT_TIME_NONE, "\t   already exist we will overwrite the files.\n");
	GMT_Message (API, GMT_TIME_NONE, "\n\tOPTIONS:\n");
	GMT_Message (API, GMT_TIME_NONE, "\t-C Color palette file to convert z to rgb. Optionally, instead give name of a master cpt\n");
	GMT_Message (API, GMT_TIME_NONE, "\t   to automatically assign 16 continuous colors over the data range [rainbow].\n");
	GMT_Message (API, GMT_TIME_NONE, "\t   Another option is to specify -C<color1>,<color2>[,<color3>,...] to build a\n");
	GMT_Message (API, GMT_TIME_NONE, "\t   linear continuous cpt from those colors automatically.\n");
	GMT_Message (API, GMT_TIME_NONE, "\t-D Write a list of quadtree associations to stdout [no listing].\n");
	GMT_Message (API, GMT_TIME_NONE, "\t-E To store all files remotely, give leading URL [local files only].\n");
	GMT_Message (API, GMT_TIME_NONE, "\t-F Specify filter type used for downsampling.  Choose among.\n");
	GMT_Message (API, GMT_TIME_NONE, "\t     b: Boxcar      : Simple averaging of all points inside filter domain.\n");
	GMT_Message (API, GMT_TIME_NONE, "\t     c: Cosine arch : Weighted averaging with cosine arc weights.\n");
	GMT_Message (API, GMT_TIME_NONE, "\t     g: Gaussian    : Weighted averaging with Gaussian weights [Default].\n");
	GMT_Message (API, GMT_TIME_NONE, "\t     m: Median      : Median (50%% quantile) value of all points.\n");
	GMT_Message (API, GMT_TIME_NONE, "\t-I Apply directional illumination. Append name of intensity grid file.\n");
	GMT_Message (API, GMT_TIME_NONE, "\t   For a constant intensity (i.e., change the ambient light), append a single value.\n");
	GMT_Message (API, GMT_TIME_NONE, "\t   To derive intensities from <grid> instead, append +a<azim> [-45] and +n<method> [t1].\n");
	GMT_Message (API, GMT_TIME_NONE, "\t   Use -I+ to accept the default values (see grdgradient for details).\n");
	GMT_Message (API, GMT_TIME_NONE, "\t-L Set tile size as a power of 2 [256].\n");
	GMT_Option (API, "V,f.");
	
	return (GMT_MODULE_USAGE);
}

GMT_LOCAL int parse (struct GMT_CTRL *GMT, struct GRD2KML_CTRL *Ctrl, struct GMT_OPTION *options) {

	/* This parses the options provided to grdcut and sets parameters in CTRL.
	 * Any GMT common options will override values set previously by other commands.
	 * It also replaces any file names specified as input or output with the data ID
	 * returned when registering these sources/destinations with the API.
	 */

	unsigned int n_errors = 0, n_files = 0;
	char *c = NULL;
	struct GMT_OPTION *opt = NULL;

	for (opt = options; opt; opt = opt->next) {	/* Process all the options given */

		switch (opt->option) {
			/* Common parameters */

			case '<':	/* Input files */
				if (gmt_check_filearg (GMT, '<', opt->arg, GMT_IN, GMT_IS_GRID) && n_files == 0) {
					Ctrl->In.file = strdup (opt->arg);
					n_files++;
				}
				else
					n_errors++;
				break;

			/* Processes program-specific parameters */

			case 'C':	/* CPT */
				Ctrl->C.active = true;
				gmt_M_str_free (Ctrl->C.file);
				Ctrl->C.file = strdup (opt->arg);
				break;
			case 'D':	/* Listing */
				Ctrl->D.active = true;
				break;
			case 'E':	/* Remove URL for all contents but top driver kml */
				Ctrl->E.active = true;
				gmt_M_str_free (Ctrl->E.url);
				Ctrl->E.url = strdup (opt->arg);
				break;
			case 'F':	/* Select filter type */
				Ctrl->F.active = true;
				if (strchr ("bcgm", opt->arg[0]))
					Ctrl->F.filter = opt->arg[0];
				else {
					GMT_Report (GMT->parent, GMT_MSG_NORMAL, "Syntax error -F: Choose among b, c, g, m!\n");
					n_errors++;
				}
				break;
			case 'N':	/* File name prefix */
				Ctrl->N.active = true;
				gmt_M_str_free (Ctrl->N.prefix);
				Ctrl->N.prefix = strdup (opt->arg);
				break;
			case 'I':	/* Here, intensity must be a grid file since we need to filter it */
				Ctrl->I.active = true;
				if ((c = gmt_first_modifier (GMT, opt->arg, "an"))) {	/* Want to control how grdgradient is run */
					unsigned int pos = 0;
					char p[GMT_BUFSIZ] = {""};
					Ctrl->I.derive = true;
					while (gmt_getmodopt (GMT, 'I', c, "an", &pos, p, &n_errors) && n_errors == 0) {
						switch (p[0]) {
							case 'a': gmt_M_str_free (Ctrl->I.azimuth); Ctrl->I.azimuth = strdup (&p[1]); break;
							case 'n': gmt_M_str_free (Ctrl->I.method);  Ctrl->I.method  = strdup (&p[1]); break;
							default: break;	/* These are caught in gmt_getmodopt so break is just for Coverity */
						}
					}
					c[0] = '\0';	/* Chop off all modifiers so range can be determined */
				}
				else if (!opt->arg[0] || strstr (opt->arg, "+"))	/* No argument or just +, so derive intensities from input grid using default settings */
					Ctrl->I.derive = true;
				else if (!gmt_access (GMT, opt->arg, R_OK))	/* Got a file */
					Ctrl->I.file = strdup (opt->arg);
				else if (gmt_M_file_is_cache (opt->arg))	/* Got a remote file */
					Ctrl->I.file = strdup (opt->arg);
				else if (opt->arg[0] && !gmt_not_numeric (GMT, opt->arg)) {	/* Looks like a constant value */
					Ctrl->I.value = atof (opt->arg);
					Ctrl->I.constant = true;
				}
				else {
					GMT_Report (GMT->parent, GMT_MSG_NORMAL, "Syntax error -I: Requires a valid grid file or a constant\n");
					n_errors++;
				}
				break;
			case 'L':	/* Tiles sizes */
				Ctrl->L.active = true;
				Ctrl->L.size = atoi (opt->arg);
				if (Ctrl->L.size <= 0 || ((log2 ((double)Ctrl->L.size) - irint (log2 ((double)Ctrl->L.size))) > GMT_CONV8_LIMIT)) {
					GMT_Report (GMT->parent, GMT_MSG_NORMAL, "Syntax error -L: Must be radix 2!\n");
					n_errors++;
				}
				break;
			case 'S':	/* Single level directory */
				Ctrl->S.active = true;
				break;

			default:	/* Report bad options */
				n_errors += gmt_default_error (GMT, opt->option);
				break;
		}
	}

	n_errors += gmt_M_check_condition (GMT, n_files != 1, "Syntax error: Must specify a single grid file\n");
	n_errors += gmt_M_check_condition (GMT, Ctrl->In.file == NULL, "Syntax error: Must specify a single grid file\n");
	n_errors += gmt_M_check_condition (GMT, Ctrl->N.prefix == NULL, "Syntax error -N: Must specify a prefix for naming usage.\n");
	n_errors += gmt_M_check_condition (GMT, Ctrl->E.active && Ctrl->E.url == NULL, "Syntax error -E: Must specify an URL.\n");
	n_errors += gmt_M_check_condition (GMT, Ctrl->I.active && !Ctrl->I.constant && !Ctrl->I.file && !Ctrl->I.derive,
	                                 "Syntax error -I option: Must specify intensity file, value, or modifiers\n");

	return (n_errors ? GMT_PARSE_ERROR : GMT_NOERROR);
}

int find_quad_above (struct GMT_QUADTREE **Q, unsigned int n, unsigned int row, unsigned int col, unsigned int level) {
	/* Finds the quad entry that matches the row, col, level args */
	unsigned int k;
	for (k = 0; k < n; k++) {
		if (Q[k]->level != level) continue;
		if (Q[k]->row != row) continue;
		if (Q[k]->col != col) continue;
		return (int)k;
	}
	return -1;	/* Very bad */
}

void set_dirpath (bool single, char *url, char *prefix, unsigned int level, int dir, char *string) {
	if (single) {	/* Write everything into the prefix dir */
		if (url && level == 0)	/* Set the leading URL for zero-level first kml */
			sprintf (string, "%s/%s/L%d", url, prefix, level);
		else if (level == 0 && dir == 1)	/* For top level we must write prefix dir */
			sprintf (string, "%s/L%d", prefix, level);
		else	/* Everything below is in same folder */
			sprintf (string, "L%d", level);
	}
	else {	/* Write to separate level directories */
		if (url && level == 0)	/* Set the leading URL for zero-level first kml */
			sprintf (string, "%s/%s/%d/", url, prefix, level);
		else if (dir == -1)	/* Need to refer to another directory at same level as this one */
			sprintf (string, "../%d/", level);
		else if (dir == 0)	/* At current dir */
			string[0] = '\0';
		else	/* Down in a dir */
			sprintf (string, "%d/", level);
	}
}

#define bailout(code) {gmt_M_free_options (mode); return (code);}
#define Return(code) {Free_Ctrl (GMT, Ctrl); gmt_end_module (GMT, GMT_cpy); bailout (code);}

EXTERN_MSC int gmtlib_geo_C_format (struct GMT_CTRL *GMT);

int GMT_grd2kml (void *V_API, int mode, void *args) {
	int error = 0, kk, uniq;
	bool use_tile = false, z_extend = false, i_extend = false;
	
	unsigned int level, max_level, n = 0, k, nx, ny, mx, my, row, col, n_skip, quad, n_alloc = GMT_CHUNK, n_bummer = 0;

	uint64_t node;
	
	double factor, dim, wesn[4], ext_wesn[4], inc[2];
	

	char cmd[GMT_BUFSIZ] = {""}, level_dir[PATH_MAX] = {""}, Zgrid[PATH_MAX] = {""}, Igrid[PATH_MAX] = {""};
	char W[GMT_LEN16] = {""}, E[GMT_LEN16] = {""}, S[GMT_LEN16] = {""}, N[GMT_LEN16] = {""}, file[PATH_MAX] = {""};
	char DataGrid[PATH_MAX] = {""}, IntensGrid[PATH_MAX] = {""}, path[PATH_MAX] = {""};

	FILE *fp = NULL;
	struct GMT_QUADTREE **Q = NULL;
	struct GRD2KML_CTRL *Ctrl = NULL;
	struct GMT_GRID *G = NULL, *T = NULL;
	struct GMT_CTRL *GMT = NULL, *GMT_cpy = NULL;
	struct GMT_OPTION *options = NULL;
	struct GMTAPI_CTRL *API = gmt_get_api_ptr (V_API);	/* Cast from void to GMTAPI_CTRL pointer */

	/*----------------------- Standard module initialization and parsing ----------------------*/

	if (API == NULL) return (GMT_NOT_A_SESSION);
	if (mode == GMT_MODULE_PURPOSE) return (usage (API, GMT_MODULE_PURPOSE));	/* Return the purpose of program */
	options = GMT_Create_Options (API, mode, args);	if (API->error) return (API->error);	/* Set or get option list */

	if (!options || options->option == GMT_OPT_USAGE) bailout (usage (API, GMT_USAGE));	/* Return the usage message */
	if (options->option == GMT_OPT_SYNOPSIS) bailout (usage (API, GMT_SYNOPSIS));	/* Return the synopsis */

	/* Parse the command-line arguments */

	if ((GMT = gmt_init_module (API, THIS_MODULE_LIB, THIS_MODULE_NAME, THIS_MODULE_KEYS, THIS_MODULE_NEEDS, &options, &GMT_cpy)) == NULL) bailout (API->error); /* Save current state */
	if (GMT_Parse_Common (API, THIS_MODULE_OPTIONS, options)) Return (API->error);
	Ctrl = New_Ctrl (GMT);	/* Allocate and initialize a new control structure */
	if ((error = parse (GMT, Ctrl, options)) != 0) Return (error);

	/*---------------------------- This is the grd2kml main code ----------------------------*/

	/* Read grid header only to determine dimensions and required levels for the Pyramid */
	if ((G = GMT_Read_Data (API, GMT_IS_GRID, GMT_IS_FILE, GMT_IS_SURFACE, GMT_CONTAINER_ONLY, NULL, Ctrl->In.file, NULL)) == NULL) {
		Return (API->error);
	}
	if (!gmt_M_is_geographic (GMT, GMT_IN)) {
		GMT_Report (GMT->parent, GMT_MSG_NORMAL, "Grid must be geographic (lon, lat)\n");
		Return (API->error);
	}
	if (!doubleAlmostEqual (G->header->inc[GMT_X], G->header->inc[GMT_Y])) {
		GMT_Report (GMT->parent, GMT_MSG_NORMAL, "Grid spacing must be the same in longitude and latitude!\n");
		Return (API->error);
	}
	
	nx = G->header->n_columns;	ny = G->header->n_rows;			/* Dimensions of original grid */
	mx = urint (ceil ((double)nx / (double)Ctrl->L.size)) * Ctrl->L.size;	/* Nearest image size in multiples of tile size */
	my = urint (ceil ((double)ny / (double)Ctrl->L.size)) * Ctrl->L.size;
	max_level = urint (ceil (log2 (MAX (mx, my) / (double)Ctrl->L.size)));	/* Number of levels in the quadtree */
	if ((60.0 * G->header->inc[GMT_X] - irint (60.0 * G->header->inc[GMT_X])) < GMT_CONV4_LIMIT) {
		/* Grid spacing is an integer multiple of 1 arc minute or higher, use ddd:mm format */
		strcpy (GMT->current.setting.format_geo_out, "ddd:mm");
	}
	else if ((3600.0 * G->header->inc[GMT_X] - irint (3600.0 * G->header->inc[GMT_X])) < GMT_CONV4_LIMIT) {
		/* Grid spacing is an integer multiple of 1 arc sec or higher, use ddd:mm:ss format */
		strcpy (GMT->current.setting.format_geo_out, "ddd:mm:ss");
	}
	else if ((36000.0 * G->header->inc[GMT_X] - irint (36000.0 * G->header->inc[GMT_X])) < GMT_CONV4_LIMIT) {
		/* Grid spacing is an integer multiple of 0.1 arc sec or higher, use ddd:mm:ss.x format */
		strcpy (GMT->current.setting.format_geo_out, "ddd:mm:ss.x");
	}
	else {	/* Cannot use 0.1 arcsecs, do full decimal resolution */
		strcpy (GMT->current.setting.format_float_out, "%.16g");
		strcpy (GMT->current.setting.format_geo_out, "D");
	}
	gmtlib_geo_C_format (GMT);	/* Update the format settings */
	dim = 0.01 * Ctrl->L.size;	/* Constant tile map size in inches for a fixed dpi of 100 yields PNGS of the requested dimension */
	
	GMT->current.io.geo.range = (G->header->wesn[XLO] < 0.0 && G->header->wesn[XHI] > 0.0) ? GMT_IS_M180_TO_P180_RANGE : GMT_IS_0_TO_P360_RANGE;

	/* Create the container quadtree directory first */
#ifndef _WIN32
	if (mkdir (Ctrl->N.prefix, (mode_t)0777))
#else
	if (mkdir (Ctrl->N.prefix))
#endif
	{
		GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Directory %s already exist - will overwrite files\n", Ctrl->N.prefix);
	}
	
	uniq = (int)(time (NULL) % 1000000);	/* remainder of seconds - lazy way to get some unique number for the files  */
	if (Ctrl->I.derive) {	/* Auto-create single intensity grid from data grid to ensure constant scaling */
		sprintf (file, "grd2kml_intensity_tmp_%6.6d.grd", uniq);
		Ctrl->I.file = strdup (file);
		GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Derive an intensity grid from data grid\n");
		/* Prepare the grdgradient arguments using selected -A -N and the data region in effect */
		sprintf (cmd, "%s -G%s -A%s -N%s --GMT_HISTORY=false", Ctrl->In.file, Ctrl->I.file, Ctrl->I.azimuth, Ctrl->I.method);
		/* Call the grdgradient module */
		GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Calling grdgradient with args %s\n", cmd);
		if (GMT_Call_Module (API, "grdgradient", GMT_MODULE_CMD, cmd))
			Return (API->error);
	}
	else {	/* Can read the intensity file and compare region etc to data grid */
		struct GMT_GRID *I = NULL;
		double x_noise = GMT_CONV4_LIMIT * G->header->inc[GMT_X], y_noise = GMT_CONV4_LIMIT * G->header->inc[GMT_Y];
		if ((I = GMT_Read_Data (API, GMT_IS_GRID, GMT_IS_FILE, GMT_IS_SURFACE, GMT_CONTAINER_ONLY, NULL, Ctrl->I.file, NULL)) == NULL) {
			Return (API->error);
		}
		if (!gmt_M_grd_same_shape (GMT, G, I)) {
			GMT_Report (API, GMT_MSG_NORMAL, "Data grid and intensity grid are not of the same dimensions!\n");
			Return (GMT_RUNTIME_ERROR);
		}
		if (fabs (G->header->wesn[XLO] - I->header->wesn[XLO]) > x_noise || fabs (G->header->wesn[XHI] - I->header->wesn[XHI]) > x_noise ||
			fabs (G->header->wesn[YLO] - I->header->wesn[YLO]) > y_noise || fabs (G->header->wesn[YHI] - I->header->wesn[YHI]) > y_noise) {
			GMT_Report (API, GMT_MSG_NORMAL, "Data grid and intensity grid do not cover the same area!\n");
			Return (GMT_RUNTIME_ERROR);
		}
	}

	Q = gmt_M_memory (GMT, NULL, n_alloc, struct GMT_QUADTREE *);
	factor = pow (2.0, max_level);	/* Max width of imaged pixels in multiples of original grid spacing for this level */
	/* Determine extended region required if using the largest multiple of original grid spacing */
	inc[GMT_X] = factor * G->header->inc[GMT_X];
	inc[GMT_Y] = factor * G->header->inc[GMT_Y];
	ext_wesn[XLO] = floor (G->header->wesn[XLO] / inc[GMT_X]) * inc[GMT_X];
	ext_wesn[XHI] = ceil  (G->header->wesn[XHI] / inc[GMT_X]) * inc[GMT_X];
	ext_wesn[YLO] = floor (G->header->wesn[YLO] / inc[GMT_Y]) * inc[GMT_Y];
	ext_wesn[YHI] = ceil  (G->header->wesn[YHI] / inc[GMT_Y]) * inc[GMT_Y];
	if (ext_wesn[XLO] < G->header->wesn[XLO] || ext_wesn[XHI] > G->header->wesn[XHI] || ext_wesn[YLO] < G->header->wesn[YLO] || ext_wesn[YHI] > G->header->wesn[YHI]) {
		/* Extend the original grid with NaNs so it is an exact multiple of largest grid stride at max level */
		sprintf (DataGrid, "grd2kml_extended_data_%6.6d.grd", uniq);
		sprintf (cmd, "%s -R%.16g/%.16g/%.16g/%.16g -N -G%s", Ctrl->In.file, ext_wesn[XLO], ext_wesn[XHI], ext_wesn[YLO], ext_wesn[YHI], DataGrid);
		GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Extend original data grid to multiple of largest grid spacing\n");
		if ((error = GMT_Call_Module (API, "grdcut", GMT_MODULE_CMD, cmd)) != GMT_NOERROR) {
			Return (GMT_RUNTIME_ERROR);
		}
		z_extend = true;	/* We made a temp file we need to zap */
		if (Ctrl->I.active) {	/* Also extend the intensity grid */
			sprintf (IntensGrid, "grd2kml_extended_intens_%6.6d.grd", uniq);
			sprintf (cmd, "%s -R%.16g/%.16g/%.16g/%.16g -N -G%s", Ctrl->I.file, ext_wesn[XLO], ext_wesn[XHI], ext_wesn[YLO], ext_wesn[YHI], IntensGrid);
			GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Extend intensity grid to multiple of largest grid spacing\n");
			if ((error = GMT_Call_Module (API, "grdcut", GMT_MODULE_CMD, cmd)) != GMT_NOERROR) {
				Return (GMT_RUNTIME_ERROR);
			}
			i_extend = true;	/* We made a temp file we need to zap */
		}
	}
	else {	/* No need to extend, use as is */
		strcpy (DataGrid, Ctrl->In.file);
		if (Ctrl->I.active)
			strcpy (IntensGrid, Ctrl->I.file);
	}

	/* Loop over all the levels, starting at the top level (0) */
	for (level = 0; level <= max_level; level++) {
		factor = pow (2.0, max_level - level);	/* Width of imaged pixels in multiples of original grid spacing for this level */
		inc[GMT_X] = factor * G->header->inc[GMT_X];
		inc[GMT_Y] = factor * G->header->inc[GMT_Y];
		GMT_Report (GMT->parent, GMT_MSG_LONG_VERBOSE, "Level %d: Factor = %g Dim = %d x %d -> %d x %d\n",
			level, factor, irint (factor * Ctrl->L.size), irint (factor * Ctrl->L.size), Ctrl->L.size, Ctrl->L.size);
		/* Create the level directory */
		if (Ctrl->S.active && level == 0) {
			sprintf (level_dir, "%s/%s", Ctrl->N.prefix, Ctrl->N.prefix);
#ifndef _WIN32
			if (mkdir (level_dir, (mode_t)0777))
#else
			if (mkdir (level_dir))
#endif
			{
				GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Level directory %s already exist - overwriting files\n", level_dir);
			}
		}
		else if (!Ctrl->S.active) {
			sprintf (level_dir, "%s/%d", Ctrl->N.prefix, level);
#ifndef _WIN32
			if (mkdir (level_dir, (mode_t)0777))
#else
			if (mkdir (level_dir))
#endif
			{
				GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Level directory %s already exist - overwriting files\n", level_dir);
			}
		}
		if (level < max_level) {	/* Filter the data to match level resolution */
			GMT_Report (GMT->parent, GMT_MSG_LONG_VERBOSE, "Level %d: Filtering down the grid(s)\n", level);
			sprintf (Zgrid, "grd2kml_Z_L%d_tmp_%6.6d.grd", level, uniq);
			sprintf (cmd, "%s -D0 -F%c%.16g -I%.16g -G%s", DataGrid, Ctrl->F.filter, inc[GMT_X], inc[GMT_X], Zgrid);
			GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Running grdfilter : %s\n", cmd);
			if ((error = GMT_Call_Module (API, "grdfilter", GMT_MODULE_CMD, cmd)) != GMT_NOERROR) {
				Return (GMT_RUNTIME_ERROR);
			}
			if (Ctrl->I.active) {	/* Also filter the intensity grid */
				sprintf (Igrid, "grd2kml_I_L%d_tmp_%6.6d.grd", level, uniq);
				sprintf (cmd, "%s -D0 -F%c%.16g -I%.16g -G%s", IntensGrid, Ctrl->F.filter, inc[GMT_X], inc[GMT_X], Igrid);
				GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Running grdfilter : %s\n", cmd);
				if ((error = GMT_Call_Module (API, "grdfilter", GMT_MODULE_CMD, cmd)) != GMT_NOERROR) {
					Return (GMT_RUNTIME_ERROR);
				}
			}
		}
		else {	/* Use as is for the highest resolution */
			strcpy (Zgrid, Ctrl->In.file);
			if (Ctrl->I.active) strcpy (Igrid, Ctrl->I.file);
		}
		
		/* Loop over all rows at this level */
		row = col = n_skip = 0;
		wesn[YLO] = ext_wesn[YLO];
		gmt_ascii_format_one (GMT, S, wesn[YLO], GMT_IS_LAT);
		 
		while (wesn[YLO] < (G->header->wesn[YHI]-G->header->inc[GMT_Y])) {	/* Small correction to avoid issues due to round-off */
			wesn[YHI] = wesn[YLO] + factor * Ctrl->L.size * G->header->inc[GMT_Y];	/* Top row may extend beyond grid and be transparent */
			gmt_ascii_format_one (GMT, N, wesn[YHI], GMT_IS_LAT);
			/* Loop over all columns at this level */
			col = 0;
			wesn[XLO] = ext_wesn[XLO];
			gmt_ascii_format_one (GMT, W, wesn[XLO], GMT_IS_LON);
			while (wesn[XLO] < (G->header->wesn[XHI]-G->header->inc[GMT_X])) {
				uint64_t trow, tcol;
				wesn[XHI] = wesn[XLO] + factor * Ctrl->L.size * G->header->inc[GMT_X];	/* So right column may extend beyond grid and be transparent */
				gmt_ascii_format_one (GMT, E, wesn[XHI], GMT_IS_LON);
				/* Now we have the current tile region */
				if ((T = GMT_Read_Data (API, GMT_IS_GRID, GMT_IS_FILE, GMT_IS_SURFACE, GMT_CONTAINER_AND_DATA, wesn, Zgrid, NULL)) == NULL) {
					GMT_Report (API, GMT_MSG_NORMAL, "Unable to read in grid tile!\n");
					Return (API->error);
				}
				/* Determine if we have any non-NaN data points inside this grid */
				for (trow = 0, use_tile = false; !use_tile && trow < T->header->n_rows; trow++) {
					for (tcol = 0; !use_tile && tcol < T->header->n_columns; tcol++) {
						node = gmt_M_ijp (T->header, trow, tcol);
						use_tile = !gmt_M_is_fnan (T->data[node]);
					}
				}
					
				if (use_tile) {	/* Found data inside this tile, make plot and rasterize */
					/* Build the grdimage command to make the PostScript plot */
					char z_data[GMT_STR16] = {""}, psfile[PATH_MAX] = {""};
					/* Open the grid subset as a virtual file we can pass to grdimage */
					if (GMT_Open_VirtualFile (API, GMT_IS_GRID, GMT_IS_SURFACE, GMT_IN, T, z_data) == GMT_NOTSET) {
						GMT_Report (API, GMT_MSG_NORMAL, "Unable to open grid tile as virtual file!\n");
						Return (API->error);
					}
					/* Will pass -Qn to notify us if there was no valid image data imated */
					sprintf (psfile, "grd2kml_tile_tmp_%6.6d.ps", uniq);
					if (Ctrl->I.active)
						sprintf (cmd, "%s -I%s -JX%3.2lfid -X0 -Y0 -Qn -R%s/%s/%s/%s -Vn --PS_MEDIA=%3.2lfix%3.2lfi ->%s", z_data, Igrid, dim, W, E, S, N, dim, dim, psfile);
					else
						sprintf (cmd, "%s -JX%3.2lfid -X0 -Y0 -Qn -R%s/%s/%s/%s -Vn --PS_MEDIA=%3.2lfix%3.2lfi ->%s", z_data, dim, W, E, S, N, dim, dim, psfile);
					if (Ctrl->C.active) {strcat (cmd, " -C"); strcat (cmd, Ctrl->C.file); }
					error = GMT_Call_Module (API, "grdimage", GMT_MODULE_CMD, cmd);
					GMT_Close_VirtualFile (API, z_data);
					if (GMT_Destroy_Data (API, &T) != GMT_NOERROR) {
						GMT_Report (API, GMT_MSG_NORMAL, "Unable to free memory of grid tile!\n");
						Return (API->error);
					}
					if (error == GMT_IMAGE_NO_DATA) {	/* Must have found non-Nans in the pad since the image is all NaN? */
						GMT_Report (API, GMT_MSG_VERBOSE, "No image content for current tile (%d, %d, %d) - skipped\n", level, row, col);
						gmt_remove_file (GMT, psfile);
						n_bummer++;
					}
					else {	/* Made a meaningful plot, time to rip. */
						/* Create the psconvert command to convert the PS to transparent PNG */
						GMT_Report (GMT->parent, GMT_MSG_VERBOSE, "Level %d: Mapped tile %s/%s/%s/%s\n", level, W, E, S, N);
						if (Ctrl->S.active)
							sprintf (cmd, "-TG -E100 -P -Vn -Z -D%s/%s -FL%dR%dC%d.png %s", Ctrl->N.prefix, Ctrl->N.prefix, level, row, col, psfile);
						else
							sprintf (cmd, "-TG -E100 -P -Vn -Z -D%s -FR%dC%d.png %s", level_dir, row, col, psfile);
						if (GMT_Call_Module (API, "psconvert", GMT_MODULE_CMD, cmd)) {
							GMT_Report (API, GMT_MSG_NORMAL, "Unable to rasterize current PNG tile!\n");
							Return (API->error);
						}
						/* Update our list of tiles */
						Q[n] = gmt_M_memory (GMT, NULL, 1, struct GMT_QUADTREE);
						Q[n]->row = row; Q[n]->col = col;	Q[n]->level = level;
						Q[n]->wesn[XLO] = wesn[XLO];	Q[n]->wesn[XHI] = wesn[XHI];
						Q[n]->wesn[YLO] = wesn[YLO];	Q[n]->wesn[YHI] = wesn[YHI];
						sprintf (Q[n]->tag, "L%2.2dR%2.2dC%2.2d", level, row, col);
						if (++n == n_alloc) {	/* Extend the array */
							n_alloc <<= 1;
							Q = gmt_M_memory (GMT, Q, n_alloc, struct GMT_QUADTREE *);
						}
					}
				}
				else {	/* Just NaNs inside this tile */
					GMT_Report (API, GMT_MSG_LONG_VERBOSE, "Level %d: Tile %s/%s/%s/%s had no data - skipped\n", level, W, E, S, N);
					n_skip++;
				}
				col++;	/* Onwards to next column */
				wesn[XLO] = wesn[XHI];
				strcpy (W, E);
			}
			row++;	/* Onwards to next row */
			wesn[YLO] = wesn[YHI];
			strcpy (S, N);
		}
		GMT_Report (GMT->parent, GMT_MSG_VERBOSE, "Summary Level %d: %d by %d = %d tiles, %d mapped, %d empty\n", level, row, col, row*col, row*col - n_skip, n_skip);
		if (level < max_level) {	/* Delete the temporary filtered grid(s) */
			gmt_remove_file (GMT, Zgrid);
			if (Ctrl->I.active) gmt_remove_file (GMT, Igrid);
		}
	}

	GMT_Report (GMT->parent, GMT_MSG_DEBUG, "Found %d tiles that passed the no-NaN test but gave a blank image (?)\n", n_bummer);
	
	/* Clean up any temporary grids */
	
	if (z_extend && !access (DataGrid, F_OK))
		gmt_remove_file (GMT, DataGrid);
	if (i_extend && !access (IntensGrid, F_OK))
		gmt_remove_file (GMT, IntensGrid);
	if (Ctrl->I.derive) 		
		gmt_remove_file (GMT, Ctrl->I.file);
		
	/* Process quadtree links */
	
	GMT_Report (GMT->parent, GMT_MSG_VERBOSE, "Processes quadtree links for %d tiles.\n", n);
	Q = gmt_M_memory (GMT, Q, n, struct GMT_QUADTREE *);	/* Final size */
	for (level = max_level; level > 0; level--) {
		for (k = 0; k < n; k++) {
			if (Q[k]->level != level) continue;	/* Only deal with this level here */
			/* Determine the parent tile and the quad (0-3) we belong to */
			/* This is the parent row and col since we increase by a factor of 2 each time */
			row = Q[k]->row / 2;	col = Q[k]->col / 2;
			/* The quad is given by comparing the high and low values of row, col */
			quad = 2 * (Q[k]->row - 2 * row) + (Q[k]->col - 2 * col);
			kk = find_quad_above (Q, n, row, col, level-1);	/* kk is the parent of k */
			if (kk < 0) {
				GMT_Report (GMT->parent, GMT_MSG_NORMAL, "Unable to link tile for row = %d, col = %d at level %d to a parent (!?) - skipped.\n", row, col, level);
				continue;
			}
			assert (quad < 4);	/* Sanity check */
			Q[kk]->next[quad] = Q[k];	/* Do the linking */
			Q[kk]->q++;			/* Count the links for this parent */
		}
	}
	
	/* Create the top-level KML file */ 
	sprintf (file, "%s/%s.kml", Ctrl->N.prefix, Ctrl->N.prefix);
	if ((fp = fopen (file, "w")) == NULL) {
		GMT_Report (API, GMT_MSG_NORMAL, "Unable to create file : %s\n", file);
		Return (GMT_RUNTIME_ERROR);
	}
	fprintf (fp, "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n  <kml xmlns=\"http://www.opengis.net/kml/2.2\">\n");
	fprintf (fp, "    <Document>\n      <name>%s</name>\n", Ctrl->N.prefix);
	fprintf (fp, "      <description>GMT image quadtree</description>\n\n");
        fprintf (fp, "      <Style>\n");
        fprintf (fp, "        <ListStyle id=\"hideChildren\">          <listItemType>checkHideChildren</listItemType>\n        </ListStyle>\n");
        fprintf (fp, "      </Style>\n");
#if 0
	if (Ctrl->S.active)
		fprintf (fp, "      <NetworkLink>\n        <name>%s/L0R0C0.png</name>\n", Ctrl->N.prefix);
	else if (Ctrl->E.active)
		fprintf (fp, "      <NetworkLink>\n        <name>%s/0/R0C0.png</name>\n", Ctrl->E.url);
	else
		fprintf (fp, "      <NetworkLink>\n        <name>0/R0C0.png</name>\n");
#endif
	set_dirpath (Ctrl->S.active, NULL, Ctrl->N.prefix, 0, 1, path);
	fprintf (fp, "      <NetworkLink>\n        <name>%sR0C0.png</name>\n", path);
	fprintf (fp, "        <Region>\n          <LatLonAltBox>\n");
	fprintf (fp, "            <north>%.14g</north>\n", G->header->wesn[YHI]);
	fprintf (fp, "            <south>%.14g</south>\n", G->header->wesn[YLO]);
	fprintf (fp, "            <east>%.14g</east>\n",   G->header->wesn[XHI]);
	fprintf (fp, "            <west>%.14g</west>\n",   G->header->wesn[XLO]);
	fprintf (fp, "          </LatLonAltBox>\n");
	fprintf (fp, "          <Lod>\n            <minLodPixels>128</minLodPixels>\n            <maxLodPixels>-1</maxLodPixels>\n          </Lod>\n");
        fprintf (fp, "        </Region>\n");
	set_dirpath (Ctrl->S.active, Ctrl->E.url, Ctrl->N.prefix, 0, 1, path);
	fprintf (fp, "        <Link>\n          <href>%sR0C0.kml</href>\n", path);
	fprintf (fp, "          <viewRefreshMode>onRegion</viewRefreshMode>\n          <viewFormat/>\n");
	fprintf (fp, "        </Link>\n      </NetworkLink>\n");
	fprintf (fp, "    </Document>\n  </kml>\n");
	fclose (fp);

	/* Then create all the other KML files in the quadtree with their links down the tree */
	
	for (k = 0; k < n; k++) {
		if (Q[k]->q) {	/* Only examine tiles with children */
			if (Ctrl->D.active) {
				printf ("%s:", Q[k]->tag);
				for (quad = 0; quad < 4; quad++)
					if (Q[k]->next[quad]) printf (" %c=%s", 'A'+quad, Q[k]->next[quad]->tag);
				printf ("\n");
			}
			if (Ctrl->S.active)
				sprintf (file, "%s/%s/L%dR%dC%d.kml", Ctrl->N.prefix, Ctrl->N.prefix, Q[k]->level, Q[k]->row, Q[k]->col);
			else
				sprintf (file, "%s/%d/R%dC%d.kml", Ctrl->N.prefix, Q[k]->level, Q[k]->row, Q[k]->col);
			if ((fp = fopen (file, "w")) == NULL) {
				GMT_Report (API, GMT_MSG_NORMAL, "Unable to create file : %s\n", file);
				Return (GMT_RUNTIME_ERROR);
			}
			/* First this tile's kml and png */
			fprintf (fp, "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n  <kml xmlns=\"http://www.opengis.net/kml/2.2\">\n");
			set_dirpath (Ctrl->S.active, NULL, Ctrl->N.prefix, Q[k]->level, 1, path);
			fprintf (fp, "    <Document>\n      <name>%sR%dC%d.kml</name>\n", path, Q[k]->row, Q[k]->col);
			fprintf (fp, "      <description></description>\n\n");
		        fprintf (fp, "      <Style>\n");
		        fprintf (fp, "        <ListStyle id=\"hideChildren\">          <listItemType>checkHideChildren</listItemType>\n        </ListStyle>\n");
		        fprintf (fp, "      </Style>\n");
		        fprintf (fp, "      <Region>\n        <LatLonAltBox>\n");
			fprintf (fp, "          <north>%.14g</north>\n", Q[k]->wesn[YHI]);
			fprintf (fp, "          <south>%.14g</south>\n", Q[k]->wesn[YLO]);
			fprintf (fp, "          <east>%.14g</east>\n",   Q[k]->wesn[XHI]);
			fprintf (fp, "          <west>%.14g</west>\n",   Q[k]->wesn[XLO]);
			fprintf (fp, "        </LatLonAltBox>\n");
			fprintf (fp, "        <Lod>\n          <minLodPixels>128</minLodPixels>\n          <maxLodPixels>2048</maxLodPixels>\n        </Lod>\n");
		        fprintf (fp, "      </Region>\n");
			fprintf (fp, "      <GroundOverlay>\n        <drawOrder>%d</drawOrder>\n", 10+2*Q[k]->level);
			set_dirpath (Ctrl->S.active, NULL, Ctrl->N.prefix, Q[k]->level, 0, path);
			fprintf (fp, "        <Icon>\n          <href>%sR%dC%d.png</href>\n        </Icon>\n", path, Q[k]->row, Q[k]->col);
		        fprintf (fp, "        <LatLonBox>\n");
			fprintf (fp, "           <north>%.14g</north>\n", Q[k]->wesn[YHI]);
			fprintf (fp, "           <south>%.14g</south>\n", Q[k]->wesn[YLO]);
			fprintf (fp, "           <east>%.14g</east>\n",   Q[k]->wesn[XHI]);
			fprintf (fp, "           <west>%.14g</west>\n",   Q[k]->wesn[XLO]);
			fprintf (fp, "        </LatLonBox>\n      </GroundOverlay>\n");
			/* Now add up to 4 quad links */
			for (quad = 0; quad < 4; quad++) {
				if (Q[k]->next[quad] == NULL) continue;
					
				set_dirpath (Ctrl->S.active, NULL, Ctrl->N.prefix, Q[k]->next[quad]->level, 1, path);
				fprintf (fp, "\n      <NetworkLink>\n        <name>%sR%dC%d.png</name>\n", path, Q[k]->next[quad]->row, Q[k]->next[quad]->col);
			        fprintf (fp, "        <Region>\n          <LatLonAltBox>\n");
				fprintf (fp, "            <north>%.14g</north>\n", Q[k]->next[quad]->wesn[YHI]);
				fprintf (fp, "            <south>%.14g</south>\n", Q[k]->next[quad]->wesn[YLO]);
				fprintf (fp, "            <east>%.14g</east>\n",   Q[k]->next[quad]->wesn[XHI]);
				fprintf (fp, "            <west>%.14g</west>\n",   Q[k]->next[quad]->wesn[XLO]);
				fprintf (fp, "        </LatLonAltBox>\n");
				fprintf (fp, "        <Lod>\n          <minLodPixels>128</minLodPixels>\n          <maxLodPixels>-1</maxLodPixels>\n        </Lod>\n");
			        fprintf (fp, "        </Region>\n");
				set_dirpath (Ctrl->S.active, NULL, Ctrl->N.prefix, Q[k]->next[quad]->level, -1, path);
				fprintf (fp, "        <Link>\n          <href>%sR%dC%d.kml</href>\n", path, Q[k]->next[quad]->row, Q[k]->next[quad]->col);
				fprintf (fp, "          <viewRefreshMode>onRegion</viewRefreshMode><viewFormat/>\n");
				fprintf (fp, "        </Link>\n      </NetworkLink>\n");
			}
			fprintf (fp, "    </Document>\n  </kml>\n");
			fclose (fp);
		        
		}
		gmt_M_free (GMT, Q[k]);	/* Free this tile information */
	}
	gmt_M_free (GMT, Q);
	GMT_Report (API, GMT_MSG_VERBOSE, "Done: %d files written to directory %s\n", 2*n+1, Ctrl->N.prefix);
	Return (GMT_NOERROR);
}