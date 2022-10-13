%% Analisis dinamico RRP aplicando N-E
clear all
clc
%% Eslabon 1 Propiedades
g = 9.81; L1 = 0; Lc1x = 0; Lc1y = 0; Lc1z = 57.22/1000; m1 = 0.236965;
alp0=0; a0=0; d1=L1; w0=[0;0;0]; z1=[0;0;1]; v0=[0;0;0]; dp1=0; dpp1=0;
wp0=[0;0;0]; vp0=[0;0;g]; Ixx1=0.000107; Iyy1=0.000107; Izz1=0.000072; Pc1=[Lc1x; Lc1y; Lc1z];

Ic1=[Ixx1,0,0;
     0,Iyy1,0;
     0, 0, Izz1]

syms th1 thd1 thdd1
T01=[cos(th1), -sin(th1), 0, a0;
    sin(th1)*cos(alp0), cos(th1)*cos(alp0), -sin(alp0), -sin(alp0)*d1;
     sin(th1)*sin(alp0), cos(th1)*sin(alp0), cos(alp0), cos(alp0)*d1;
     0, 0, 0, 1]
R01 = T01(1:3,1:3)
P01 = T01(1:3,4)
R10 = R01.'
%Iteraciones salientes
w1=R10*w0+thd1*z1;
v1=R10*(v0+cross(w0,P01))+dp1*z1;
wp1=R10*wp0+cross(R10*w0,thd1*z1)+thdd1*z1;
vp1 = R10*(cross(wp0, P01) + cross(w0,cross(w0,P01)) + vp0) + 2*cross(w1,dp1*z1)+dpp1*z1
vpc1 = cross(wp1,Pc1) + cross(w1,cross(w1,Pc1)) + vp1
F1 = m1*vpc1;
N1 = Ic1*wp1+cross(w1,Ic1*w1);
%VPA para simplificar las expresiones
%Tarea desarrollar lo mismo para el eslabon 2 y el 3 


%w11p = R10*w00p + R10*cross(w00,th1p*Z11) + th1pp*Z11 
%v11p = R10*(cross( w00p , P01) + cross(w00, cross(w00,P01)) + v00p )+ 2*cross(w11, d1p.*Z11) + d1pp.*Z11
%v11cp = cross(w11p, P11c) + cross(w11, cross(w11,P11c)) + v11p

%% Eslabon 2 Propiedades
syms d2 dp2 dpp2
m2=0.124538; Lc2x=0; Lc2y=0; Lc2z=-0.219451;
alp1=0; a1=0; z2=[0;0;1]; Ixx2=0.002205; Iyy2=0.002205; Izz2=0.000002;
Ic2=[Ixx2,0,0; 0,Iyy2,0; 0,0,Izz2]; th2=0; thd2=0; thdd2=0;
%Transformada homogenea y posicion del eslabon 2
T12=[cos(th2), -sin(th2), 0, a1;
    sin(th2)*cos(alp1), cos(th2)*cos(alp1), -sin(alp1), -sin(alp1)*d2;
     sin(th2)*sin(alp1), cos(th2)*sin(alp1), cos(alp1), cos(alp1)*d2;
     0, 0, 0, 1]
R12 = T12(1:3,1:3)
P12 = T12(1:3,4)
Pc2=[Lc2x; Lc2y; Lc2z];
R21 = R12.'
%Iteraciones salientes
w2=R21*w1+thd2*z2;
v2=R21*(v1+cross(w1,P12))+dp2*z2;
wp2=R21*wp1+cross(R21*w1,thd2*z2)+thdd2*z2;
vp2 = R21*(cross(wp1, P12) + cross(w1,cross(w1,P12)) + vp1) + 2*cross(w2,dp2*z2)+dpp2*z2
vpc2 = cross(wp2,Pc2) + cross(w2,cross(w2,Pc2)) + vp2
F2 = m2*vpc2;
N2 = Ic2*wp2+cross(w2,Ic2*w2);

%% Eslabon 3
syms d3 dp3 dpp3
Lc3x = -0.14751; Lc3y=0; Lc3z=0; m3=0.084375;
alp2=0; a2=d3; L3=0.0; x3=[1;0;0]; Ixx3=0.000002; Iyy3=0.000621; Izz3=0.000621;
Ic3=[Ixx3,0,0; 0, Iyy3,0; 0,0,Izz3]; th3=0; thd3=0; thdd3=0;
%Transformada homogenea y posicion del eslabon 2
T23=[cos(th3), -sin(th3), 0, a2;
    sin(th3)*cos(alp2), cos(th3)*cos(alp2), -sin(alp2), -sin(alp2)*L3;
     sin(th3)*sin(alp2), cos(th3)*sin(alp2), cos(alp2), cos(alp2)*L3;
     0, 0, 0, 1]
