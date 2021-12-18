%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                           TSVD.m                           %%%
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


%%% Truncated Singular Value Decomposition %%%
	[i,j] = size(A);
	[U,S,V] = svd(A);
	s = diag(S);

	t = [ones(k,1)./s(1:k,1);zeros(j-k,1)];   %   truncate after k rank of vector s
                    %  t(1:k)=1.0./s(1:k); t(k+1:end)=0;

	T = [ diag(t), zeros(j,i-j) ];
	x_est = V*T*U'*y;  %   VTU'y


%%% Use the following variables.
%
%   A : Operating matrix
%   y : Output
%
%   i : Row size of A
%   j : Column size of A
%
%   U,S,V : Singular value decomposition of A; "A = U * S * V'".
%   s : Main diagonal of S
%
%   k : Regularization parameter
%
