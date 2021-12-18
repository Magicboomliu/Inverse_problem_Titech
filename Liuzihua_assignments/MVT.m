%%%% model selection validation test using 2data set
	n = length(y);

	MVTx = k;
	MVTy =log10( ( A * x_est - y )' * ( A * x_est - y ) );
    MVTy_test=log10( ( A * x_est - y_test )' * ( A * x_est - y_test ) );


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
