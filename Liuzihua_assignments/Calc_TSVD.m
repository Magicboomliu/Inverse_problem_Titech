%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                        Calc_TSVD.m                         %%%
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
	k = input('k = ');
	TSVD;

%%% Plot results %%%
	figure(1);
	plot(dx,x,'b-',dx,x_est,'r-');
    xlabel(' days ');
    ylabel(' heat flux ');
    legend('true','estimated');
	title('result  by Truncated Singular Value Decomposition');
    
	%axis([0,100,0,1.2]);


	figure(2);
	semilogy(s,'bo');
	title('Singular Values');
    xlabel(' rank ') ;
	hold on;
	semilogy(s(1:k),'rs');
	hold off;

