%contourLines

%load data

load('u_meas01.mat');
% load('u_meas03.mat');
% load('u_meas05.mat');
load('u_meas09.mat');

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