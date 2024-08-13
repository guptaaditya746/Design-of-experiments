% DFT of solution of eq. of motion

%close all

%Xave=[];
    N=124;
    n = 0:N-1;
    Omega = pi/8;
    x = sin(Omega*n).*exp(-0.1*n);
    X = dft(x);


   figure
   stem(0:N-1,x,'filled');
        set(gcf,'Units','centimeters');
        set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
        set(gcf,'PaperSize', [31.7/2.0 24.0/2]);
        set(gca,'FontSize',18);
        set(gca,'FontSize',18);

        xlabel('{\it n}');
        ylabel('{\it x}[{\it n}]');
        title('Discrete Sol. of Eq. of Motion');

        print(gcf,'-dpdf','discreteEqOfMotion.pdf')



figure
% Plot Amplitude
stem(0:N-1,abs(X),'filled');
set(gcf,'Units','centimeters');
set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
set(gcf,'PaperSize', [31.7/2.0 24.0/2]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

xlabel('{\itr}');
ylabel('Amplitude |({\itx}[{\itr}])|');
title('Spectrum of Eq. of Motion (DFT)');
%legend(['N=' num2str(avi)])

print(gcf,'-dpdf','spectrumOfEqOfMotion.pdf')

figure
% Plot Phase
stem(0:N-1,angle(X),'filled');
set(gcf,'Units','centimeters');
set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
set(gcf,'PaperSize', [31.7/2.0 24.0/2]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

xlabel('{\it r}');
ylabel('Phase of ({\itx}[{\itr}])');
title('Spectrum of Eq. of Motion (DFT)');
%legend(['N=' num2str(avi)])

print(gcf,'-dpdf','spectrumOfEqOfMotion.pdf')


