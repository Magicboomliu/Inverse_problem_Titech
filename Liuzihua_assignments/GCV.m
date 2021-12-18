%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                            GCV.m                           %%%
%%%                                                            %%%
%%%                        January 2015                        %%%
%%%                                                            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% Generalized Cross Validation %%%
  s_ = svd ( full ( A ) );
  t = 0;
  for i = 1 : size(s_)
    t = t + s_(i)^2 / ( s_(i)^2 + a^2 );
  end
  m = size(A, 1);

	
    
 GCVx = a;
 GCVy = ( ( y - A * x_est )' * ( y - A * x_est ) ) ^ 2 / ( m - t ) ^ 2;
    
  


%%% Use the following variables.
%
%   A : Operating matrix
%   y : Output
%
%   x_est : x estimated by y
%
%   s_ : The vector of singular values of A
%   t : Sum of the Tikhonov filter factors
%   m : The number of columns of A
%
