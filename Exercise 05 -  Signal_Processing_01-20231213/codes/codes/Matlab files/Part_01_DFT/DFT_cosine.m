% DFT of a cosine sequence

close all

Xave=[];
for avi = 1:1
    N=2^7; % 124
    n = 0:N-1;
    Omega = 2* pi /16;
    x = sin(Omega*n);%+0.5*randn(1,length(n));
    tic
    X = dft(x);
    toc
    % 
    tic
    X1=fft(x);
    toc
    %
    if avi==1
        stem(0:N-1,x,'filled');
        set(gcf,'Units','centimeters');
        set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
        set(gcf,'PaperSize', [31.7/2.0 24.0/2]);
        set(gca,'FontSize',18);
        set(gca,'FontSize',18);

        xlabel('{\it n}');
        ylabel('{\it x}[{\it n}]');
        title('Discrete Cosine');

        print(gcf,'-dpdf','discreteCosNoisy.pdf')
    end

    if avi==1
        Xave = X;
    else
        Xave = Xave + X;
    end
end
Xave = 1/avi*Xave;


figure
% Plot Amplitude
stem(0:N-1,abs(Xave),'filled');
set(gcf,'Units','centimeters');
set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
set(gcf,'PaperSize', [31.7/2.0 24.0/2]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);
xlabel('{\itr}');
ylabel('Amplitude |({\itx}[{\itr}])|');
title('Averaged Spectrum of Cosine (DFT)');
legend(['N=' num2str(avi)])
print(gcf,'-dpdf','spectrumOfCosNoisyAveraged1.pdf')
figure
% Plot Phase
stem(0:N-1,angle(Xave),'filled');
set(gcf,'Units','centimeters');
set(gcf,'paperpositionmode','auto','PaperUnits', 'centimeters')
set(gcf,'PaperSize', [31.7/2.0 24.0/2]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);
xlabel('{\it r}');
ylabel('Phase of ({\itx}[{\itr}])');
title('Averaged Spectrum of Cosine (DFT)');
legend(['N=' num2str(avi)])

print(gcf,'-dpdf','spectrumOfCosNoisyAveraged1.pdf')


