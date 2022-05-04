clear;clc;close all
addpath(genpath('.\augmented Lagrangian'));
load('.\data\data.mat')
%%
%Load the calibration cube
img_shift=zeros(286,256,31);
code=zeros(286,256,31);
for i=1:31
    img_shift(i:i+255,:,i)=img(:,:,i);
    code(i:i+255,:,i)=mask;
end
measurement=sum(img_shift.*code,3);
%
measurement=norm1(measurement).*31/2; % 31 is frame of images


%%%%%%%%%%  
%%
%Loading the CUP's measurement
y=1*measurement; %  
%bg=mean(mean(y(1:50,1:50))); % DC background 
%y=y-bg; % Remove the DC background 
%y(y<0)=0; 
%y=y(100:350,150:350); 
%y=norm1(y);
Cu2=1*code;
[count1,count2,count3]=size(y);
for i=1:count3
    Bt(:,i)=reshape(y(:,:,i),[count1*count2,1]);
end

A=Cu2;
f=Bt;
p=size(A,1);q=size(A,2)*size(A,3);
initialpara=2^5;
finalpara=2^5;
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

%%%title('reconstructed')
figure;
for i=1:m3
    fram=U1(:,m2*(i-1)+1:i*m2);
    
    cube(:,:,i)=fram;
   
    subplot(8,4,i)
    imagesc(cube(:,:,i));
    
    axis equal
    axis off
    colormap(gray)
end
%%%title('original')
figure;
for i=1:m3
    
   
    subplot(8,4,i)
    imagesc(img_shift(:,:,i));   
    axis equal
    axis off
    colormap(gray)
end

