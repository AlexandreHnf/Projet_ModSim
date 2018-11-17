A = [1 3; 0 0];

% le système
ode_sys = @(t,x) [A(1,1)*x(1) + A(1,2)*x(2);A(2,1)*x(1) + A(2,2)*x(2)];
[t,x]=ode23(ode_sys, [0,10], [0.5,0]);
%plot(t,x)

% calcul des valeurs propres
[V,L] = eig(A)

% =============================================
% ======== Dessin des vecteurs propres ========
% =============================================

line_range = -1.5:.1:1.5;
line_1 = (V(2,1)/V(1,1)) * line_range;
line_2 = (V(2,2)/V(1,2)) * line_range;
figure(1)
hold on;
plot(line_range,line_1,"linewidth",10);
plot(line_range,line_2,"linewidth",10);
quiver([0;0],[0;0],V(1,:),V(2,:),"linewidth",10,"color","k")
hold off;

% ======================================
% ======== Dessin des isoclines ========
% ======================================

line_range = -1.5:.1:1.5;
isocline_1 = -(A(1,1)/A(1,2)) * line_range;
isocline_2 = -(A(2,1)/A(2,2)) * line_range;

figure(2)
hold on;
plot(line_range,isocline_1,"linewidth",10);
plot(line_range,isocline_2,"linewidth",10);
legend("isocline_1","isocline_2","location","southwest");
hold off;

% =========================================
% ======== Dessin des vecteurs vitesse ========
% =========================================

point_sequence = [[1,1];[-1,-1];[-1,1];[1,-1]]';
velocity_sequence = [];
for point_vec = point_sequence # Column-wise iteration
    velocity_vec = A*point_vec
    velocity_norm = velocity_vec/norm(velocity_vec);
    velocity_sequence = [velocity_sequence,velocity_norm];
endfor

% affichage
figure(3)
hold on;
quiver(point_sequence(1,:),point_sequence(2,:),velocity_sequence(1,:),velocity_sequence(2,:),0.2,"linewidth",5,"color","k")
plot(point_sequence(1,:),point_sequence(2,:),"ok")
plot(line_range,line_1,"linestyle",":","color","k");
plot(line_range,line_2,"linestyle",":","color","k");
hold off;

% ===================================
% ======== Portrat de phase ========
% ===================================

x1range=-1.5:.1:1.5;
x2range=-1.5:.1:1.5;
[x1,x2] = meshgrid(x1range, x2range);

# Définit le système à afficher (basé sur la matrice A)
x1p = A(1,1)*x1+A(1,2)*x2;
x2p = A(2,1)*x1+A(2,2)*x2;

# Normalise les valeurs pour l'affichage
arrow=sqrt(x1p.^2+x2p.^2);

# Création du portrait de phase
figure(4)
hold on;
quiver(x1,x2,x1p./arrow,x2p./arrow,0.5);
# Line plot
plot(line_range,line_1,"linewidth",10,"color","k");
plot(line_range,line_2,"linewidth",10,"color","k");
grid on;
axis tight;
hold off;