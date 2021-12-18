%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                         Calc_TR.m                          %%%
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

%%% Tikhonov regularization %%%
	a = input('a = ');
	TR;

%%% Plot results %%%
	figure(1);
	plot(dx,x,'b-',dx,x_est,'r-');
    %axis([0,100,0,1.2]);
    xlabel(' days ');
    ylabel(' heat flux ');
    legend('true','estimated');
	title('result  by Tikhonov regularization');
