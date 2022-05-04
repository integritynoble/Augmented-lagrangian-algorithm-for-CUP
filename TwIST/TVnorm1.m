 function y = TVnorm1(x)



for k=1:size(x,3)
    y3(k) = sum(sum(sqrt(diffh(squeeze(x(:,:,k))).^2+diffv(squeeze(x(:,:,k))).^2)));
end


y = sum(y3);