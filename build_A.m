%%% Set matrix A %%%
   iresp=importdata('impluse_response.dat');
   dt=(iresp(2,1)-iresp(1,1))*24*60*60;
   yn=size(iresp,1);
   c1=iresp(:,2)';
   c2=iresp(:,3)';
   r1=zeros(yn,1);
   r2=zeros(yn,1);
   r1(1)=c1(1);
   r2(1)=c2(1);
	A1=toeplitz(c1,r1);
    A2=toeplitz(c2,r2);
    A=[A1;A2]*dt;
    yn=2*yn;