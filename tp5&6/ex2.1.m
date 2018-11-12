c=1 #paramètre
# définition système
ode_sys = inline(sprintf('[%f*sin(t)]',c), 't', 'x') 
[ts,ys] = ode45(ode_sys, [0,10], [1]) # résolution système 
plot(ts,ys)



