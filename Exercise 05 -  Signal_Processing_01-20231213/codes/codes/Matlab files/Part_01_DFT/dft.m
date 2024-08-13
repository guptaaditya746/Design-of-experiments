
function X = dft(x)
% dft computation
N = length(x);
w = exp(-1i*2*pi/N);
X = zeros(1,N);
for k=0:N-1
    wk = w^k;
    for n=0:N-1
        X(k+1) = X(k+1) + x(n+1)*wk^n;
    end
end