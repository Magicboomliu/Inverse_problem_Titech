%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                      Calc_TSVD_MVTm                       %%%
%%%                                                            %%%
%%%                     Kenji AMAYA                     %%%
%%%                                                            %%%
%%%                                                            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear;

Input_data;
y_test=Input_test_data();




%%%%%% Inverse Analysis ( y = A * x ) %%%%%%

%%% Truncated Singular Value Decomposition %%%
	for k = 1:xn./2
		TSVD;

		MVT;
		MVT_x(k) = MVTx;
		MVT_y(k) = MVTy;
        MVT_y_test(k) = MVTy_test;
        
	end

	figure(2);
	semilogy(s,'bo');
	xlabel('Singular Value');

	figure(3);
	plot(MVT_x,MVT_y,'b-',MVT_x,MVT_y_test,'r-');
	xlabel('Model Validation test');
    legend('training','test');

	%%% Set the best k %%%
	k = input('k = ');
	TSVD;


%%% Plot results %%%
	figure(1);
	plot(dx,x,'b-',dx,x_est,'r-');
	%axis([0,100,0,1.2]);
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

	plot(MVT_x,MVT_y,'b-',MVT_x,MVT_y_test,'r-');

	title('Model Validation test');

    xlabel(' truncation rank k')
    ylabel('SSR')
	hold on;
	plot(MVT_x(k),MVT_y(k),'ro','MarkerSize',20);
            legend('training','test','selected model');
	hold off;
    
    function y_test=Input_test_data()
    %%%%%% Input test data y %%%%%%
	fp_y = fopen('y_test.txt','r');
	yn = fscanf(fp_y,'%d',[1 1]);
	y_test = fscanf(fp_y,'%g',[2 yn]);
y_test = y_test(2,:)';
	fclose(fp_y);
    end
