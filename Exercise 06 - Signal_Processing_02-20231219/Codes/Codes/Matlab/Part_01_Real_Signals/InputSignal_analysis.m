%Input=Input(700*1200:900*1200);
Input=Signal_01;
sampling_frequency = 4096 ; % [Hz] monitoring system sampling frequency
signal_length = length (Input) ;
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
plot(file_time,Input)
title('Original Input Signal')
xlabel('Time [s]')
ylabel('Amplitude')

% shift the signal to mean
Input = Input-mean(Input);

% calculating the FFT of Input Signal
NFFT = 2^nextpow2(signal_length); % Next power of 2 from length of y
%Y = fft(Input-mean(Input),NFFT)/signal_length;
X = fft(Input,NFFT)/signal_length;
f = sampling_frequency/2*linspace(0,1,NFFT/2);

% Plot Input Signal-sided amplitude spectrum.
%figure
subplot(3,1,2)
plot(f,2*abs(X(1:NFFT/2))) 
title('Input Signal-Sided Amplitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')

%figure
subplot(3,1,3)
plot(f,angle(X(1:NFFT/2))) 
title('Input Signal-Sided Amplitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('Phase')

print(gcf,'-dpdf','Input_fft.pdf')
%%
% calculating the averaged FFT of Input Signal
num_cut = 5 ; %number of sub_signals
Input_divided = Input(1:signal_length-rem(signal_length,num_cut)) ;
Input_divided = reshape (Input_divided,[],num_cut) ;
sub_signal_length = length(Input_divided) ;
sub_NFFT = 2^nextpow2(sub_signal_length); % Next power of 2 from length of y
sub_X = fft(Input_divided,sub_NFFT)/sub_signal_length;
sub_f = sampling_frequency/2*linspace(0,1,sub_NFFT/2);


% Plot Input Signal-sided amplitude spectrum.
figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(3,1,1)
plot(sub_f,2*mean(abs(sub_X(1:sub_NFFT/2,:)),2))
%plot(f,2*abs(Y(1:NFFT/2)),sub_f,2*mean(abs(sub_Y(1:sub_NFFT/2,:)),2))
%plot(sub_f,2*abs(mean(sub_Y(1:sub_NFFT/2,:),2)))
title('Input Signal - averaged Sided Amplitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')

% plot both on one graph
subplot(3,1,2)
plot(f,2*abs(X(1:NFFT/2)),sub_f,2*mean(abs(sub_X(1:sub_NFFT/2,:)),2))
%plot(sub_f,2*abs(mean(sub_Y(1:sub_NFFT/2,:),2)))
title('Input Signal - averaged & full Amplitude Spectrum')
xlabel('Frequency (Hz)')
ylabel('|X(f)|')

% calculating the power spectra density
Sxx = X .* conj(X);
% Plot Input Signal-sided amplitude spectrum.
subplot(3,1,3)
plot(f,Sxx(1:NFFT/2)) 
title('Input Signal- S_{xx} power spectra density')
xlabel('Frequency (Hz)')
ylabel('S_{xx}')
%plot(f,10*log10(Sxx(1:NFFT/2)))

print(gcf,'-dpdf','Input_Sxx.pdf')
%%
% autocorrelation of Input signal
%autocorr(Input,12000) ;
Fai_xx1 = autocorr(Input) ;
Fai_xx2 = autocorr(Input,sampling_frequency) ;
Fai_xx3 = autocorr(Input,sampling_frequency*10) ;

figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(3,1,1)
plot(Fai_xx1) 
title('Input Signal- Autocorrelation Automatic.')
xlabel('Lag')
ylabel('Auto Corr.')

subplot(3,1,2)
plot(Fai_xx2) 
title('Input Signal- Autocorrelation ,lags-num.=1200')
xlabel('Lag')
ylabel('Auto Corr.')

subplot(3,1,3)
plot(Fai_xx3) 
title('Input Signal- Autocorrelation Automatic. ,lags-num.=12000')
xlabel('Lag')
ylabel('Auto Corr.')

print(gcf,'-dpdf','Input_Autocorr.pdf')
%%
% implementing Pwelch
[p_xx ff] = pwelch(Input,sampling_frequency,sampling_frequency/(2),sampling_frequency,sampling_frequency);

figure
set(gcf,'PaperType','a4',...
'PaperPositionMode','manual',...
'PaperOrientation','landscape',...
'PaperUnits','centimeters',...
'PaperPosition',[1,1,28,19]);
set(gca,'FontSize',18);
set(gca,'FontSize',18);

subplot(3,1,1)
plot(ff, 10*log10(p_xx))
title('Input Signal- Pwelch power spectra density')
xlabel('Frequency (Hz)')
ylabel('S_{xx}')

% ploting spectogram
subplot(3,1,[2 3])
[S,F,T]= spectrogram(Input,sampling_frequency,sampling_frequency/2,sampling_frequency,sampling_frequency,'yaxis');
imagesc( T, F, log(abs(S)) ); %plot the log spectrum
set(gca,'YDir', 'normal'); % flip the Y Axis so lower frequencies are at the bottom
colorbar;
title('Input Signal- Spectrogram')
xlabel('Time (Sec)')
ylabel('Frequency (Hz)')

print(gcf,'-dpdf','Input_Pwelch_spectogram.pdf')