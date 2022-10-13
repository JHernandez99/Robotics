% Solucion de polinomio de 3º
clear all
%clf
clc
% Valores de variables de entrada 
th0 = 0; 
thf = 90*pi/180;
thp0 = 0; 
thpf = 0;
t0=0;
tf=2;

% Determinamos valores de coeficientes
a0 = th0;
a1 = 0;
a2 = 3*(thf-th0)/tf^2;
a3 = -2*(thf-th0)/tf^3;

% Resolviendo 
i=0;
for t=0:0.1:2
    i = i + 1;
    ti(:,i) = t;
    th(:,i) = a0 + a1*t + a2*t^2 + a3*t^3;
    thp(:,i) = a1 + 2*a2*t + 3*a3*t^2;
    thpp(:,i) = 2*a2 + 6*a3*t; 
end

figure('Name','Posicion, velocidad y aceleracion angular');
% Generamos una tabla 3 renglones 1 columna y dibujar en la 1 
subplot(3,1,1),plot(ti,th),title('Posicion'),xlabel('tiempo'),ylabel('Posicion (rad)'),grid;
subplot(3,1,2),plot(ti,thp),title('Velocidad'),xlabel('tiempo'),ylabel('Velocidad(rad/s)'),grid;
subplot(3,1,3),plot(ti,thpp),title('Aceleracion'),xlabel('tiempo'),ylabel('Aceleracion(rad/s^2)'),grid;





