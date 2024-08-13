
%Output=Output(700*1200:900*1200);
%sampling_frequency = 4096 ; % [Hz] monitoring system sampling frequency
signal_length = length (Output) ;
file_time = [0:signal_length-1]./sampling_frequency; %[sec.]

%plot original signal
figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(3,1,1)
plot(file_time,Output)
title('Original Output Signal')
xlabel('Time [s]')
ylabel('Amplitude')

% shift the signal to mean
Output = Output-mean(Output);

% calculating the FFT of Output Signal
NFFT = 2^nextpow2(signal_length); % Next power of 2 from length of y
%Y = fft(Output-mean(Output),NFFT)/signal_length;
Y = fft(Output,NFFT)/signal_length;
f = sampling_frequency/2*linspace(0,1,NFFT/2);

% Plot Output Signal-sided amplitude spectrum.
subplot(3,1,2)
plot(f,2*abs(Y(1:NFFT/2))) 
title('Output Signal-Sided Amplitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

subplot(3,1,3)
plot(f,angle(Y(1:NFFT/2))) 
title('Output Signal-Sided Amplitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('Phase')


% calculating the averaged FFT of Output Signal
num_cut = 8 ; %number of sub_signals
Output_divided = Output(1:signal_length-rem(signal_length,num_cut)) ;
Output_divided = reshape (Output_divided,[],num_cut) ;
sub_signal_length = length(Output_divided) ;
sub_NFFT = 2^nextpow2(sub_signal_length); % Next power of 2 from length of y
sub_Y = fft(Output_divided,sub_NFFT)/sub_signal_length;
sub_f = sampling_frequency/2*linspace(0,1,sub_NFFT/2);

print(gcf,'-dpdf','Output_fft.pdf')
%%
% Plot Output Signal-sided amplitude spectrum.
figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(3,1,1)
plot(sub_f,2*mean(abs(sub_Y(1:sub_NFFT/2,:)),2))
%plot(f,2*abs(Y(1:NFFT/2)),sub_f,2*mean(abs(sub_Y(1:sub_NFFT/2,:)),2))
%plot(sub_f,2*abs(mean(sub_Y(1:sub_NFFT/2,:),2)))
title('Output Signal - averaged Sided Amplitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

% plot both on one graph
subplot(3,1,2)
plot(f,2*abs(Y(1:NFFT/2)),sub_f,2*mean(abs(sub_Y(1:sub_NFFT/2,:)),2))
%plot(sub_f,2*abs(mean(sub_Y(1:sub_NFFT/2,:),2)))
title('Output Signal - averaged & full Amplitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

% calculating the power spectra density
Syy = Y .* conj(Y);
% Plot Output Signal-sided amplitude spectrum.
subplot(3,1,3)
plot(f,Syy(1:NFFT/2)) 
title('Output Signal- S_{yy} power spectra density')
xlabel('Frequency (Hz)')
ylabel('S_{yy}')
%plot(f,10*log10(Sxx(1:NFFT/2)))

print(gcf,'-dpdf','Output_Syy.pdf')
%%
% autocorrelation of Output signal
%autocorr(Input,12000) ;
Fai_yy1 = autocorr(Input) ;
Fai_yy2 = autocorr(Input,sampling_frequency) ;
Fai_yy3 = autocorr(Input,sampling_frequency*10) ;

figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(3,1,1)
plot(Fai_yy1) 
title('Output Signal- Autocorelation Automatic.')
xlabel('Lag')
ylabel('Auto Corr.')

subplot(3,1,2)
plot(Fai_yy2) 
title('Output Signal- Autocorelation ,lags-num.=1200')
xlabel('Lag')
ylabel('Auto Corr.')

subplot(3,1,3)
plot(Fai_yy3) 
title('Output Signal- Autocorelation Automatic. ,lags-num.=12000')
xlabel('Lag')
ylabel('Auto Corr.')

print(gcf,'-dpdf','Output_Autocorr.pdf')
%%
% implementing Pwelch
[p_yy ff1] = pwelch(Output,sampling_frequency,sampling_frequency/2,sampling_frequency,sampling_frequency);

figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(3,1,1)
plot(ff1, 10*log10(p_yy))
title('Output Signal- Pwelch power spectra density')
xlabel('Frequency (Hz)')
ylabel('S_{yy}')

% ploting spectogram
subplot(3,1,[2 3])
[S1,F1,T1,P1,fc,tc]= spectrogram(Output,sampling_frequency/2,sampling_frequency/4,sampling_frequency/2,sampling_frequency,'yaxis','MinThreshold',-80);
imagesc( T1, F1, 10*log10(abs(S1)) ); %plot the log spectrum
set(gca,'YDir', 'normal'); % flip the Y Axis so lower frequencies are at the bottom
colorbar;
title('Output Signal- Spectrogram')
xlabel('Time (Sec)')
ylabel('Frequency (Hz)')

figure 
plot(tc(P1>0),fc(P1>0),'.')
ylim([0 100])
print(gcf,'-dpdf','Output_Pwelch_spectogram.pdf')