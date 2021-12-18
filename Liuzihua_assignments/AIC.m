%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                           AIC.m                            %%%
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


%%% Akaike's Information Criterion %%%
	n = length(y);

	AICx = k;   %  truncation rank k
	AICy = n*log10(( A * x_est - y )'*( A * x_est - y )) + 2*k;  %   n*log10( SSR )+ 2*k


%%% Use the following variables.
%
%   A : Operating matrix
%   y : Output
%
%   x_est : x estimated by y
%
%   n : Size of y
%
%   k : Regularization parameter
%