R23 = T23(1:3,1:3);
P23 = T23(1:3,4);
Pc3=[Lc3x; Lc3y; Lc3z];
R32 = R23.'
%Iteraciones salientes
w3=R32*w2+thd3*x3;
v3=R32*(v2+cross(w2,P23))+dp3*x3;
wp3=R32*wp2+cross(R32*w2,thd3*x3)+thdd3*x3;
vp3 = R32*(cross(wp2, P23) + cross(w2,cross(w2,P23)) + vp2) + 2*cross(w3,dp3*x3)+dpp3*x3
vpc3 = cross(wp3,Pc3) + cross(w3,cross(w3,Pc3)) + vp3
F3 = m3*vpc3;
N3 = Ic3*wp3+cross(w3,Ic3*w3);

%% Datos de pinza 
alp3=0; a3=0; d4=0; th4=0; thd4=0; thdd4=0; z4=[0;0;1]; dp4=0; dpp4=0;
%transformada homogenea y posicion de las pinzas 
T34=[cos(th4), -sin(th4), 0, a3;
    sin(th4)*cos(alp3), cos(th4)*cos(alp3), -sin(alp3), -sin(alp3)*d4;
     sin(th4)*sin(alp3), cos(th4)*sin(alp3), cos(alp3), cos(alp3)*d4;
     0, 0, 0, 1]
R34=T34(1:3,1:3);
P34=T34(1:3,4);
Pc4=[0;0;0];
R43=transpose(R34);
T04=T01*T12*T23*T34;
simplify(T04);

%iteraciones entrantes 
f4=[0;0;0]; n4=[0;0;0] %Fuerzas externas
f3=R34*f4+F3;
n3 = N3+R34*n4+cross(Pc3, F3) + cross(P34, R34*f4);
f2=R23*f3+F2;
n2 = N2+R23*n3+cross(Pc2, F2) + cross(P23, R23*f3);
f2=R23*f3+F2;
n2 = N2+R23*n3+cross(Pc2, F2) + cross(P23, R23*f3);
f1=R12*f2+F1;
n1 = N1+R12*n2+cross(Pc1, F1) + cross(P12, R12*f2);
%ns1=simplify(n1)
%f2s=simplify(f2)
%f3s=simplify(f3)

%Evaluacion de las ecuaciones mediante ciclo for
i=0;
for t=0:0.1:3
    % se resuelve con un perfil de velocidad
    %perfil para eslabon 1  de 5to grado
    t10=0; t1f=3; P10=0; P1f=pi; v10=0; v1f=0; ac10=0; ac1f=0;
    a10=P10;
    a11=v10;
    a12=ac10/2;
    a13=(20*P1f-20*P10-(8*v1f+12*v10)*t1f-(3*ac10-ac1f)*t1f^2)/(2*t1f^3);
    a14=(30*P10-30*P1f+(14*v1f+16*v10)*t1f+(3*ac10-2*ac1f)*t1f^2)/(2*t1f^4);
    a15=(12*P1f-12*P10-(6*v1f+6*v10)*t1f+(ac10-ac1f)*t1f^2)/(2*t1f^5);
    %%Agregar perfiles de E2 y E3
    th11 = a10 + a11*t + a12*t^2 + a13*t^3 + a14*t^4 + a15*t^5;
    thd11 = a11 + 2*a12*t + 3*a13*t^2 + 4*a14*t^3 + 5*a15*t^4;
    thdd11 = 2*a12 + 6*a13*t + 12*a14*t^2 + 20*a15*t^3;
    
    %perfil del eslabon 2
    t20=0; t2f=3; P20=0; P2f=pi; v20=0; v2f=0; ac20=0; ac2f=0;
    a20=P20;
    a21=v20;
    a22=ac20/2;
    a23=(20*P2f-20*P20-(8*v2f+12*v20)*t2f-(3*ac20-ac2f)*t2f^2)/(2*t2f^3);
    a24=(30*P20-30*P2f+(14*v2f+16*v20)*t2f+(3*ac20-2*ac2f)*t2f^2)/(2*t2f^4);
    a25=(12*P2f-12*P20-(6*v2f+6*v20)*t2f+(ac20-ac2f)*t2f^2)/(2*t2f^5);
    %perfil del eslabon 3
    t30=0; t3f=3; P30=0; P3f=pi; v30=0; v3f=0; ac30=0; ac3f=0;
    a30=P30;
    a31=v30;
    a32=ac30/2;
    a33=(20*P3f-20*P30-(8*v3f+12*v30)*t3f-(3*ac30-ac3f)*t3f^2)/(2*t3f^3);
    a34=(30*P30-30*P3f+(14*v3f+16*v30)*t3f+(3*ac30-2*ac3f)*t3f^2)/(2*t3f^4);
    a35=(12*P3f-12*P10-(6*v3f+6*v30)*t3f+(ac30-ac3f)*t3f^2)/(2*t3f^5);
    
end




