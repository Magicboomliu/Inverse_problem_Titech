%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                      Calc_TSVD_AIC.m                       %%%
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

Input_data;


%%%%%% Inverse Analysis ( y = A * x ) %%%%%%

%%% Truncated Singular Value Decomposition %%%
	for k = 1:xn./2
		TSVD;

		AIC;
		AIC_x(k) = AICx;
		AIC_y(k) = AICy;
	end

	figure(2);
	semilogy(s,'bo');
	xlabel('Singular Value');

	figure(3);
	plot(AIC_x,AIC_y,'b-');
	xlabel('AIC');

	%%% Set the best k %%%
	k = input('k = ');
	TSVD;


%%% Plot results %%%
	figure(1);
	plot(dx,x,'b-',dx,x_est,'r-');
	axis([0,30,0,6000]);
    xlabel(' depth ');
    ylabel(' slowness ');
    legend('true','estimated');
	title('VSP result  by Truncated Singular Value Decomposition');

	figure(2);
	semilogy(s,'bo');
    title('Singular Values');
    xlabel(' rank ') ;
	hold on;
	semilogy(s(1:k),'rs');
	hold off;

	figure(3);
	plot(AIC_x,AIC_y,'b-');
    title('AIC');
    xlabel(' truncation rank k')
    ylabel('AIC')
	hold on;
	plot(AIC_x(k),AIC_y(k),'ro','MarkerSize',20);
	hold off;
