clear
close all
warning off
tic

N=50;

% initiales Level
initialGuess = 2.0;

[A,b,x] = tomo(N,1,2);

% we are adding noise to the measurements b
b = b+0.05*mean(b)*randn(size(b));
%%
%reconstruction with Tikhonov Regularization
[U,s,V] = csvd(A); 
x_0 = initialGuess.*ones(N^2,1);
alpha = 0.0002; % Regularization parameter (weighting for Tikhonov penalty term)
[x_Tik,rhoTik,etaTik] = tikhonov(U,s,V,b,alpha,x_0);

% plot reference
figure
 surf(reshape(x,N,N));
 colorbar
 set(gcf,'Units','centimeters');
 set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
 set(gcf,'PaperSize', [29.7/2.0 24.0/2]);
 set(gca,'FontSize',18);
 xlabel('x');
 ylabel('y');
 title('Reference');
 print(gcf,'-dpdf','reference.pdf')
 
 
 % plot reconstruction (Tikhonov)
 figure
 surf(reshape(x_Tik,N,N));
 colorbar
 set(gcf,'Units','centimeters');
 set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
 set(gcf,'PaperSize', [29.7/2.0 24.0/2]);
 set(gca,'FontSize',18);
 xlabel('x');
 ylabel('y');
 title('Reconstruction Tikhonov');
 print(gcf,'-dpdf','reconstructionTikhonov.pdf')
 
 
