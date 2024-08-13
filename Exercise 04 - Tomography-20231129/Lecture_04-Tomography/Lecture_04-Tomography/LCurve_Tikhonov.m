% L curve
clear all

N=50;

% initiales Level
initialGuess = 2.0;

[A,b,x] = tomo(N,1,2);
% we are adding noise to the measurements b
b = b+0.05*mean(b)*randn(size(b));

regPar = [0.00001; 0.00005; 0.0001; 0.0005; 0.001; 0.005; 0.01; 0.05; 0.1; 0.5; 1; 2; 5; 10];

for i=1:length(regPar)
    [U,s,V] = csvd(A);
    x_0 = initialGuess.*ones(N^2,1);
    alpha = regPar(i); % Regularization parameter (weighting for Tikhonov penalty term)
    [x_Tik,rhoTik,etaTik] = tikhonov(U,s,V,b,alpha,x_0);
    
    x_norm(i) = norm(x_Tik);
    x_residual(i) = norm(A*x_Tik - b);
    
end
figure
semilogx(x_residual,x_norm,'.')
hold
semilogx(x_residual,x_norm)
set(gcf,'Units','centimeters');
set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
set(gcf,'PaperSize', [29.7/2.0 24.0/2]);
set(gca,'FontSize',18);
xlabel('||Ax-b||');
ylabel('||x||');
%
