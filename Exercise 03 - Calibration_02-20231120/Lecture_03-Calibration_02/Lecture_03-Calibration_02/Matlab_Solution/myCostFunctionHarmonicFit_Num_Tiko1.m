function [fx, x] = myCostFunctionHarmonicFit_Num_Tiko1(x,tspan,y_0,plot_fig,u_meas,x0_prior, lamda)
%
% computes cost function f(x) = sum_i (u_i - u_i^meas)^2
% and gradient nabla f(x)
% if negative material parameters are provided, they will
% be overwritten and set to one

% x0_prior = [2.5 0.16 3.0 ];
% lamda=0.2;

if x(1) < 0
    fprintf('\negative first coefficient - set to 60');
    x(1) = 60;
end

if x(2) < 0
    fprintf('\negative second coefficient - set to 4');
    x(2) = 4;
end

if length(x) == 3 && x(3) < 0
    fprintf('\negative third coefficient - set to 60');
    x(3) = 60;
end

% calculate value of cost functional here
% if only 2 output arguments are requested, we compute fx
if nargout==2 || nargout==1
    u=Myharmonic_Num(x,tspan,y_0,plot_fig);
% calculate the solution norm and the residual norm
    fx_s=sum(sum((x-x0_prior).^2));
    fx_r=sum(sum((u-u_meas).^2));
    fx=fx_r + lamda .* fx_s;
end

% if 3 output arguments are requested, we additionally 
% calculate the via a finite difference approximation here

if nargout==3
    u=Myharmonic_Num(x,tspan,y_0,plot_fig);
% calculate the solution norm and the residual norm
    fx_s=sum(sum((x-x0_prior).^2));
    fx_r=sum(sum((u-u_meas).^2));
    fx=fx_r + lamda .* fx_s;

end

