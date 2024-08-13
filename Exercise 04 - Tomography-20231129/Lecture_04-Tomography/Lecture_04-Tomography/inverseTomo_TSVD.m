% inverseTomo_TSVD

clear
%close all
warning off

N=50;

[A,b,x] = tomo(N,1,2);
% we are adding noise to the measurements b
b = b+0.05*mean(b)*randn(size(b));
%%
% reconstruction with singular value decomposition
[U,s,V] = csvd(A);
%[k,rho,eta,reg_param] = l_curve(U,s,b,'tsvd');
K = 2500; % Regularization Parameter (truncation of sum for SVD)
[x_k,rho,eta] = tsvd(U,s,V,b,K);
%%
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


% plot reconstruction (TSVD)
figure
surf(reshape(x_k,N,N));
colorbar
set(gcf,'Units','centimeters');
set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
set(gcf,'PaperSize', [29.7/2.0 24.0/2]);
set(gca,'FontSize',18);
xlabel('x');
ylabel('y');
title('Reconstruction TSVD');
print(gcf,'-dpdf','reconstructionTSVD.pdf')

