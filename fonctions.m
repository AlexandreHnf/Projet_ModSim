% === (0, 3)                         mat 1
%A = [3 0;0 0];
%A = [3 0;0 3];
%A = [3 0;0 -3];
%A = [0 3;0 0];

% === (1, -1)                        mat 2
%A = [1 -1;0 0];
%A = [1 -1;-1 1];
%A = [1 -1;1 -1];
%A = [0 1;-1 0];

% === (-1, 0)                        mat 3
%A = [-1 0;0 0];
%A = [-1 0;0 -1];
%A = [-1 0;0 1];
%A = [0 -1;0 0];

% === (-1, -2)                       mat 4
%A = [-1 -2;0 0];
%A = [-1 -2;-2 -1];
%A = [-1 -2;2 1];
%A = [0 -1;-2 0];

% === (2, 2)                         mat 5
%A = [2 2; 0 0];
%A = [2 2; 2 2];
%A = [2 2; -2 -2];
%A = [0 2; 2 0];

%A=[-1 1; 0 0];
%A= [0 1;1 0];
A = [1 0;0 1];

function [t,x] = system_simulation(A, init)
    ode_sys = @(t,x) [A(1,1)*x(1)+A(1,2)*x(2);A(2,1)*x(1)+A(2,2)*x(2)]; # Définition système
    %[t,x] = ode23 (ode_sys, [0, 10], [2, 0]); # Résolution système
    [t,x] = ode23 (ode_sys, [0, 10], init); # Résolution système
endfunction

%[t,x] = system_simulation(A);
[t,x] = system_simulation(A, [10, 10])
%[t,x] = system_simulation(A, [-5, -2]);
%[t,x] = system_simulation(A, [2, 0]);
%[t,x] = system_simulation(A, [2, 0]);
%[t,x] = system_simulation(A, [2, 0]);

%figure(1)
%plot(t,x)

# 2. Dessiner les droites correspondants aux vecteurs propres et le sense des trajectoires associés
function [eigenline_1,eigenline_2,V] = compute_eigenlines(A,line_range)
    [V,L] = eig(A);
    eigenline_1 = (V(2,1)/V(1,1)) * line_range;
    eigenline_2 = (V(2,2)/V(1,2)) * line_range;
endfunction

# 3. Calculer les isoclines
function [isocline_1,isocline_2] = compute_isoclines(A,line_range)
    isocline_1 = -(A(1,1)/A(1,2)) * line_range;
    isocline_2 = -(A(2,1)/A(2,2)) * line_range;
endfunction

# 4. Portrait de phase complet
function [x1,x2,x1p,x2p] = plot_portrait_phase_complete(A)
    #grid for plotting
    x1range=-1.5:.1:1.5;
    x2range=-1.5:.1:1.5;
    [x1,x2] = meshgrid(x1range, x2range);

    # Define the system to plot (based on matrix A)
    x1p = A(1,1)*x1+A(1,2)*x2;
    x2p = A(2,1)*x1+A(2,2)*x2;

    #Normalize values for plotting
    norms=sqrt(x1p.^2+x2p.^2);
    
    figure(2)
    [eigenline_1,eigenline_2,V] = compute_eigenlines(A,x1range);
    [isocline_1,isocline_2] = compute_isoclines(A,x1range);
    
    # Vector field plot
    hold on;
    quiver(x1,x2,x1p./norms,x2p./norms,0.5);
    # Isoclines
    plot(x1range,isocline_1,"linewidth",5);
    plot(x1range,isocline_2,"linewidth",5);
    # Vecteurs propres
    plot(x1range,eigenline_1,"linewidth",5);
    plot(x1range,eigenline_2,"linewidth",5);
    quiver([0;0],[0;0],V(1,:),V(2,:),"linewidth",10,"color","k");
    legend("field","v_1","v_2","isocline_1","isocline_2","location","south","orientation", "horizontal");
    
endfunction

[x1,x2,x1p,x2p] = plot_portrait_phase_complete(A);
