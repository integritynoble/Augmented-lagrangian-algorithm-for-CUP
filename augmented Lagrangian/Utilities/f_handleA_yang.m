%created by:Chengshuai Yang
%Jan. 13,2018
function y = f_handleA_yang(A,u,mode)
[m1,m2,m3,m4]=size(A);
switch mode
    case 1
        for i=1:m4
           u1=reshape(u,[m1,m2,m3]);
           y1=A(:,:,:,i).*u1;
           y2=sum(y1,3);
           y(:,i)=reshape(y2,[m1*m2,1]);           
        end
    case 2
        
        y=0;
        for i=1:m4
            u1=repmat(reshape(u(:,i),[m1,m2]),[1,1,m3]);
            y1=A(:,:,:,i).*u1;
            y2=reshape(y1,[m1*m2*m3,1]);
            %y2=reshape(y1,[m1,m2,m3]);
            y=y2+y;
           
        end
        
    otherwise
        error('Unknown mode passed to f_handleA in ftv_cs.m');
end

end