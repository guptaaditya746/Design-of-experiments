%contourLines

%load measurements
% load('u_meas0.mat');
% load('u_meas01.mat');
 load('u_meas03.mat');
% load('u_meas05.mat');
% load('u_meas09.mat');

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
%%
%Contourlines of J(k,m) for harmonic oscillator
x=[1:5:101];
y=[1:5:101];
[X,Y]=meshgrid(x,y);
Z=zeros(length(X),length(Y));

for i=1:length(X)
    for j=1:length(Y)
        Z(i,j)=myCostFunctionHarmonicFit_Num_Tiko1([ X(1,i),x0_prior(2), Y(j,1)],tspan,y_0,plot_fig,u_meas, x0_prior,lamda); % ill-posed problem
    end
end
figure
contour(X,Y,Z,50);
xlabel('k')
ylabel('m')
colorbar
title('Contourlines of J(k,m) for harmonic oscillator');
%%
%Contourlines of J(k,c) for harmonic oscillator
x=[1:5:101];
y=[0.0:0.5:10];
[X,Y]=meshgrid(x,y);
Z=zeros(length(X),length(Y));

for i=1:length(X)
    for j=1:length(Y)
        Z(i,j)=myCostFunctionHarmonicFit_Num_Tiko1([ X(1,i), Y(j,1),x0_prior(3)],tspan,y_0,plot_fig,u_meas, x0_prior,lamda);
    end
end
figure
contour(X,Y,Z,50);
xlabel('k')
ylabel('c')
colorbar
title('Contourlines of J(k,c) for harmonic oscillator');
%%
%Contourlines of J(c,m) for harmonic oscillator
x=[0.0:0.5:10];
y=[1:5:101];


[X,Y]=meshgrid(x,y);
Z=zeros(length(X),length(Y));

for i=1:length(X)
    for j=1:length(Y)
        Z(i,j)=myCostFunctionHarmonicFit_Num_Tiko1([x0_prior(1), X(1,i), Y(j,1)],tspan,y_0,plot_fig,u_meas, x0_prior,lamda);
    end
end
figure
contour(X,Y,Z,50);
xlabel('c')
ylabel('m')
colorbar
title('Contourlines of J(c,m) for harmonic oscillator');