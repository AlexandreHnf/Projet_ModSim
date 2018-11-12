A = [1 3; 3 1];
ode_sys = @(t,x) [A(1,1)*x(1) + A(1,2)*x(2);A(2,1)*x(1) + A(2,2)*x(2)];

[t,x]=ode23(ode_sys, [0,1], [0.5,0]);
plot(t,x)

%plot(x(:,1), x(:,2))