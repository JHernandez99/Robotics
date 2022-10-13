%Solucion de polinomio de 5to°
clear all
%clf
clc
%Valores de variables de entrada
th0=0; thf= 90*pi/180;
thp0=0; thpf = 0;
thpp0=0; thppf = 0;
t0=0; tf=2;

%Determinar valores de coeficientes
a0 = th0;
a1 = thp0;
a2 = thpp0/2;
a3 = (20*thf-20*th0-(8*thpf+12*thp0)*tf-(3*thpp0-thppf)*tf^2)/(2*tf^3);
a4 = (30*th0-30*thf+(14*thpf+16*thp0)*tf+(3*thpp0-thppf))/(2*tf^4);
a5 = (12*thf-12*th0-(6*thpf+6*thp0)*tf-(thpp0-thppf)*tf^2)/(2*tf^5);

%Resolviendo 
i=0;
for t=0:0.1:2
    i=i+1;
    ti(:,i) = t;
    th(:,i) = a0+a1*t+a2*t^2+a3*t^3+a4*t^4+a5*t^5;
    thp(:,i) = a1+2*a2*t+3*a3*t^2+4*a4*t^3+5*a5*t^4;
    thpp(:,i) = 2*a2+6*a3*t+12*a4*t^2+20*a5*t^3;
end

%Visualización de figuras
figure('Name','Posición, velocidad y aceleración angular');
subplot(3,1,1),plot(ti,th),title('Posición'),xlabel('Tiempo'),ylabel('Posición (rad)'), grid;
subplot(3,1,2),plot(ti,thp),title('Velocidad'),xlabel('Tiempo'),ylabel('Velocidad (rad/s)'), grid;
subplot(3,1,3),plot(ti,thpp),title('Aceleración'),xlabel('Tiempo'),ylabel('Aceleración (rad/s^2)'), grid;


