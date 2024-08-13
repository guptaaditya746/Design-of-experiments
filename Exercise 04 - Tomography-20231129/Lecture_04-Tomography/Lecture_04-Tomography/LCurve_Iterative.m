% L curve
clear all
N=50;
[A,b,x] = tomo(N,1,2);
% we are adding noise to the measurements b
b = b+0.05*mean(b)*randn(size(b));
initialGuess = 2.0;
%%
regPar=[1, 2, 3, 5, 8, 11, 14, 20, 30, 50, 100, 125, 150, 200, 400, 600, 800, 1000, 2000];

for i=1:length(regPar)
    kIter = regPar(i); % Regularization Parameter (stopping index of iterative gradient method)
    x_0 = initialGuess.*ones(N^2,1);
    % iterative solver
    [x_iter,rho,eta] = cgls(A,b,kIter,0,x_0);
    
    % reconstruction with singular value dec
    %omposition
    x_norm(i) = norm(x_iter);
    x_residual(i) = norm(A*x_iter - b);
    
end
figure
plot(x_residual,x_norm,'.')
semilogx(x_residual,x_norm,'.')
hold
plot(x_residual,x_norm)
set(gcf,'Units','centimeters');
set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
set(gcf,'PaperSize', [29.7/2.0 24.0/2]);
set(gca,'FontSize',18);
xlabel('||Ax-b||');
ylabel('||x||');
% 


