clear;

    x=importdata('q1.dat');  %%%%  hidden
    dx=x(:,1);
    x=x(:,2);
    xn=size(x,1);

	figure(1);
	plot(dx,x,'b-');
	xlabel('x');

	fp_x = fopen('x.txt','w');
	fprintf(fp_x,'%d\n',xn);
	fprintf(fp_x,'%1.16g	%1.16g\n',[dx,x]');
	fclose(fp_x);


build_A;  %%%%%%%%%
yn=size(A,1);


%%% Make data y (y = A * x + e) %%%
	%e = input('e = ');
    e=5;  % error level
	y = A * x + e .* ( 2 .* rand(yn,1) - ones(yn,1) );
    
    y1=y(1:yn/2);
    y2=y(yn/2+1:end);
    dy1=dx;

     

    
    y_test = A * x + e .* ( 2 .* rand(yn,1) - ones(yn,1) );
    dy=[dx;dx];
    
        T1T2=[dy1,y1,y2];
    save 'T1T2.dat' T1T2 -ascii
    
        y1_test=y(1:yn/2);
    y2_test=y_test(yn/2+1:end);
      T1T2_test=[dy1,y1_test,y2_test];
    save 'T1T2_test.dat' T1T2_test -ascii
    
	figure(2);
	plot(dy1,y1,'ro',dy1,y2,'bo');
	xlabel('time');
    xlabel('T1,T2');

	fp_y = fopen('y.txt','w');
	fprintf(fp_y,'%d\n',yn);
	fprintf(fp_y,'%1.16g	%1.16g\n',[dy,y]');
	fclose(fp_y);
    
   
	fp_y = fopen('y_test.txt','w');
	fprintf(fp_y,'%d\n',yn);
	fprintf(fp_y,'%1.16g	%1.16g\n',[dy,y_test]');
	fclose(fp_y);
    
