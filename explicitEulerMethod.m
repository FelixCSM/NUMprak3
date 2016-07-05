function y_k = explicitEulerMethod(function, functionparameter, boundries, stepsize, y_k)
  for k = boundries(1):stepsize:boundries(2)
    y_k = y_k + stepsize * function(functionparam, k, y_k)
  endfor
endfunction
