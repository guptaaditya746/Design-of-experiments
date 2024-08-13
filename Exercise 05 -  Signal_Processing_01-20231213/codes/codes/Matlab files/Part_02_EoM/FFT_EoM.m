%%
%clear; close all
%
%%
% load measurements
load('meas.mat')
%%
% get signal properties
x_noise = meas.u_meas ;
sampling_frequency = 1./ meas.sampling_rate;   % Sampling frequency  
signal_length = length(x_noise);
signal_range = meas.tspan;%[0:signal_length-1]./sampling_frequency;
%
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
xlim([0 5])
ylabel('|X(f)|')
% 
figure
plot(f,angle(X(1:NFFT/2))) 
title('Input Signal-Sided Amplitude Spectrum')
xlabel('Frequency (Hz)')
xlim([0 5])
ylabel('Phase')

%% SPECGRAM
%my_window = sampling_frequency / 10 ;
%frq_range = [0:30];
%MinThreshold = -90 ;
%[S, f, t] = specgram (x_noise, 2^nextpow2(my_window), sampling_frequency, hamming(my_window));
%figure
%imagesc (t, f, real(log(S)));
%set(gca, "ydir", "normal");

