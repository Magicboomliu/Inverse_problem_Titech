%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                      Calc_TSVD_DP.m                       %%%
%%%                                                            %%%
%%%                     Kenji AMAYA                     %%%
%%%                                                            %%%
%%%                                                            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear;

Input_data;


%%%%%% Inverse Analysis ( y = A * x ) %%%%%%

%%% Truncated Singular Value Decomposition %%%
	for k = 1:xn./2
		TSVD;

		DP;
		DP_x(k) = DPx;
		DP_y(k) = DPy;
        DP_th(k)=DPt;
	end

	figure(2);
	semilogy(s,'bo');
	xlabel('Singular Value');

	figure(3);
	plot(DP_x,DP_y,'b-',DP_x,DP_th,'r-');
	xlabel('DP');

	%%% Set the best k %%%
	k = input('k = ');
	TSVD;


%%% Plot results %%%
	figure(1);
	plot(dx,x,'b-',dx,x_est,'r-');
	%axis([0,100,0,1.2]);
    xlabel(' days ');
    ylabel(' heat flux ');
    legend('true','estimated');
	title('result  by Truncated Singular Value Decomposition');

	figure(2);
	semilogy(s,'bo');
    title('Singular Values');
    xlabel(' rank ') ;
	hold on;
	semilogy(s(1:k),'rs');
	hold off;

	figure(3);
    	plot(DP_x,DP_y,'b-',DP_x,DP_th,'r-');
    title('DP');
    xlabel(' truncation rank k')
    ylabel('SSR')
	hold on;
	plot(DP_x(k),DP_y(k),'ro','MarkerSize',20);
	hold off;
