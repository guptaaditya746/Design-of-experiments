% Optimization
load('u_meas0.mat');
%load('u_meas01.mat');
%load('u_meas03.mat');
%load('u_meas05.mat');
%Sload('u_meas09.mat');

tspan = [0:0.05:50] ;
y_0 = 3 ;
plot_fig = 0  ;

x0 = [30, 8, 20];
% Using unconstrained 'Nelder-Mead simplex direct search'
%[x,fval,exitflag,output] = fminsearch(@(x) myCostFunctionHarmonicFit_Num(x,tspan,y_0,plot_fig,u_meas), x0, optimset('TolX',1e-4,'Display','iter','PlotFcns','optimplotfval'))

% Using constrained nonlinear multivariable function
options=optimset('TolX',1e-4,'Display','iter','PlotFcns',@optimplotfval);
[x, fval] = fmincon(@(x) myCostFunctionHarmonicFit_Num(x,tspan,y_0,plot_fig,u_meas), x0,[],[],[],[],[10 1 10],[100 10 100],[],options)
%%
% plot results of curve fit:
figure
hold on;
plot(tspan',u_meas,'rx', 'markersize',5);
title('Harmonic oscillator');
xlabel('Time [t]')
ylabel('Displacements u [m]');

% plot initial guess simulation
u0 = feval('Myharmonic_Num',x0,tspan,y_0,plot_fig);
plot(tspan,u0,'g');
u=Myharmonic_Num(x,tspan,y_0,plot_fig);
plot(tspan,u,'b');
legend('Measured Data','Initial Guess','Fitted Data');hold off