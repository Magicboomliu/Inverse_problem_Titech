%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                           LSM.m                            %%%
%%%                                                            %%%
%%%                     Yoshinao KISHIMOTO                     %%%
%%%                                                            %%%
%%%   Department of Mechanical and Environmental Informatics   %%%
%%%   Graduate School of Information Science and Engineering   %%%
%%%               Tokyo Institute of Technology                %%%
%%%                                                            %%%
%%%                        November 2007                       %%%
%%%                                                            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Least square method %%%
	x_est = inv(A'*A)*A'*y;  % hint: argumet of min_x(|y-A*x|^2)


%%% Use the following variables.
%
%   A : Operating matrix
%   y : Output
%
