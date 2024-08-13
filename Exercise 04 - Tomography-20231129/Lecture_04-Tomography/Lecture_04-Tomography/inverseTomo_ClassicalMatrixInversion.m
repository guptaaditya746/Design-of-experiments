clear
%close all
warning off
%%
% no of pixels
N=50;

[A,b,x] = tomo(N,1,2);
% we are adding noise to the measurements b
b = b+0.05*mean(b)*randn(size(b));
%%
% without regularitzation
x_noReg = A\b;


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


% plot reconstruction (no regularization)
figure
surf(reshape(x_noReg,N,N));
colorbar
set(gcf,'Units','centimeters');
set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
set(gcf,'PaperSize', [29.7/2.0 24.0/2]);
set(gca,'FontSize',18);
xlabel('x');
ylabel('y');
title('Reconstruction (without Regularization)');
print(gcf,'-dpdf','reconstructionNoRegularization.pdf')

return


