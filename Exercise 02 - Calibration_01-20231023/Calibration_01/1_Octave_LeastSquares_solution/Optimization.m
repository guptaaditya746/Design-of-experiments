%
load('u_meas0.mat');
%load('u_meas01.mat');
% load('u_meas03.mat');
% load('u_meas05.mat');
%load('u_meas09.mat');

tspan = [0:0.05:50] ;
y_0 = 5 ;
plot_fig = 0  ;

##x0 = [60, 5, 20];


##x0 = [30, 5, 20]; %Lowering the first parameter value might significantly impact the stiffness or restoring force in the system.
##
##x0 = [60, 10, 20]; %Increasing the second parameter value might affect the damping or resistance in the system, potentially altering the rate of decay of oscillations.
##
x0 = [60, 5, 10]; %Decreasing the third parameter value might alter the mass density or a related physical property, affecting the inertia and, consequently, the system's response to perturbations.

% for 3 intial input
%x = fminsearch(@(x) myCostFunctionHarmonicFit_Num(x,tspan,y_0,plot_fig,u_meas), x0, optimset('TolX',1e-4,'Display','iter'))
x = fminunc (@(x) myCostFunctionHarmonicFit_Num(x,tspan,y_0,plot_fig,u_meas), x0, optimset('TolX',1e-4,'Display','iter'))
%[ x, n_feval ] =nelder_mead( xx0, @(x)myCostFunctionHarmonicFit_Num(x,tspan,y_0,plot_fig,u_meas), 0 )
% plot results of curve fit:
figure
hold
plot(tspan',u_meas,'rx', 'markersize',5);
title('Harmonic oscillator');
xlabel('Time [t]')
ylabel('Displacements u [m]');
set(gca, 'FontSize', 32);

% plot initial guess simulation
u0 = feval('Myharmonic_Num',x0,tspan,y_0,plot_fig);
plot(tspan,u0,'g');
u=Myharmonic_Num(x,tspan,y_0,plot_fig);
plot(tspan,u,'b');
legend('Measured Data','Initial Guess','Fitted Data');
