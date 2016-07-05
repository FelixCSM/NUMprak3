function u_i = rungeKuttaMethod(function, functionparameter, boundries, stepsize, u_i)
  for t = boundries(1):boundries(2):stepsize
    k_1 = function(functionparameter, t,                u_i                       )
    k_2 = function(functionparameter, t + stepsize/2.0, u_i + stepsize * k_1 / 2.0)
    k_3 = function(functionparameter, t + stepsize/2.0, u_i + stepsize * k_2 / 2.0)
    k_4 = function(functionparameter, t + stepsize,     u_i + stepsize * k_3      )
    u_i = u_i + stepsize * ( k_1/6.0 + k_2/3.0 + k_3/3.0 + k_4/6.0)
  endfor
endfunction
