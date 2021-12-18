%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                            NCP.m                           %%%
%%%                                                            %%%
%%%                        January 2015                        %%%
%%%                                                            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% normalized cumulative periodogram  %%%
  r_ = ( y - A * x_est );
  [p_, F] = periodogram( r_, hamming ( length( r_ ) ), length( r_ ), 1 ) ;
 
  q = floor ( length( r_ ) / 2 );
  c_ = zeros (q,1);

  p_sum = 0;
  for i = 2 : q+1
    p_sum = p_sum + p_(i);
  end
  c_white_ = zeros(q,1);
  for i = 1 : q
    c_white_(i) = i / q;
  end

  for i = 1 : q
    for j = 1 : i
     c_(i) = c_(i) + ( p_(j+1) / p_sum );  
    end
  end

	NCPx = a;
	NCPy = ( c_ - c_white_ )' * ( c_ - c_white_ );

%%% Use the following variables.
%
%   A : Operating matrix
%   y : Output
%
%   x_est : x estimated by y
%
%   r_ : Tikhonov residual vector
%   p_ : Power spectrum of r_
%   c_ : The vector whose elements involve the cumulated sums of the power spectrum
%
