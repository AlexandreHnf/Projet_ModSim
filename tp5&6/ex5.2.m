c=0.2 #paramètre
c = 0.2 # Paramètre
k = 1.5 # Paramètre
ode_sys = @(t,x) [c*x(1)*(1-x(1)/k)] # Définition système
[t,x] = ode23 (ode_sys, [0, 50], [3]); # Résolution système
plot(t,x)