function f = RTfuntwist(y,C1)

n1 = size(C1,1);
n2 = size(C1,2);
m = size(C1,3);
n=size(C1,4); 
% y=reshape(y,n1,n2);
f=0; 
for k=1:n
yp1 = repmat(squeeze(y(:,:,k)),[1,1,m]); 
t=max(max(max(C1(:,:,:,k))));
f=f+yp1.*squeeze(C1(:,:,:,k));%/2^t;
end 

% yp2 = repmat(squeeze(y(:,:,2)),[1,1,m]);    

