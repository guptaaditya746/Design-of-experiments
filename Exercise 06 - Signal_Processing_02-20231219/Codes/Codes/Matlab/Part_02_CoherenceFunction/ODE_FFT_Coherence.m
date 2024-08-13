function ODE_FFT_Coherence
% The following code compute the solution of the ''linear'' with a
% ''nonlinear'' equation of motion
close all
clear all

x0=[0 0];      % first component is x(0), second x'(0), i.e. no displacement and velocity for t=0
tspan=0:1:256;  % timespan of integration % 512 time steps
[T,Y1] = ode45(@myfun1,tspan,x0); % solves linear ODE numerically
figure
plot(T,Y1(:,1),T,Y1(:,2));
set(gca,'FontSize',18);
legend('Displacements','Velocities');
title('Displacements and velocities of f1');
%
[T,Y2] = ode45(@myfun2,tspan,x0); % solves nonlinear ODE numerically
figure
plot(T,Y2(:,1),T,Y2(:,2));
legend('Displacements','Velocities');
set(gca,'FontSize',18);
title('Displacements and velocities of f2');


% FFT
Y1_fft = fft(Y1(:,1));
Y2_fft = fft(Y2(:,1));
figure
plot(abs(Y1_fft(1:length(Y1_fft)/2)))
set(gca,'FontSize',18);
hold
plot(abs(Y2_fft(1:length(Y2_fft)/2)),'r');
title('FFT of f1 and f2');
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')


% Coherence function
figure
set(gca,'FontSize',18);
mscohere(sin(0.1*tspan),Y1(:,1),[],[],[],length(Y1(:,1)))
title('Coherence linear Eq. Motion');

figure
set(gca,'FontSize',18);
mscohere(sin(0.1*tspan),Y2(:,1),[],[],[],length(Y1(:,1)))
title('Coherence non-linear Eq. Motion');


% function f1 - linear
function dy = myfun1(t,y)
F=sin(0.1*t); % force
K=4; % stiffness
C=0.8; % damping
M=2; % mass
dy=zeros(2,1);
dy(1)=y(2);
dy(2)=(F-K*y(1)-C*y(2))/M;


% function f1 - nonlinear
function dy = myfun2(t,y)
F=sin(0.1*t); % force
K=4; % stiffness
C=0.8; % damping
M=2; % mass
P = 10; % factor for nonlinear cubic part
dy=zeros(2,1);
dy(1)=y(2);
dy(2)=(F-K*y(1)-C*y(2)-P*y(1)^3)/M;
