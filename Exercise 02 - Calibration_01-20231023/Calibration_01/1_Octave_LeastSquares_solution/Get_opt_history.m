
function [x fval history fval_all] = Get_opt_history(x0,tspan,y_0,plot_fig,u_meas)
    history = [];
    fval_all=[];
    options = optimset('OutputFcn', @myoutput); %,'PlotFcns',@optimplotfval
    [x fval] = fminsearch(@(x)myCostFunctionHarmonicFit_Num(x,tspan,y_0,plot_fig,u_meas), x0,options);
        
    function stop = myoutput(x,optimvalues,state);
        stop = false;
        if isequal(state,'iter')
          history = [history; x];
          fval_all = [fval_all; optimvalues.fval];
        end
    end
    
end