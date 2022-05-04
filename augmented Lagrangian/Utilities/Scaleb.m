function [mu,b,scl] = Scaleb(mu,b,option)

% Scales mu and f so that the finite difference of f is neither too small 
% nor too large.
%
% If option is assigned, mu will be scaled accordingly.
%



threshold1 =0.5;% .5;      % threshold is chosen by experience.
threshold2 = 0.5;%1.5
scl = 1;
b_dif = abs(max(max(b)) -min( min(b)));

if b_dif < threshold1
    scl = threshold1/b_dif;
    b = scl*b;
    if option
        mu = mu/scl;
    end
else if b_dif > threshold2
        scl = threshold2/b_dif;
        b = scl*b;
        if option
            mu = mu/scl;
        end
    end
end

return