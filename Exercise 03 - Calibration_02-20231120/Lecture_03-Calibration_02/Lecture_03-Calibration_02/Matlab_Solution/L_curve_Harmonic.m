clear 
close all
clear
%load measurement data

%load('u_meas0.mat');
load('u_meas01.mat');
%load('u_meas03.mat');
%load('u_meas05.mat');
%load('u_meas09.mat');
%%
tspan = 0:0.05:50 ;
y_0 = 3 ;
plot_fig = 0  ;
%initial values  [k c rho]
x0 = [20, 2, 80]; 
%
%the prior
x0_prior = [40 6 40];
%%
lamda1=linspace(0.01,0.2,10);%
lamda2=linspace(0.2,2,10);%
lamda=[lamda1 lamda2] ;
fx_s=length(lamda);
fx_r=length(lamda);


for i=1:length(lamda)
%[x, fval, g]= fminsearch(@(x) myCostFunctionHarmonicFit_Num_Tiko1(x,tspan,y_0,plot_fig,u_meas,x0_prior, lamda(i)), x0);
%
[x, fval] = fmincon(@(x) myCostFunctionHarmonicFit_Num_Tiko1(x,tspan,y_0,plot_fig,u_meas,x0_prior, lamda(i)), x0,[],[],[],[],[10 1 10],[100 10 100]);
%
[fx_s(i), fx_r(i)]= myCostFunctionHarmonicFit_Num_Tiko(x,tspan,y_0,plot_fig,u_meas,x0_prior,lamda(i));
 X(i,:)=x;
 F(i)=fval;
end
%%
% Plot L_curve
figure1 =figure;
p1=plot((fx_r(1:end)),(fx_s(1:end)),'-s');
p1=loglog((fx_r(1:end)),(fx_s(1:end)),'-s');
xlabel('Residual norm')
ylabel('Solution norm')
%
ax1=gca;
set(ax1,'XColor','b');
ax1_pos = get(ax1,'Position');

ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none');
grid on
xlabel('Lamda')
% 
 hold on
p2=plot(lamda(1:end), (fx_s(1:end)),'w');
% Set the remaining axes properties
set(ax2,'YMinorTick','on','YScale','log','XColor','r');
%
%legend([p1,p2],'l\_curve','Lamda values')
legend([p1],'l\_curve')
