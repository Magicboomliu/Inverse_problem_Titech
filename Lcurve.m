%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                          Lcurve.m                          %%%
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


%%% L-curve method %%%

    Lx = log10(( y - A * x_est )'* ( y - A * x_est ));  %log10(|y-A*x_est|^2) LogSSRÅisum of squared residualsÅj
	Ly = log10(x_est'*x_est);         %log10( |x_est|^2)
    Lsum = log10(( y - A * x_est )'* ( y - A * x_est ) + x_est'*x_est);

%%% Use the following variables.
%
%   A : Operating matrix
%   y : Output
%
%   x_est : x estimated by y
%
