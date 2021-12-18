%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                            %%%
%%%            Advanced Course of Inverse Analysis             %%%
%%%                                                            %%%
%%%                       Calc_TR_NCP.m                        %%%
%%%                                                            %%%
%%%                        January 2015                        %%%
%%%                                                            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear;

Input_data;


%%%%%% Inverse Analysis ( y = A * x ) %%%%%%

%%% Tikhonov regularization %%%
	%%% Make NCP criterion graph %%%
	Ln = 50;
	for ii = 1:Ln + 1
		%%% Set parameter a %%%
		a_min = 0.01;
		a_max = 1000;

		a_(ii) = a_min .* ( a_max ./ a_min ) .^ ( ( ii - 1 ) ./ Ln );
		a = a_(ii);

		TR;

		NCP;
    c__(:,ii) = c_;
    p__(:,ii)= p_;
		NCP_x(ii) = NCPx;
		NCP_y(ii) = NCPy;
	end

	figure(2);loglog(NCP_x,NCP_y,'b-');
	xlabel('a');
  hold off;
 
  for i = 1 : length(a_)
    figure(3);
    plot3(ones([q,1])*a_(i) , (1:q)' , c__(:,i) , 'Color' , [ max(-2*i/length(a_)+1, 0) , -abs(2*i/length(a_)-1)+1 , max(2*i/length(a_)-1, 0) ]);
    hold on;
  end
  set(gca,'XScale','log');
  xlabel('a');
  ylabel('Spatial frequency');
  hold off;
  
  

  for i = 1 : length(a_)
    figure(4);plot3(ones([q+1,1])*a_(i) , (1:q+1)' , p__(:,i) , 'Color' , [ max(-2*i/length(a_)+1, 0) , -abs(2*i/length(a_)-1)+1 , max(2*i/length(a_)-1, 0) ]);
    hold on;
  end
  set(gca,'XScale','log');
    set(gca,'ZScale','log');
  xlabel('a');
  ylabel('Spatial frequency');
  hold off;
  

	%%% Set the best a %%%
	a = input('a = ');
	TR;

	NCP;
  ce_ = c_;
	Xe = NCPx;
	Ye = NCPy;


%%% Plot results %%%
	figure(1);
	plot(dx,x,'b-',dx,x_est,'r-');
	axis([0,100,0,1.2]);
	xlabel('Tikhonov regularization');
    %fname=sprintf('xesta_%2d.pdf',round(log10(a)));
        %saveas(gca,fname);

	figure(2);loglog(NCP_x,NCP_y,'b-');
	xlabel('NCP');
	hold on;
	plot(Xe,Ye,'ro','MarkerSize',20);

	hold off;

  for i = 1 : length(a_)
    figure(3);plot3(ones([q,1])*a_(i) , (1:q)' , c__(:,i) , 'Color' , [ max(-2*i/length(a_)+1, 0) , -abs(1*i/length(a_)-1)+1 , max(2*i/length(a_)-1, 0) ]);
    hold on;
  end
  plot3(ones([q,1])*a , (1:q)' , ce_ , 'Color' , 'k');
  set(gca,'XScale','log');
  xlabel('a');
  ylabel('Spatial frequency');
  hold off;
  
    figure(4)
  for i = 1 : length(a_)
    figure(4);plot3(ones([q+1,1])*a_(i) , (1:q+1)' , p__(:,i) , 'Color' , [ max(-2*i/length(a_)+1, 0) , -abs(2*i/length(a_)-1)+1 , max(2*i/length(a_)-1, 0) ]);
    hold on;
  end
  set(gca,'XScale','log');
  %zlim([0 0.5e0])
      set(gca,'ZScale','log');
  xlabel('a');
  ylabel('Spatial frequency');
  %hold off;
