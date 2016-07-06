function [y_k, y_km1] = explicitEulerMethod(function_in_use, functionparameter, boundries, stepsize, y_k)
  for k = boundries(1):stepsize:boundries(2)
    y_km1 = y_k;
    y_k = y_k + stepsize * function_in_use(functionparameter, k, y_k);
  endfor
endfunction
