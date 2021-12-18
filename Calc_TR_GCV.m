%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                       Calc_TR_GCV.m                        %%%
%%%                                                            %%%
%%%                        January 2015                        %%%
%%%                                                            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear;

Input_data;


%%%%%% Inverse Analysis ( y = A * x ) %%%%%%

%%% Tikhonov regularization %%%
	%%% Make the GCV function G(a) graph %%%
	Ln = 50;
	for ii = 1:Ln + 1
		%%% Set parameter a %%%
		a_min = 0.0001;
		a_max = 10;

		a_(ii) = a_min .* ( a_max ./ a_min ) .^ ( ( ii - 1 ) ./ Ln );
		a = a_(ii);

		TR;

		GCV;
		GCV_x(ii) = GCVx;
		GCV_y(ii) = GCVy;
	end

	figure(2);loglog(GCV_x,GCV_y,'b-');
	xlabel('a');
  hold off;

	%%% Set the best a %%%
	a = input('a = ');
	TR;

	GCV;
	Xe = GCVx;
	Ye = GCVy;


%%% Plot results %%%
	figure(1);
	plot(dx,x,'b-',dx,x_est,'r-');
	%axis([0,100,0,1.2]);
	xlabel('Tikhonov regularization');

	figure(2);loglog(GCV_x,GCV_y,'b-');
	xlabel('GCV');
	hold on;
	plot(Xe,Ye,'ro','MarkerSize',20);
	hold off;
