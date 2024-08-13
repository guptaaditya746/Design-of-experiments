%%
clear; close all
%
%%
% generate the signal
signal_period = 0.05 ; % signal period [sec]
signal_frequ_fund = 1./ signal_period; %[Hz]
signal_time = 2 ; %[sec.]
sampling_frequency = 500;   % Sampling frequency  
signal_length = signal_time .* sampling_frequency;
signal_range = [0:signal_length-1]./sampling_frequency;
%
signal_frequ = [signal_frequ_fund 3*signal_frequ_fund 6*signal_frequ_fund];
x1 = 1*sin(2*pi*signal_frequ(1)*signal_range) ;
x2 = 0.5*cos(2*pi*signal_frequ(2)*signal_range);
x3 = 1.5*sin(2*pi*signal_frequ(3)*signal_range);
%
%x = x1  ;
x = x1 + x2  ;
%x = x1 + x2 +x3 ;
%%
% add noise
noise_level= 0;
noise = noise_level*randn(size(signal_range)).* x ;
x_noise = x + noise;
%%
%plot original signal
figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',12);
set(gca,'FontSize',12);
%
plot(signal_range,x_noise)
title('Original Input Signal')
xlabel('Time [s]')
ylabel('Amplitude')
%print(gcf,'-dpdf','MyNoisySinWave.pdf')
%%

% calculating the FFT of Input Signal
NFFT = 2^nextpow2(signal_length); % Next power of 2 from length of y
% fft
X = fft(x_noise,NFFT)/signal_length;
f = sampling_frequency/2*linspace(0,1,NFFT/2);

% Plot Input Signal-sided amplitude spectrum.
figure
plot(f,2*abs(X(1:NFFT/2))) 
title('Input Signal-Sided Amplitude Spectrum')
xlabel('Frequency (Hz)')
xlim([0 1.2*signal_frequ(3)])
ylabel('|X(f)|')


figure
plot(f,angle(X(1:NFFT/2))) 
title('Input Signal-Sided Amplitude Spectrum')
xlabel('Frequency (Hz)')
xlim([0 1.2*signal_frequ(3)])
ylabel('Phase')
