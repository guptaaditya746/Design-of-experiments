clear
close all
% L curve
N=50;
[A,b,x] = tomo(N,1,2);
% we are adding noise to the measurements b
b = b+0.05*mean(b)*randn(size(b));
%%
KK=[];
for i=1:N/4
         
    % reconstruction with singular value dec
    %omposition
    [U,s,V] = csvd(A);
    %[k,rho,eta,reg_param] = l_curve(U,s,b,'tsvd');
    K = i*N*2 % Regularization Parameter (truncation of sum for SVD)
    [x_k,rho,eta,p] = tsvd(U,s,V,b,K);
    KK=[KK, K];
    x_norm(i) = norm(x_k);
    x_residual(i) = norm(A*x_k - b);
    
end
%%
figure
plot(x_residual,x_norm,'.')
%semilogx(x_residual,x_norm,'.')
hold
%semilogx(x_residual,x_norm)
plot(x_residual,x_norm)
set(gcf,'Units','centimeters');
set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
set(gcf,'PaperSize', [29.7/2.0 24.0/2]);
set(gca,'FontSize',18);
xlabel('||Ax-b||');
ylabel('||x||');
%

