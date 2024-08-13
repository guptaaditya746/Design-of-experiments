%%
clc; clear all; close all;
% *1. The model*
%
% For two variables: k=50, c = 5, (rho is set fix to rho=4)
##k=50 ; j
##c= 5 ; %[0-10]
##plot_fig = 1 ; % type "1" to plot the figures
##u = Myharmonic_Num([k c],[0:0.05:50],3,plot_fig);
%%
% For three variables: k=50, c = 4, m=10

k=50 ;
c= 4 ;
rho= 10;
plot_fig = 1 ;
u = Myharmonic_Num([k c rho],[0:0.05:50],2,plot_fig);
%%
% *2. The measurements*
%%
tspan = [0:0.05:50] ;
y_0 = 3 ;
plot_fig = 1  ;

%load measuremetns
load('u_meas0.mat');
%load('u_meas01.mat');
%load('u_meas03.mat');
%load('u_meas05.mat');
##load('u_meas09.mat');
%
 figure
 plot(tspan,u_meas);
 title('Harmonic oscillator');
 xlabel('Time [t]');
 ylabel('Displacements u with the no noise [m]');
 set(gca, 'FontSize', 32);
%%
% *2. Compare the measurements with the numerical solution*

%load measuremetns
%
load('u_meas0.mat');
%load('u_meas01.mat');
% load('u_meas03.mat');
% load('u_meas05.mat');
%load('u_meas09.mat');
%
% the numerical solution
plot_fig = 0  ;
tspan = [0:0.05:50] ;
y_0 = 3 ;
%
k=45 ;
c= 6.5 ;
rho= 40;
%
u = Myharmonic_Num([k c rho],[0:0.05:50],y_0,plot_fig);
%
 figure
 plot(tspan,u_meas,'b-',tspan,u,'r--');
 title('Harmonic oscillator');
 xlabel('Time [t]');
 ylabel('Displacements u [m]');
 legend('Measurements','Num. sol.')
%%
% *3. Try the cost function*

 [fx, x] = myCostFunctionHarmonicFit_Num([k c rho],tspan,y_0,plot_fig,u_meas)

%load('u_meas09.mat');

tspan = [0:0.05:50] ;
y_0 = 3 ;
plot_fig = 0  ;

%%
%Contourlines of J(k,m) for harmonic oscillator
x=[1:5:101];
y=[1:5:101];
[X,Y]=meshgrid(x,y);
Z=zeros(length(X),length(Y));

for i=1:length(X)
    for j=1:length(Y)
        Z(i,j)=myCostFunctionHarmonicFit_Num([ X(1,i),8, Y(j,1)]',tspan,y_0,plot_fig,u_meas); % ill-posed problem
    end
end

figure
contour(X,Y,Z,50);
xlabel('k')
ylabel('m')
colorbar
title('Contourlines of J(k,m) for harmonic oscillator');
 set(gca, 'FontSize', 32);


%%

%%
%Contourlines of J(k,c) for harmonic oscillator
x=[1:5:101];
y=[0.0:0.5:10];
[X,Y]=meshgrid(x,y);
Z=zeros(length(X),length(Y));

for i=1:length(X)
    for j=1:length(Y)
        Z(i,j)=myCostFunctionHarmonicFit_Num([ X(1,i), Y(j,1),60]',tspan,y_0,plot_fig,u_meas);
    end
end

figure
contour(X,Y,Z,50);
xlabel('k')
ylabel('c')
colorbar
title('Contourlines of J(k,c) for harmonic oscillator');
set(gca, 'FontSize', 32);

%%
%%
%Contourlines of J(c,m) for harmonic oscillator
x=[0.0:0.5:10];
y=[1:5:101];

[X,Y]=meshgrid(x,y);
Z=zeros(length(X),length(Y));

for i=1:length(X)
    for j=1:length(Y)
        Z(i,j)=myCostFunctionHarmonicFit_Num([30, X(1,i), Y(j,1)]',tspan,y_0,plot_fig,u_meas);
    end
end

figure
contour(X,Y,Z,50);
xlabel('c')
ylabel('m')
colorbar
title('Contourlines of J(c,m) for harmonic oscillator');
 set(gca, 'FontSize', 32);


% *5. Convergence of vaiables*

%convergence

%load data
load('u_meas01.mat');
% load('u_meas03.mat');
% load('u_meas05.mat');
%load('u_meas09.mat');

tspan = [0:0.05:50] ;
y_0 = 3 ;
plot_fig = 0  ;
x0 = [30, 3, 40];

[x fval history fval_all]  = Get_opt_history(x0,tspan,y_0,plot_fig,u_meas);

figure
%
subplot(4,1,1)
plot(fval_all)
xlabel('Iteration')
ylabel('Cost fucn. value')
title('Convergence of Cost func.');
set(gca, 'FontSize', 25);

%
subplot(4,1,2)
plot(history(:,1))
xlabel('Iteration')
ylabel('k')
title('Convergence of k');
 set(gca, 'FontSize', 25);

%
subplot(4,1,3)
plot(history(:,2))
xlabel('Iteration')
ylabel('c')
title('Convergence of c');
 set(gca, 'FontSize', 25);

%
subplot(4,1,4)
plot(history(:,3))
xlabel('Iteration')
ylabel('rho')
title('Convergence of rho');
 set(gca, 'FontSize', 25);

