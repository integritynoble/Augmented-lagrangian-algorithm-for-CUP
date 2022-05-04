clear 
addpath(genpath('D:\CUP\课题研究\CS algorithm\code\augmented Lagrangian'));
load('D:\CUP\课题研究\CS algorithm\code\augmented Lagrangian\data\channel-4.mat')
[count1,count2,count3]=size(y);
for i=1:count3
    Bt(:,i)=reshape(y(:,:,i),[count1*count2,1]);
end

A=Cu2;
f=Bt;
p=size(A,1);q=size(A,2)*size(A,3);
initialpara=2^3;
finalpara=2^4;
opts.mu = finalpara;
opts.beta = finalpara;
opts.mu0 = initialpara;% 2^4;      % trigger continuation shceme
opts.beta0 =initialpara;%2^0;    % trigger continuation scheme
opts.tol = 1E-5;
opts.tol_inn = 6e-3;%拉格朗日乘子替换
opts.maxit = 140;
opts.maxcnt = 30;
opts.TVnorm = 2;
opts.nonneg = true;%true;
%opts.TVL2 = true;
opts.disp = true;%false;
opts.init = 0;
opts.rate_ctn =2;
%opts.scale_A=false;
%opts.scale_b=false;

t = cputime;
[U, out] = TVAL3_yang(A,f,p,q,opts);
t = cputime - t;
U1=norm1(U);
[m1,m2,m3,m4]=size(A);
figure;
for i=1:m3
    fram=U1(:,m2*(i-1)+1:i*m2);
    fram1=circshift(fram,[-i+1 0]);
    cube(:,:,i)=fram1;
   
    subplot(2,4,i)
    imshow(cube(:,:,i));
    axis image
    axis off
    colormap(hot)
end
