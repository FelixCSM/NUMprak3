function [u_i, u_im1] = rungeKuttaMethod(function_to_use, functionparameter, boundries, stepsize, u_i)
  for t = boundries(1):boundries(2):stepsize
    u_im1 = u_i;
    k_1 = function_to_use(functionparameter, t,                u_i                       );
    k_2 = function_to_use(functionparameter, t + stepsize/2.0, u_i + stepsize * k_1 / 2.0);
    k_3 = function_to_use(functionparameter, t + stepsize/2.0, u_i + stepsize * k_2 / 2.0);
    k_4 = function_to_use(functionparameter, t + stepsize,     u_i + stepsize * k_3      );
    u_i = u_i + stepsize * ( k_1/6.0 + k_2/3.0 + k_3/3.0 + k_4/6.0);
  endfor
endfunction
