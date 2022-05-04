
function b = A_fWH(x, OMEGA, P)


N = length(x);

x = x(:);
fx = fWHtrans(x(P))*sqrt(N);
b = fx(OMEGA);