%% Transformadas de orientacion metodo D-H
clc;

syms th_;
syms a_;
syms d_;
syms a_;


alfa = 0; 
a = a_;
theta = 0;
d = 0;


T = [cosd(theta) -sind(theta) 0 a;
     sind(theta)*cosd(alfa) cosd(theta)*cosd(alfa) -sind(alfa) -sind(alfa)*d;
     sind(theta)*sind(alfa) cosd(theta)*sind(alfa) cosd(alfa) cosd(alfa)*d;
     0 0 0 1]

pretty(T)