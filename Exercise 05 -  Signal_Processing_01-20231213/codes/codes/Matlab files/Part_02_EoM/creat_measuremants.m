clear
%%
%param =[k   c     m] ;
param = [4.5 0 4] ;
sampling_rate = 0.005;
tspan = [0:sampling_rate:20] ;
y_0 = 5
plot_fig=0;
% add noise
sigma_noise = 0.2 ; %level of noise
%
u_meas = Myharmonic_Ana(param,tspan,y_0,plot_fig).* (1+ randn(length(tspan),1)*sigma_noise );
% save measurement
meas.u_meas = u_meas;
meas.sampling_rate = sampling_rate;
meas.y_0 = y_0;
meas.param = param;
meas.sigma_noise = sigma_noise;
meas.tspan = tspan ;
%
save('meas.mat','meas')
%
% plot results of curve fit:
figure
hold
plot(tspan',u_meas,'rx', 'markersize',5);
title('noisy Harmonic oscillator');
xlabel('Time t')
ylabel('Displacements u');
%
% plot initial guess simulation
u0 = feval('Myharmonic_Ana',param,tspan,y_0,plot_fig);
plot(tspan,u0,'b');
legend('noisy Measured Data','No noise');