close all
clear
%% 1)
%% a) Compute the Magnitude Squared Coherence function ---------
%---------------------------------------------------------------
%---------------------------------------------------------------
fs = 1000; % number of seconds
f = 10; % frequency
t = 0:1/fs:1-1/fs; % time interval
%
noise1 = 0.1*rand(size(t));
noise2 = 0.0*rand(size(t));
%
um = sin(2*pi*f*t)+noise1; % singnal one  
%un = sin(2*pi*f*t)+noise2;  % singnal two
un = sin(2*pi*f*t)+noise2;  % singnal two  with phase shift
%
plot(t,um);
title('First Signal')
xlabel('t (s)')
figure
plot(t,un);
xlabel('t (s)')
title('Second Signal')
%
figure
mscohere(um,un,[],[],[],f)
title('Magnitude-Squared Coherence')
xlabel('f (Hz)')
ylim([0 1.1])
%% b) The coherence function for linear/non-linear equation of motion
%---------------------------------------------------------------
%---------------------------------------------------------------
ODE_FFT_Coherence