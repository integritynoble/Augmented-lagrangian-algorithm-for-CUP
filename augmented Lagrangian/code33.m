clear;close all;clc;
M=120;
M1=8;
M2=5;
M3=120;
T=4;%ͨ����
x1=phantom(M);
x2=x1(1:M,1:M3);

X=zeros(M+M1-1,M3,M1);
for i=1:M1
    x3=circshift(x2*exp(-(i-5)^2/(2*20^2)),[0 i*M2]);
    X(i:M+i-1,:,i)=x3;
end


for ii=1:T
%colorbar
a=rand(M,M3); %�����������
b=reshape(a,[1,numel(a)]); %�������о���
c=sort(b); %�Ծ��������������
d=c((M)*M3/2); %ȡ������20С����
e=a<=d ;%��������Ԫ��С�ڵ���d,��Ϊ�漴Ϊ1,��Ϊ0
 
Y=reshape(e,[M,M3]);%���
 
Y1=double(Y);

A=zeros(M+M1-1,M3,M1);
for i=1:M1
    for j=1:M
        for k=1:M3
         
         A(j+(i-1),k,i)=Y1(j,k)*X(j+(i-1),k,i);
        end
    end
end
figure(3);
imshow(A(:,:,1),[]);
B=sum(A,3);%�۲��ͼ��
y1=norm1(B);

Cu21=zeros(M+M1-1,M3,M1);
for i=1:M1
    for j=1:M
        for k=1:M3
        
         Cu21(j+(i-1),k,i)=Y1(j,k);
       
        end
    end
end
y(:,:,ii)=y1;
Cu2(:,:,:,ii)=Cu21;

end
figure
a=0;
X1=norm1(X);
for i=1:M1
    a=a+1;
    %p=zeros(300,500);
    subplot(2,4,a)
    fram=circshift(X(:,:,i),[1-i 0]);
    %p(130:161,50*(i-1)+1:50*i+40)=x;
    imshow(fram);
    colormap(hot)
end
 