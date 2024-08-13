function u=Myharmonic_Num(inputarg,tspan,y_0,plot_fig)

% solves the ordinary differential equation
% rho u'' + cu' + ku = 0
% in the fixed time interval [0, 20]
%inputarg [k,c,rho]
%Initial deflection y_0 = 5;
% Examples:
% Myharmonic_Ana([5 0.2],[0:0.05:20],2,0); where k=5, c = 0.2, rho is set fix to rho=4
% Myharmonic_Ana([4 0.2 1],[0:0.05:20],2,0); where k=4, c = 0.2 and rho=1

% check if input parameters are sufficeint
if length(inputarg) ==2
    k=inputarg(1); % stiffness
    c=inputarg(2); % damping
    rho=4;  % fixed mass
elseif length(inputarg)==3
    k=inputarg(1); % stiffness
    c=inputarg(2); % damping
    rho=inputarg(3); % variable mass
else
    fprintf('\n Define a vector of input parameters of at least lenght two');
end


%  Analytic solution:
delta = c/(2*rho);
omega=sqrt(abs(k/rho-c^2/(4*rho)));
Phi_0=0;
u=(y_0*exp(-delta*tspan).*cos(omega*tspan+Phi_0))';

##if plot_fig == 1
##figure
## plot(tspan,u);
## title('Harmonic oscillator - analytical');
## xlabel('Time t');
## ylabel('Displacements u (m)');
##end

if plot_fig == 1
    figure
    plot(tspan, u);
    title('Harmonic oscillator - analytical', 'FontSize',20);
    xlabel('Time t', 'FontSize', 40); % Increase font size to 12 for x-axis label
    ylabel('Displacements u (m)', 'FontSize', 20); % Increase font size to 12 for y-axis label

     % Set larger font size for all axes
    set(gca, 'FontSize', 32); % Adjust the global font size for all axes to 14
end
end


