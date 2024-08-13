clear
%close all
warning off
tic

N=50;

% initiales Level
initialGuess = 2.0;

[A,b,x] = tomo(N,1,2);
% we are adding noise to the measurements b
b = b+0.05*mean(b)*randn(size(b));
%%

% reconstruction with iterative linear gradient method
kIter = 1000; % Regularization Parameter (stopping index of iterative gradient method)
x_0 = initialGuess.*ones(N^2,1);
[x_iter,rho,eta] = cgls(A,b,kIter,0,x_0);


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
 
 
 % plot reconstruction (iterative CG)
 figure
 surf(reshape(x_iter(:,kIter),N,N));
 colorbar
 set(gcf,'Units','centimeters');
 set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
 set(gcf,'PaperSize', [29.7/2.0 24.0/2]);
 set(gca,'FontSize',18);
 xlabel('x');
 ylabel('y');
 title('Reconstruction CG (iterative)');
 print(gcf,'-dpdf','reconstructionIterative.pdf')

