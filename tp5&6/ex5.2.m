c=0.2 #paramètre
# définition système
ode_sys = @(t,x) [c*x(1)*(1-x(1)/1.5)]
[ts,ys] = ode23(ode_sys, [0,50], [3]) # résolution système 
plot(ts,ys)