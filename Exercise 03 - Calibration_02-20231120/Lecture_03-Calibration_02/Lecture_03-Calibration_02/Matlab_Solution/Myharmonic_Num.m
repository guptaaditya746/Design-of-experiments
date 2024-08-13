function u=Myharmonic_Num(inputarg,tspan,y_0,plot_fig)

% solves the ordinary differential equation
% rho u'' + cu' + ku = 0
% in the fixed time interval [0, 20]
%inputarg [k,c,rho]
%Initial deflection y_0 = 5;
% Examples:
% Myharmonic_Num([5 0.2],[0:0.05:20],2,0); where k=5, c = 0.2, rho is set fix to rho=4
% Myharmonic_Num([4 0.2 1],[0:0.05:20],2,0); where k=4, c = 0.2 and rho=1

% check if input parameters are sufficeint
if length(inputarg) ==2
    k=inputarg(1); % stiffness
    c=inputarg(2); % damping
    rho=40;  % fixed mass
elseif length(inputarg)==3
    k=inputarg(1); % stiffness
    c=inputarg(2); % damping
    rho=inputarg(3); % variable mass
else
    fprintf('\n Define a vector of input parameters of at least lenght two');
end


%Solve non-stiff differential equations, medium order method
[t,u_sol] = ode45(@vString,tspan,[y_0; 0],[],k,c,rho);
u = u_sol(:,1); % save displacements
%v=u_sol(:,2); % save velocities

%To plot the results:
if plot_fig == 1
 figure
 plot(tspan,u);
 title('Harmonic oscillator');
 xlabel('Time t');
 ylabel('Displacements u (m)');

%  figure
%  plot(tspan,v,'r');
%  title('Harmonic oscillator');
%  xlabel('Time t');
%  ylabel('Velocity v (m/s)');
end



function dydt=vString(t,u,k,c,rho)
% transform ode of second order into 
% system of first order by setting:
% u1' = u2
% u2' = - 1.0/rho(c*u2 +k*u1)
dydt = [u(2); -1.0/rho*(c*u(2) + k*u(1))];



