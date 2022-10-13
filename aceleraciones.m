clc;
clear all;
%% DENAVIT HARTENVERG de 4 valores
% Variables para denavit hartenverg
syms L1; syms L2; syms L3; syms L4;
syms th1; syms th2; syms th3;

alfa = [0, pi/2, 0, 0]
a = [0, 0, L3, L4]
theta = [th1, th2, th3, 0]
d = [L1+L2, 0, 0, 0]

%disp(alfa(2))

%% Analisis de posicion Calculando las transformadas
T01 = [cos(theta(1)) -sin(theta(1)) 0 a(1);
     sin(theta(1))*cos(alfa(1)) cos(theta(1))*cos(alfa(1)) -sin(alfa(1)) -sin(alfa(1))*d(1);
     sin(theta(1))*sin(alfa(1)) cos(theta(1))*sin(alfa(1)) cos(alfa(1)) cos(alfa(1))*d(1);
     0 0 0 1]

T12 = [cos(theta(2)) -sin(theta(2)) 0 a(2);
     sin(theta(2))*cos(alfa(2)) cos(theta(2))*cos(alfa(2)) -sin(alfa(2)) -sin(alfa(2))*d(2);
     sin(theta(2))*sin(alfa(2)) cos(theta(2))*sin(alfa(2)) cos(alfa(2)) cos(alfa(2))*d(2);
     0 0 0 1]

T23 = [cos(theta(3)) -sin(theta(3)) 0 a(3);
     sin(theta(3))*cos(alfa(3)) cos(theta(3))*cos(alfa(3)) -sin(alfa(3)) -sin(alfa(3))*d(3);
     sin(theta(3))*sin(alfa(3)) cos(theta(3))*sin(alfa(3)) cos(alfa(3)) cos(alfa(3))*d(3);
     0 0 0 1]

T34 = [cos(theta(4)) -sin(theta(4)) 0 a(4);
     sin(theta(4))*cos(alfa(4)) cos(theta(4))*cos(alfa(4)) -sin(alfa(4)) -sin(alfa(4))*d(4);
     sin(theta(4))*sin(alfa(4)) cos(theta(4))*sin(alfa(4)) cos(alfa(4)) cos(alfa(4))*d(4);
     0 0 0 1]
 
T04 = simplify(T01*T12*T23*T34)

%Obtencion de rotacionales
R10 = sym(zeros(3,3));
R21 = sym(zeros(3,3));
R32 = sym(zeros(3,3));
R43 = sym(zeros(3,3));

R04 = sym(zeros(3,3));

for i=1:1:3
    for j=1:1:3
        
        R10(i,j) = T01(i,j);
        R21(i,j) = T12(i,j);
        R32(i,j) = T23(i,j);
        R43(i,j) = T34(i,j);
        
        R04(i,j) = T04(i,j);
    end
end

%Transpuesta de la matriz
R10 = R10.';
R21 = R21.';
R32 = R32.';
R43 = R43.';

%% Obtencion de vectores de posicion 
PO1 = sym(zeros(1,3));
P12 = sym(zeros(1,3));
P23 = sym(zeros(1,3));
P34 = sym(zeros(1,3));
for i=1:1:3
    P01(i) = T01(i,4); 
    P12(i) = T12(i,4); 
    P23(i) = T23(i,4); 
    P34(i) = T34(i,4); 
end
P01 =P01.' 
P12 =P12.' 
P23 =P23.'
P34 =P34.' 


%% Obtencion de velocidades
% Velocidades que se suponen conocidas 

syms th1p; syms th2p; syms th3p;
Z11 = [0; 0; 1]
w00 = sym(zeros(3,1))
v00 = sym(zeros(3,1))

w11 = R10*w00  + th1p*Z11
v11 = R10*(v00 + cross(w00,P01))

Z22 = [0; 0; 1]
w22 = R21*w11 + th2p*Z22
v22 = R21*(v11 + cross(w11,P12))

Z33 = [0;0;1]
w33 = simplify(R32*w22 + th3p*Z33)
v33 = R32*(v22 + cross(w22,P23))

Z44 = [0;0;1]
thp4 = 0;
w44 = simplify(R43*w33 + thp4*Z44)
v44 = R43*(v33 + cross(w33,P34))


%% Calculo de aceleraciones 
%Aceleraciones que se suponen conocidas
syms th1pp; syms th2pp; syms th3pp;
syms g;
syms Lc1; syms Lc3;syms Lc4;

d1p  = sym(zeros(3,1))
d1pp = sym(zeros(3,1))
w00p = sym(zeros(3,1))
%v00p = sym(zeros(3,1))
v00p = [0;0;g]
P11c = [0;0;Lc1]

w11p = R10*w00p + R10*cross(w00,th1p*Z11) + th1pp*Z11 
v11p = R10*(cross( w00p , P01) + cross(w00, cross(w00,P01)) + v00p )+ 2*cross(w11, d1p.*Z11) + d1pp.*Z11
v11cp = cross(w11p, P11c) + cross(w11, cross(w11,P11c)) + v11p

d2p = [0;0;0]
d2pp= [0;0;0]
P22c= [0;0;0]
w22p = simplify(R21*w11p + R21*cross(w11,th2p*Z22) + th2pp*Z22 )
v22p = simplify(R21*(cross( w11p , P12) + cross(w11, cross(w11,P12)) + v11p )+ 2*cross(w22, d2p.*Z22) + d2pp.*Z22)
v22cp = simplify(cross(w22p, P22c) + cross(w22, cross(w22,P22c)) + v22p)

d3p = [0;0;0]
d3pp= [0;0;0]
P33c= [Lc3;0;0]
w33p = simplify(R32*w22p + R32*cross(w22,th3p*Z33) + th3pp*Z33)
v33p = simplify(R32*(cross( w22p , P23) + cross(w22, cross(w22,P23)) + v22p )+ 2*cross(w33, d3p.*Z33) + d3pp.*Z33)
v33cp = simplify(cross(w33p, P33c) + cross(w33, cross(w33,P33c)) + v33p)

d4p = [0;0;0]
d4pp= [0;0;0]
P44c= [Lc4;0;0]
th4p = [0;0;0]
th4pp = [0;0;0]
w44p = simplify(R43*w33p + R43*cross(w33,th4p.*Z44) + th4pp.*Z44)
v44p = simplify(R43*(cross( w33p , P34) + cross(w33, cross(w33,P34)) + v33p )+ 2*cross(w44, d4p.*Z44) + d4pp.*Z44)
v44cp = simplify(cross(w44p, P44c) + cross(w44, cross(w44,P44c)) + v44p)









