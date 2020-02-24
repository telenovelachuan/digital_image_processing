% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 7602.436269103714039 ; 7979.493999730117139 ];

%-- Principal point:
cc = [ -497.438015694713556 ; 1249.533505540796796 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.430169458505047 ; 0.589881530333746 ; -0.042232574467070 ; 0.281387648014716 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 140.377776717523062 ; 73.815343243558971 ];

%-- Principal point uncertainty:
cc_error = [ 0.000000000000000 ; 0.000000000000000 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.116607454253471 ; 0.251358506394604 ; 0.003382505288297 ; 0.025863414869506 ; 0.000000000000000 ];

%-- Image size:
nx = 4032;
ny = 3024;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 12;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 0;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.898580e+00 ; 1.900325e+00 ; 4.982891e-01 ];
Tc_1  = [ 1.094057e+02 ; -3.165474e+01 ; 6.825433e+02 ];
omc_error_1 = [ 5.340670e-03 ; 5.186675e-03 ; 8.724585e-03 ];
Tc_error_1  = [ 1.076137e+00 ; 1.337761e-01 ; 5.975019e+00 ];

%-- Image #2:
omc_2 = [ 1.194352e+00 ; 2.541173e+00 ; 4.814956e-01 ];
Tc_2  = [ 1.916263e+02 ; -6.982523e+01 ; 7.833077e+02 ];
omc_error_2 = [ 4.888969e-03 ; 9.000253e-03 ; 6.306270e-03 ];
Tc_error_2  = [ 1.321806e+00 ; 1.573112e-01 ; 7.259521e+00 ];

%-- Image #3:
omc_3 = [ 1.279640e-01 ; 3.137686e+00 ; 7.453947e-03 ];
Tc_3  = [ 3.013336e+02 ; -7.611862e+01 ; 9.039219e+02 ];
omc_error_3 = [ 3.718421e-03 ; 2.333175e-02 ; 1.764721e-02 ];
Tc_error_3  = [ 1.703971e+00 ; 2.861122e-01 ; 8.717635e+00 ];

%-- Image #4:
omc_4 = [ -1.070855e+00 ; 2.637749e+00 ; -5.763237e-01 ];
Tc_4  = [ 3.209696e+02 ; 2.798878e+00 ; 8.647568e+02 ];
omc_error_4 = [ 4.622718e-03 ; 9.405757e-03 ; 6.894901e-03 ];
Tc_error_4  = [ 1.866161e+00 ; 3.671692e-01 ; 8.160227e+00 ];

%-- Image #5:
omc_5 = [ 1.187891e+00 ; -1.796578e+00 ; -8.475308e-01 ];
Tc_5  = [ 2.308305e+02 ; 5.615352e+01 ; 6.478453e+02 ];
omc_error_5 = [ 2.228921e-03 ; 3.984320e-03 ; 3.534995e-03 ];
Tc_error_5  = [ 1.586395e+00 ; 2.477292e-01 ; 6.485623e+00 ];

%-- Image #6:
omc_6 = [ 2.092399e+00 ; -9.865290e-01 ; -1.055290e+00 ];
Tc_6  = [ 2.043308e+02 ; 1.236172e+02 ; 7.398098e+02 ];
omc_error_6 = [ 4.213830e-03 ; 2.352551e-03 ; 5.984307e-03 ];
Tc_error_6  = [ 1.384040e+00 ; 2.882400e-01 ; 6.913276e+00 ];

%-- Image #7:
omc_7 = [ 2.601026e-01 ; -2.152446e+00 ; -3.210293e-01 ];
Tc_7  = [ 2.647823e+02 ; -4.313618e+01 ; 8.846854e+02 ];
omc_error_7 = [ 1.525804e-03 ; 5.321718e-03 ; 5.264383e-03 ];
Tc_error_7  = [ 1.931454e+00 ; 3.287677e-01 ; 8.565915e+00 ];

%-- Image #8:
omc_8 = [ 1.177113e+00 ; -1.656723e+00 ; -9.281808e-01 ];
Tc_8  = [ 2.284118e+02 ; 5.242253e+01 ; 7.234751e+02 ];
omc_error_8 = [ 1.971344e-03 ; 3.134937e-03 ; 2.995480e-03 ];
Tc_error_8  = [ 1.624213e+00 ; 2.431173e-01 ; 7.146102e+00 ];

%-- Image #9:
omc_9 = [ 2.519661e+00 ; -4.529349e-01 ; -1.291257e+00 ];
Tc_9  = [ 2.286409e+02 ; 1.457578e+02 ; 9.526427e+02 ];
omc_error_9 = [ 5.913309e-03 ; 1.979653e-03 ; 7.764575e-03 ];
Tc_error_9  = [ 1.652357e+00 ; 2.638619e-01 ; 8.351493e+00 ];

%-- Image #10:
omc_10 = [ 6.575682e-01 ; -1.877536e+00 ; -7.067522e-01 ];
Tc_10  = [ 2.313755e+02 ; 2.409411e+01 ; 7.465837e+02 ];
omc_error_10 = [ 1.757010e-03 ; 3.203720e-03 ; 3.262206e-03 ];
Tc_error_10  = [ 1.591825e+00 ; 2.631272e-01 ; 7.452742e+00 ];

%-- Image #11:
omc_11 = [ -2.603763e+00 ; -6.304169e-02 ; 1.522810e+00 ];
Tc_11  = [ 1.909590e+02 ; 1.145925e+02 ; 9.988386e+02 ];
omc_error_11 = [ 4.220917e-03 ; 1.922557e-03 ; 6.654796e-03 ];
Tc_error_11  = [ 1.548104e+00 ; 2.121748e-01 ; 8.126244e+00 ];

%-- Image #12:
omc_12 = [ -1.002803e+00 ; -1.716819e+00 ; 7.470761e-01 ];
Tc_12  = [ 1.640323e+02 ; -7.157511e+01 ; 8.700739e+02 ];
omc_error_12 = [ 1.789540e-03 ; 2.978145e-03 ; 3.275047e-03 ];
Tc_error_12  = [ 1.433185e+00 ; 1.496006e-01 ; 6.948005e+00 ];

