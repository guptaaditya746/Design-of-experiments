function [fx_s, fx_r] = myCostFunctionHarmonicFit_Num_Tiko(x,tspan,y_0,plot_fig,u_meas,x0_prior,lamda)

% computes cost function f(x) = sum_i (u_i - u_i^meas)^2
% and gradient nabla f(x)
% if negative material parameters are provided, they will
% be overwritten and set to one

% x0_prior = [2.5 0.16 3.0 ]';
% x0_prior = [2.5 0.16 3.0 ];
% lamda=0.2;

if x(1) < 0
    fprintf('\negative first coefficient - set to thirty');
    x(1) = 30;
end

if x(2) < 0
    fprintf('\negative second coefficient - set to 4');
    x(2) = 4;
end

if length(x) == 3 && x(3) < 0
    fprintf('\negative third coefficient - set to thirty');
    x(3) = 30;
end

    u=Myharmonic_Num(x,tspan,y_0,plot_fig);
% calculate the solution norm and the residual norm
    fx_s = sum(sum((x-x0_prior).^2));
    fx_r = sum(sum((u-u_meas).^2));

%


