%%%% model selection by Discrepancy Principle 
	n = length(y);

	DPx = k;
	DPy = log10(( A * x_est - y )'*( A * x_est - y ));
	epsilon=5;
    DPt=log10(n*epsilon^2);  % thresh hold value from noise lebel


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
