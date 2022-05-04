function y = Rfuntwist_cm(f,C1)

n1 = size(C1,1);
n2 = size(C1,2);
m = size(C1,3);
n= size(C1,4); 


%reshape f to have a shape of a cube
f = reshape(f,[n1,n2,m]);

%'punch' each slice in cube with the code C. The shearing is already
%captured in the calibration cube that is passed in to the function as C.
for k=1:n
gp1 = f.*squeeze(C1(:,:,:,k));

%simulate 'smash' on the CCD
y(:,:,k) =sum(gp1,3); 

end 