
%%%%%% Input data x(exact) %%%%%%
	fp_x = fopen('x.txt','r');
	xn = fscanf(fp_x,'%d',[1 1]);
	x = fscanf(fp_x,'%g',[2 xn]);
	dx = x(1,:)';
	x = x(2,:)';
	fclose(fp_x);


%%%%%% Input data y %%%%%%
	fp_y = fopen('y.txt','r');
	yn = fscanf(fp_y,'%d',[1 1]);
	y = fscanf(fp_y,'%g',[2 yn]);
	dy = y(1,:)';
	y = y(2,:)';
	fclose(fp_y);


%%%%%% Set matrix A %%%%%%
build_A;