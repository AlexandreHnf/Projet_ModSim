c=-0.1 #paramètre
# définition système
ode_sys = @(t,x) [c*x(1)]
[ts,ys] = ode45(ode_sys, [0,10], [2]) # résolution système 
plot(ts,ys)