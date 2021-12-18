%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                            TR.m                            %%%
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


%%% Tikhonov regularization %%%
	[i,j] = size(A);
	
	d = ones(j,1) ;
	I = diag(d); % form identity matrix
    
	x_est = inv(A'*A+a^2*I)*A'*y; % =argmin ((A*x-y)'*(A*x-y)+a^2(x'*x));


%%% Use the following variables.
%
%   A : Operating matrix
%   y : Output data
%
%   i : Row size of A
%   j : Column size of A
%
%   
%
%   a : Regularization parameter
%
