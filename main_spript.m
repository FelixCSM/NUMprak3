#! /bin/octave
interval = [0,10]
########################################################################
### task c)
function_to_analyse = @awp_1
y_of_0 = 0 #y(0)=0
for a = [-10, 1]
  for tau_maker = 1:12
    tau = 2.0**(-(tau_maker-1));
    disp(["a ist ", a, " Schrittweite ist", tau])
    disp("Ergebnis des expliziten Eulerverfahrens")
    ret_y = explicitEulerMethod(function_to_analyse, a, interval, tau, y_of_0)
    disp("Ergebnis des Runge-Kutta-Verfahrens ist")
    ret_y = rungeKuttaMethod(function_to_analyse, a, interval, tau, y_of_0)
  endfor
endfor

########################################################################
### task d)
function_to_analyse = @awp_2
alpha = 100
y_of_0 = alpha
beta = 1
taus = [0.05];
for i = 1:5
  taus(i+1) = taus(i)/2.0;
endfor
for tau = taus
  disp(["beta = ", beta, "; alpha = ", alpha, "; Tau = ", tau])
    disp("Ergebnis des expliziten Eulerverfahrens")
    ret_y = explicitEulerMethod(function_to_analyse, beta, interval, tau, y_of_0)
    disp("Ergebnis des Runge-Kutta-Verfahrens ist")
    ret_y = rungeKuttaMethod(function_to_analyse, beta, interval, tau, y_of_0)
endfor