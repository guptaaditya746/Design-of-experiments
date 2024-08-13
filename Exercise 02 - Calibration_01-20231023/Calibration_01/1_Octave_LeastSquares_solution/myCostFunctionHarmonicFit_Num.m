function [fx, x] = myCostFunctionHarmonicFit_Num(x,tspan,y_0,plot_fig,u_meas)

% computes cost function f(x) = sum_i (u_i - u_i^meas)^2
% 
% if negative material parameters are provided, they will
% be overwritten and set to one

x0_prior = [40 6 40 ]';

if x(1) < 0
    fprintf('\nnegative first coefficient - set to thirty')
    x(1) = 30;
end

if x(2) < 0
    fprintf('\nnegative second coefficient - set to four')
    x(2) = 4;
end

if length(x) == 3 && x(3) < 0
    fprintf('\nnegative third coefficient - set to thirty')
    x(3) = 30;
end

% calculate value of cost functional here
% if only 2 output arguments are requested, we compute fx
if nargout==2 || nargout==1
    u=Myharmonic_Num(x,tspan,y_0,plot_fig);
    fx=sum((u-u_meas).^2);
end

% if 3 output arguments are requested, we additionally 
% calculate the via a finite difference approximation here

if nargout==3
    u=Myharmonic_Num(x,tspan,y_0,plot_fig);
    fx=sum((u-u_meas).^2);
end

