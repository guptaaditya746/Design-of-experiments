clear all
close all
%% 2)
%% a) Wavelet Transformation of a chirp signal ----------------------------------
%---------------------------------------------------------------
%---------------------------------------------------------------
% wavelet transform of a chirp signal 
x=linspace(0,6,200)
signal = cos(4*x.*x);
amplitude = abs(fft(signal))
figure
plot(amplitude(1:length(amplitude)/2))
title('Amplitude')
figure
phase = angle(fft(signal)); %phase(fft(signal))
plot(phase(1:length(phase)/2));
title('Phase')

%% Perform the discrete wavelet transform (DWT) at level 5 using the Haar wavelet.
%--------------------------------------------------------------------------
lev   = 9;
wname = 'db1'; % other choices: 
%wname ='haar'; % or 
nbcol = 64;
[b,a] = wavedec(signal,lev,wname);
%% b) Expand discrete wavelet coefficients for plot. -----------
%---------------------------------------------------------------
%---------------------------------------------------------------
len = length(signal);
cfd = zeros(lev,len);
for k = 1:lev
    d = detcoef(b,a,k); %extracts the detail coefficients
    % at level N from the wavelet decomposition structure
    d = d(:)';
    d = d(ones(1,2^k),:);
    cfd(k,:) = wkeep1(d(:)',len); % extracts the vector Y 
    % from the vector X. The length of Y is L.
end
cfd =  cfd(:);
I = find(abs(cfd)<sqrt(eps));
cfd(I) = zeros(size(I));
cfd    = reshape(cfd,lev,len);
cfd = wcodemat(cfd,nbcol,'row'); % Extended pseudocolor matrix scaling.
%% Plots 
figure
h211 = subplot(3,1,1);
h211.XTick = [];
plot(signal,'r');
title('Analyzed signal.');
ax = gca;
ax.XLim = [1 length(signal)];%the signal and the expanded discrete wavelet co
subplot(3,1,2);
colormap(cool(128));
image(cfd);
tics = 1:lev;
labs = int2str(tics');
ax = gca;
ax.YTickLabelMode = 'manual';
ax.YDir = 'normal';
ax.Box = 'On';
ax.YTick = tics;
ax.YTickLabel = labs;
title('Discrete Transform, absolute coefficients.');
ylabel('Level');
