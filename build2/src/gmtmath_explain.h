/*--------------------------------------------------------------------
 *
 *
 *  Copyright (c) 1991-2018 by P. Wessel, W. H. F. Smith, R. Scharroo,
 *  F. Wobbe, and J. Luis
 *  See LICENSE.TXT file for copying and redistribution conditions.
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation; version 3 or any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  Contact info: gmt.soest.hawaii.edu
 *--------------------------------------------------------------------
 *
 *  gmtmath_explain.h is automatically generated by CMake. Do NOT edit manually!
 */

	GMT_Message (API, GMT_TIME_NONE, 
		"	ABS        1  1    abs (A)\n"
		"	ACOS       1  1    acos (A)\n"
		"	ACOSH      1  1    acosh (A)\n"
		"	ACOT       1  1    acot (A)\n"
		"	ACOTH      1  1    acoth (A)\n"
		"	ACSC       1  1    acsc (A)\n"
		"	ACSCH      1  1    acsch (A)\n"
		"	ADD        2  1    A + B\n"
		"	AND        2  1    B if A == NaN, else A\n"
		"	ASEC       1  1    asec (A)\n"
		"	ASECH      1  1    asech (A)\n"
		"	ASIN       1  1    asin (A)\n"
		"	ASINH      1  1    asinh (A)\n"
		"	ATAN       1  1    atan (A)\n"
		"	ATAN2      2  1    atan2 (A, B)\n"
		"	ATANH      1  1    atanh (A)\n"
		"	BCDF       3  1    Binomial cumulative distribution function for p = A, n = B and x = C\n"
		"	BEI        1  1    bei (A)\n"
		"	BER        1  1    ber (A)\n"
		"	BPDF       3  1    Binomial probability density function for p = A, n = B and x = C\n"
		"	BITAND     2  1    A & B (bitwise AND operator)\n"
		"	BITLEFT    2  1    A << B (bitwise left-shift operator)\n"
		"	BITNOT     1  1    ~A (bitwise NOT operator, i.e., return two's complement)\n"
		"	BITOR      2  1    A | B (bitwise OR operator)\n"
		"	BITRIGHT   2  1    A >> B (bitwise right-shift operator)\n"
		"	BITTEST    2  1    1 if bit B of A is set, else 0 (bitwise TEST operator)\n"
		"	BITXOR     2  1    A ^ B (bitwise XOR operator)\n"
		"	CEIL       1  1    ceil (A) (smallest integer >= A)\n"
		"	CHI2CRIT   2  1    Chi-squared distribution critical value for alpha = A and nu = B\n"
		"	CHI2CDF    2  1    Chi-squared cumulative distribution function for chi2 = A and nu = B\n"
		"	CHI2PDF    2  1    Chi-squared probability density function for chi = A and nu = B\n"
		"	COL        1  1    Places column A on the stack\n"
		"	COMB       2  1    Combinations n_C_r, with n = A and r = B\n"
		"	CORRCOEFF  2  1    Correlation coefficient r(A, B)\n"
		"	COS        1  1    cos (A) (A in radians)\n"
		"	COSD       1  1    cos (A) (A in degrees)\n"
		"	COSH       1  1    cosh (A)\n"
		"	COT        1  1    cot (A) (A in radians)\n"
		"	COTD       1  1    cot (A) (A in degrees)\n"
		"	COTH       1  1    coth (A)\n"
		"	CSC        1  1    csc (A) (A in radians)\n"
		"	CSCD       1  1    csc (A) (A in degrees)\n"
		"	CSCH       1  1    csch (A)\n"
		"	PCDF       2  1    Poisson cumulative distribution function for x = A and lambda = B\n"
		"	DDT        1  1    d(A)/dt Central 1st derivative\n"
		"	D2DT2      1  1    d^2(A)/dt^2 2nd derivative\n"
		"	D2R        1  1    Converts Degrees to Radians\n"
		"	DENAN      2  1    Replace NaNs in A with values from B\n"
		"	DILOG      1  1    dilog (A)\n"
		"	DIFF       1  1    Difference (forward) between adjacent elements of A (A[1]-A[0], A[2]-A[1], ..., NaN)\n"
		"	DIV        2  1    A / B\n"
		"	DUP        1  2    Places duplicate of A on the stack\n"
		"	ECDF       2  1    Exponential cumulative distribution function for x = A and lambda = B\n"
		"	ECRIT      2  1    Exponential distribution critical value for alpha = A and lambda = B\n"
		"	EPDF       2  1    Exponential probability density function for x = A and lambda = B\n"
		"	ERF        1  1    Error function erf (A)\n"
		"	ERFC       1  1    Complementary Error function erfc (A)\n"
		"	ERFINV     1  1    Inverse error function of A\n"
		"	EQ         2  1    1 if A == B, else 0\n"
		"	EXCH       2  2    Exchanges A and B on the stack\n"
		"	EXP        1  1    exp (A)\n"
		"	FACT       1  1    A! (A factorial)\n"
		"	FCRIT      3  1    F distribution critical value for alpha = A, nu1 = B, and nu2 = C\n"
		"	FCDF       3  1    F cumulative distribution function for F = A, nu1 = B, and nu2 = C\n"
		"	FLIPUD     1  1    Reverse order of each column\n"
		"	FLOOR      1  1    floor (A) (greatest integer <= A)\n"
		"	FMOD       2  1    A % B (remainder after truncated division)\n"
		"	FPDF       3  1    F probability density distribution for F = A, nu1 = B and nu2 = C\n"
		"	GE         2  1    1 if A >= B, else 0\n"
		"	GT         2  1    1 if A > B, else 0\n"
		"	HYPOT      2  1    hypot (A, B) = sqrt (A*A + B*B)\n"
		"	I0         1  1    Modified Bessel function of A (1st kind, order 0)\n"
		"	I1         1  1    Modified Bessel function of A (1st kind, order 1)\n"
		"	IFELSE     3  1    B if A != 0, else C\n"
		"	IN         2  1    Modified Bessel function of A (1st kind, order B)\n"
		"	INRANGE    3  1    1 if B <= A <= C, else 0\n"
		"	INT        1  1    Numerically integrate A\n"
		"	INV        1  1    1 / A\n"
		"	ISFINITE   1  1    1 if A is finite, else 0\n"
		"	ISNAN      1  1    1 if A == NaN, else 0\n"
		"	J0         1  1    Bessel function of A (1st kind, order 0)\n"
		"	J1         1  1    Bessel function of A (1st kind, order 1)\n"
		"	JN         2  1    Bessel function of A (1st kind, order B)\n"
		"	K0         1  1    Modified Kelvin function of A (2nd kind, order 0)\n"
		"	K1         1  1    Modified Bessel function of A (2nd kind, order 1)\n"
		"	KN         2  1    Modified Bessel function of A (2nd kind, order B)\n"
		"	KEI        1  1    kei (A)\n"
		"	KER        1  1    ker (A)\n"
		"	KURT       1  1    Kurtosis of A\n"
		"	LCDF       1  1    Laplace cumulative distribution function for z = A\n"
		"	LCRIT      1  1    Laplace distribution critical value for alpha = A\n"
		"	LE         2  1    1 if A <= B, else 0\n"
		"	LMSSCL     1  1    LMS scale estimate (LMS STD) of A\n"
		"	LMSSCLW    1  1    Weighted LMS scale estimate (LMS STD) of A for weights in B\n"
		"	LOG        1  1    log (A) (natural log)\n"
		"	LOG10      1  1    log10 (A) (base 10)\n"
		"	LOG1P      1  1    log (1+A) (accurate for small A)\n"
		"	LOG2       1  1    log2 (A) (base 2)\n"
		"	LOWER      1  1    The lowest (minimum) value of A\n"
		"	LPDF       1  1    Laplace probability density function for z = A\n"
		"	LRAND      2  1    Laplace random noise with mean A and std. deviation B\n"
		"	LSQFIT     1  0    Current table is [A | b]; return LS solution to A * x = b via Cholesky decomposition\n"
		"	LT         2  1    1 if A < B, else 0\n"
		"	MAD        1  1    Median Absolute Deviation (L1 STD) of A\n"
		"	MADW       2  1    Weighted Median Absolute Deviation (L1 STD) of A for weights in B\n"
		"	MAX        2  1    Maximum of A and B\n"
		"	MEAN       1  1    Mean value of A\n"
		"	MEANW      2  1    Weighted mean value of A for weights in B\n"
		"	MEDIAN     1  1    Median value of A\n"
		"	MEDIANW    2  1    Weighted median value of A for weights in B\n"
		"	MIN        2  1    Minimum of A and B\n"
		"	MOD        2  1    A mod B (remainder after floored division)\n"
		"	MODE       1  1    Mode value (Least Median of Squares) of A\n"
		"	MODEW      2  1    Weighted mode value of A for weights in B\n"
		"	MUL        2  1    A * B\n"
		"	NAN        2  1    NaN if A == B, else A\n"
		"	NEG        1  1    -A\n"
		"	NEQ        2  1    1 if A != B, else 0\n"
		"	NORM       1  1    Normalize (A) so max(A)-min(A) = 1\n"
		"	NOT        1  1    NaN if A == NaN, 1 if A == 0, else 0\n"
		"	NRAND      2  1    Normal, random values with mean A and std. deviation B\n"
		"	OR         2  1    NaN if B == NaN, else A\n"
		"	PERM       2  1    Permutations n_P_r, with n = A and r = B\n"
		"	PLM        3  1    Associated Legendre polynomial P(A) degree B order C\n"
		"	PLMg       3  1    Normalized associated Legendre polynomial P(A) degree B order C (geophysical convention)\n"
		"	POP        1  0    Delete top element from the stack\n"
		"	POW        2  1    A ^ B\n"
		"	PPDF       2  1    Poisson probability density function for x = A and lambda = B\n"
		"	PQUANT     2  1    The B'th Quantile (0-100%) of A\n"
		"	PQUANTW    3  1    The C'th Quantile (0-100%) of A for weights in B\n"
		"	PSI        1  1    Psi (or Digamma) of A\n"
		"	PV         3  1    Legendre function Pv(A) of degree v = real(B) + imag(C)\n"
		"	QV         3  1    Legendre function Qv(A) of degree v = real(B) + imag(C)\n"
		"	R2         2  1    R2 = A^2 + B^2\n"
		"	R2D        1  1    Convert Radians to Degrees\n"
		"	RAND       2  1    Uniform random values between A and B\n"
		"	RCDF       1  1    Rayleigh cumulative distribution function for z = A\n"
		"	RCRIT      1  1    Rayleigh distribution critical value for alpha = A\n"
		"	RPDF       1  1    Rayleigh probability density function for z = A\n"
		"	RINT       1  1    rint (A) (round to integral value nearest to A)\n"
		"	RMS        1  1    Root-mean-square of A\n"
		"	RMSW       2  1    Weighted Root-mean-square of A for weights in B\n"
		"	ROLL       2  0    Cyclicly shifts the top A stack items by an amount B\n"
		"	ROTT       2  1    Rotate A by the (constant) shift B in the t-direction\n"
		"	SEC        1  1    sec (A) (A in radians)\n"
		"	SECD       1  1    sec (A) (A in degrees)\n"
		"	SECH       1  1    sech (A)\n"
		"	SIGN       1  1    sign (+1 or -1) of A\n"
		"	SIN        1  1    sin (A) (A in radians)\n"
		"	SINC       1  1    sinc (A) (sin (pi*A)/(pi*A))\n"
		"	SIND       1  1    sin (A) (A in degrees)\n"
		"	SINH       1  1    sinh (A)\n"
		"	SKEW       1  1    Skewness of A\n"
		"	SORT       3  1    Sort all columns in stack based on column A in direction of B (-1 descending |+1 ascending)\n"
		"	SQR        1  1    A^2\n"
		"	SQRT       1  1    sqrt (A)\n"
		"	STD        1  1    Standard deviation of A\n"
		"	STDW       2  1    Weighted standard deviation of A for weights in B\n"
		"	STEP       1  1    Heaviside step function H(A)\n"
		"	STEPT      1  1    Heaviside step function H(t-A)\n"
		"	SUB        2  1    A - B\n"
		"	SUM        1  1    Cumulative sum of A\n"
		"	SVDFIT     1  0    Current table is [A | b]; return LS solution to A * x = B via SVD decomposition (see -E)\n"
		"	TAN        1  1    tan (A) (A in radians)\n"
		"	TAND       1  1    tan (A) (A in degrees)\n"
		"	TANH       1  1    tanh (A)\n"
		"	TAPER      1  1    Unit weights cosine-tapered to zero within A of end margins\n"
		"	TCDF       2  1    Student's t cumulative distribution function for t = A and nu = B\n"
		"	TN         2  1    Chebyshev polynomial Tn(-1<A<+1) of degree B\n"
		"	TPDF       2  1    Student's t probability density function for t = A and nu = B\n"
		"	TCRIT      2  1    Student's t distribution critical value for alpha = A and nu = B\n"
		"	UPPER      1  1    The highest (maximum) value of A\n"
		"	VAR        1  1    Variance of A\n"
		"	VARW       2  1    Weighted variance of A for weights in B\n"
		"	WCDF       3  1    Weibull cumulative distribution function for x = A, scale = B, and shape = C\n"
		"	WCRIT      3  1    Weibull distribution critical value for alpha = A, scale = B, and shape = C\n"
		"	WPDF       3  1    Weibull probability density function for x = A, scale = B and shape = C\n"
		"	XOR        2  1    B if A == NaN, else A\n"
		"	Y0         1  1    Bessel function of A (2nd kind, order 0)\n"
		"	Y1         1  1    Bessel function of A (2nd kind, order 1)\n"
		"	YN         2  1    Bessel function of A (2nd kind, order B)\n"
		"	ZCRIT      1  1    Normal distribution critical value for alpha = A\n"
		"	ZCDF       1  1    Normal cumulative distribution function for z = A\n"
		"	ZPDF       1  1    Normal probability density function for z = A\n"
		"	ROOTS      2  1    Treats col A as f(t) = 0 and returns its roots\n"
	);

/* vim: set ft=c: */