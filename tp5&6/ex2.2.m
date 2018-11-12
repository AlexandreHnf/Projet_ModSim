c=0.1 #paramètre
# définition système
ode_sys = inline(sprintf('[%f*t]',c), 't', 'x') 
[ts,ys] = ode45(ode_sys, [0,10], [0]) # résolution système 
plot(ts,ys)