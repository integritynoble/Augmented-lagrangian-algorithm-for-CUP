%
close all;
clc;
clear all;
addpath(genpath('.\TwIST'));
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
measurement=norm1(measurement).*31/2;
y=1*measurement; %  

Cu=1*code;
%y=B2 ; 
%Cu=Cu2 ;

%%
%Regularization parameter
tau = 1/1;

%Number of TwIST main loop iterations
maxiterations =80;

%%
%Define the functional forms for the Forward and Forward^T models
A = @(x) Rfuntwist(x,Cu);
AT = @(x) RTfuntwist(x,Cu);

%%Preparing to run TwIST
%Number of Chambolle iterations to perform for total variation minimization
piter = 4; 

Psi = @(x,th) denoising(x,th,piter); % denoising function based on Chambolle projection's algorithm 
Phi = @(x) TVnorm1(x); % regularzation function 
tolA = 1e-18;

%%
%Run TwIST
[cube,base, x_debias,obj,...
    times,debias_start,mse_twist]= ...
    TwISTmod(y,A,tau,...
    'AT', AT, ...
    'Psi', Psi, ...
    'Phi',Phi, ...
    'Initialization',2,...
    'Monotone',1,...
    'StopCriterion',1,...
    'MaxIterA',maxiterations,...
    'ToleranceA',tolA,...
    'Debias',0,...
    'Verbose', 1);

%%
% Display the cube  
p=0;
%%%title('reconstructed')
figure
for i=1:31    
    p=p+1;         
    
    subplot(8,4,p)    %figure;
    imagesc(cube(:,:,i));axis off;axis equal
    colormap(gray)
    
    
end

p=0;
%%%title('original')
figure
for i=1:31    
    p=p+1;         
    
    subplot(8,4,p)    %figure;
    imagesc(img_shift(:,:,i));axis off;axis equal
    colormap(gray)
    
    
end