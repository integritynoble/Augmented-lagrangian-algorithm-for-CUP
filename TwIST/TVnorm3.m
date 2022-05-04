 function y = TVnorm3(x)

for i = 1:size(x,1)
    y1(i) = sum(sum(sqrt(diffh(squeeze(x(i,:,:))).^2+diffv(squeeze(x(i,:,:))).^2)));
end

for j=1:size(x,2)
    y2(j) = sum(sum(sqrt(diffh(squeeze(x(:,j,:))).^2+diffv(squeeze(x(:,j,:))).^2)));
end

for k=1:size(x,3)
    y3(k) = sum(sum(sqrt(diffh(squeeze(x(:,:,k))).^2+diffv(squeeze(x(:,:,k))).^2)));
end


y = sum(y1)+sum(y2)+sum(y3);