c=2 #paramètre
# définition système
ode_sys = @(t,x) [1-c*x(1)]
[ts,ys] = ode23(ode_sys, [0,10], [1]) # résolution système 
plot(ts,ys)