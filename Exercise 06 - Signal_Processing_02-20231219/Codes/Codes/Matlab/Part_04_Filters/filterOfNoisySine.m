%%  demo - usage of simple low pass filter
%--------------------------------------------------------------------------
clear
close all
t=0:0.002:1; % time interval
N = 50; %  Number, how often to apply the filter

% Noisy Signal
x = sin(2*pi*5*t) + 0.1*sin(2*pi*150*t); %high freq. noise
%x = sin(2*pi*5*t) + 0.2* randn(1,length(t)); % random noise
%
plot(t,x)
%
for k=1:N %
y(1)=x(1);
for i=2:length(t)
    y(i) = 0.3*y(i-1) + 0.7*x(i); % low- pass filter
end
x=y;
end
hold
%plot(t,y,'r');
plot(t(1:length(t)-2*N),y(2*N:length(y)-1),'r'); % compensates shift of
% signal due to repeated application of filter
set(gca,'FontSize',18);
filterstring = ['after ' num2str(N) ' x filtering']
legend('noisy signal',filterstring);
xlabel('time t');
ylabel('x(t)');

print(gcf,'-dpdf','NoiseSignalAndFilter.pdf')