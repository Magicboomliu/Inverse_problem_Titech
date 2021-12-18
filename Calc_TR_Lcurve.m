%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                      Calc_TR_Lcurve.m                      %%%
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


clear;
close all;

Input_data;


%%%%%% Inverse Analysis ( y = A * x ) %%%%%%

%%% Tikhonov regularization %%%
	%%% Make L-curve %%%
	Ln = 100;
	for ii = 1:Ln + 1
		%%% Set parameter a %%%
		a_min = 0.001;
		a_max = 10;

		a_(ii) = a_min .* ( a_max ./ a_min ) .^ ( ( ii - 1 ) ./ Ln );
		a = a_(ii);

		TR;

		Lcurve;
		Lcurve_x(ii) = Lx;
		Lcurve_y(ii) = Ly;
        Lcurve_sum(ii) = Lsum;
	end

	figure(2);
    subplot(2,2,1);
    plot(Lcurve_x,Lcurve_y,'b-');
    xlabel('log10(|y-Ax|^2');
    ylabel('log10(|x|^2');
	title('L-curve');


     subplot(2,2,2);
    semilogx(a_,Lcurve_y,'b-',a_,Lcurve_x,'r-',a_,Lcurve_sum,'y-');
     legend('log10|x|^2','log10(|y-Ax|^2)','log10(|y-Ax|^2+|x|^2)');
	xlabel('a');

	%%% Set the best a %%%
	a = input('a = ');
	TR;

	Lcurve;
	Xe = Lx;
	Ye = Ly;


%%% Plot results %%%
	figure(2);
    subplot(2,2,3);
	plot(dx,x,'b-',dx,x_est,'r-');
    xlabel(' days  ');
    ylabel(' heat flux  ');
    
	%axis([0,100,0,1.2]);
	title('result of Tikhonov regularization');

	figure(2);
    subplot(2,2,1);
    plot(Lcurve_x,Lcurve_y,'b-');
    xlabel('log10(|y-Ax|^2');
    ylabel('log10(|x|^2');
	title('L-curve');
	hold on;
	plot(Xe,Ye,'ro','MarkerSize',20);
	hold off;

	 subplot(2,2,2);
    semilogx(a_,Lcurve_y,'b-',a_,Lcurve_x,'r-',a_,Lcurve_sum,'y-');
     legend('log10|x|^2','log10(|y-Ax|^2)','log10(|y-Ax|^2+|x|^2)');
   
	xlabel('a');
	hold on;
	plot(a,Xe,'ro','MarkerSize',20);
     legend('log10|x|^2','log10(|y-Ax|^2)','your choice');
	hold off;
