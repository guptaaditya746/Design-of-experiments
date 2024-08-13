clear 
close all
%%
%load measurement data
%load('u_meas0.mat');
% load('u_meas01.mat');
load('u_meas03.mat');
%load('u_meas05.mat');
%load('u_meas09.mat');
%%
tspan = 0:0.05:50 ;
y_0 = 3 ;
plot_fig = 0  ;

%initial values [k, c] or [k c rho]
x0 = [20, 2, 80]; 

%Set lambda>0 to activate Tikhonov's regularization
lamda= 0.8;

%the prior
x0_prior = [40 6 40];
%% Optimization
options=optimset('TolX',1e-4,'Display','iter','PlotFcns',@optimplotfval);
% for 3 intial input

% Using unconstrained 'Nelder-Mead simplex direct search'
%[x, fval]= fminsearch(@(x) myCostFunctionHarmonicFit_Num_Tiko1(x,tspan,y_0,plot_fig,u_meas, x0_prior,lamda), x0, options)
	
% Using constrained nonlinear multivariable function
[x, fval] = fmincon(@(x) myCostFunctionHarmonicFit_Num_Tiko1(x,tspan,y_0,plot_fig,u_meas, x0_prior,lamda), x0,[],[],[],[],[10 1 10],[100 10 100],[],options)
%%
% plot results of curve fit:
figure
hold on
plot(tspan',u_meas,'rx', 'markersize',5);
title('Harmonic oscillator');
xlabel('Time t [s]')
ylabel('Displacements u');

% plot initial guess simulation
u0 = feval('Myharmonic_Num',x0,tspan,y_0,plot_fig);
plot(tspan,u0,'g');
u=Myharmonic_Num(x,tspan,y_0,plot_fig);
plot(tspan,u,'b');
legend('Measured Data','Initial Guess','Fitted Data');
hold off