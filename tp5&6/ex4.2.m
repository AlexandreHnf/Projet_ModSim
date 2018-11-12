c=0.02 #paramètre
# définition système
ode_sys = @(t,x) [0.1*t-c*x(1)]
[ts,ys] = ode23(ode_sys, [0,50], [1]) # résolution système 
plot(ts,ys)