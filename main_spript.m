#! /bin/octave
interval = [0, 10];
########################################################################
### task c)
function_to_analyse = @awp_1
y_of_0 = 0 #y(0)=0
analytical_matrix = [];
for a = [-10, 1]
  for tau_maker = 1:12
    tau = 2.0**(-(tau_maker-1));
    y_exp = explicitEulerMethod(function_to_analyse, a, interval, tau, y_of_0);
    y_rk4 = rungeKuttaMethod(function_to_analyse, a, interval, tau, y_of_0);
    if tau_maker == 1
      analytical_matrix(tau_maker,1:5) = [tau, y_exp, 0 , y_rk4, 0];
    else
      numerische_konvergenz_exp = norm(y_exp - sin(interval(2)))/norm(last_y_exp - sin(interval(2)));
      numerische_konvergenz_rk4 = norm(y_rk4 - sin(interval(2)))/norm(last_y_rk4 - sin(interval(2)));
      analytical_matrix(tau_maker,1:5) = [tau, y_exp, numerische_konvergenz_exp, y_rk4, numerische_konvergenz_rk4];
    endif
      last_y_exp = y_exp;
      last_y_rk4 = y_rk4;
  endfor
disp(analytical_matrix)
endfor

########################################################################
### task d)
function_to_analyse = @awp_2
alpha = 100;
y_of_0 = alpha;
beta = 1;
taus = [0.05];
for i = 1:5
  taus(i+1) = taus(i)/2.0;
endfor
for tau = taus
  disp(["beta = ", num2str(beta), "; alpha = ", num2str(alpha), "; Tau = ", num2str(tau)])
    disp("Ergebnis des expliziten Eulerverfahrens")
    ret_y = explicitEulerMethod(function_to_analyse, beta, interval, tau, y_of_0)
    disp("Ergebnis des Runge-Kutta-Verfahrens ist")
    ret_y = rungeKuttaMethod(function_to_analyse, beta, interval, tau, y_of_0)
endfor
