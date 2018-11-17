% Implémentation 1

c = 0.5 # Paramètre
ode_sys = @(t,x) [c*sin(t)] # Définition système
[t,x] = ode23 (ode_sys, [0, 10], [1]); # Résolution système
plot(t,x)

% Implémentation 2

c=1 #paramètre
# définition système
ode_sys = inline(sprintf('[%f*sin(t)]',c), 't', 'x') 
[ts,ys] = ode45(ode_sys, [0,10], [1]) # résolution système 
plot(ts,ys)



