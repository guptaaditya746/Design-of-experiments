clear, close all;

% Project number
% load signals
load('Signal_01.mat')
load('Signal_02.mat')
Input = Signal_01;
Output = Signal_02;
%
sampling_frequency = 4096 ; % [Hz] monitoring system sampling frequency
%%
% analysis Input Signal
run InputSignal_analysis.m
%%
% analysis Input Signal
run OutputSignal_analysis.m
%%
% autocorrelation of Input signal
%autocorr(Input,12000) ;
Fai_xy1 = xcorr(Input,Output) ;
Fai_xy2 = xcorr(Input,Output,sampling_frequency) ;
Fai_xy3 = xcorr(Input,Output,sampling_frequency*10) ;

figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(3,1,1)
plot(Fai_xy1) 
title('Input-Output cross correlation Automatic.')
xlabel('Lag')
ylabel('cross Corr.')

subplot(3,1,2)
plot(Fai_xy2) 
title('Input-Output cross correlation ,lags-num.=1200')
xlabel('Lag')
ylabel('cross Corr.')

subplot(3,1,3)
plot(Fai_xy3) 
title('Input-Output cross correlation Automatic. ,lags-num.=12000')
xlabel('Lag')
ylabel('cross Corr.')

print(gcf,'-dpdf','CrossCorrelation_InputOutput.pdf')
%%
% calculating the power spectra density
Sxy = Y .* conj(X);
% Plot Input Signal-sided amplitude spectrum.
figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(2,1,1)
plot(f,abs(Sxy(1:NFFT/2))) 
title('Input-Output Signal- S_{xy} power spectra density')
xlabel('Frequency (Hz)')
ylabel('|S_{xy}|')
%plot(f,10*log10(Sxy(1:NFFT/2)))

% calculating the coherencce using Matlab function
subplot(2,1,2)
mscohere(Input,Output,[],[],[],sampling_frequency);

print(gcf,'-dpdf','Sxy_coh.pdf')
%% calculating FRF
Hw = Sxy ./ Sxx ;
figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(2,1,1)
plot(f,10*log10(abs(Hw(1:NFFT/2))))
title('FRF')
xlabel('Frequency (Hz)')
ylabel('|H_w|')

subplot(2,1,2)
plot(f,180/3.14*angle(Hw(1:NFFT/2)))
title('FRF')
xlabel('Frequency (Hz)')
ylabel('phase')

print(gcf,'-dpdf','FRF_zoom.pdf','-fillpage')
%% Wavelet Transform
% %%
% % wavelet analysis - Input Signal
% cwtS1 = cwtft({Input,1/sampling_frequency},'plot')
% cfs = cwtS1.cfs; freq = cwtS1.frequencies;
% contour(file_time,freq,abs(cfs)); grid on;
% plot(freq,abs(cfs));
% print(gcf,'-dpdf','wavelet_Input.pdf','-fillpage')
% 
% %%
% % wavelet analysis - Output Signal
% cwtS2 = cwtft({Output,1/sampling_frequency},'plot')
% cfs = cwtS2.cfs; freq = cwtS2.frequencies;
% contour(file_time,freq,abs(cfs)); grid on;
% plot(freq,abs(cfs));
% print(gcf,'-dpdf','wavelet_Output.pdf','-fillpage')
%%
my_window = sampling_frequency / .10;
frq_range = [2:200];
MinThreshold = -90 ;
figure
xspectrogram(Input,Output,hamming(my_window),ceil(my_window*0.9),frq_range,sampling_frequency,'power','yaxis','MinThreshold',MinThreshold);
