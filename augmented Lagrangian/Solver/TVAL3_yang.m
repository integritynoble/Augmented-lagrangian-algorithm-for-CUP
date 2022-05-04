function [U,out] = TVAL3_yang(A,b,p,q,opts)
 

%changed by:Chengshuai Yang
%Jan. 13,2018
if ~isfield(opts,'TVL2')
    opts.TVL2 = false;
end

if opts.TVL2
     [U, out] = ftvcs_al_TVL2p(A,b,p,q,opts);
else 
    [U, out] = ftvcs_alp_yang2(A,b,p,q,opts);
end