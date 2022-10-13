syms th1
syms a4
syms a1
syms d2
syms th3

Th01 = [cos(th1), -sin(th1), 0, 0;
        sin(th1) cos(th1) 0 0;
        0 0 1 0
        0 0 0 1]
    
Th12 = [1 0 0 0;
        0 1 0 0;
        0 0 1 a1;
        0 0 0 1]
    
Th23 = [cos(th3) -sin(th3) 0 0;
        sin(th3) cos(th3) 0 0;
        0 0 1 d2;
        0 0 0 1]
    
Th34 = [1 0 0 0;
        0 1 0 0;
        0 0 1 a4;
        0 0 0 1]
 
Th04 = Th01 * Th12 * Th23 * Th34
Th03 = Th01 * Th12 * Th23
Th02 = Th01 * Th12


%% 
syms th1
syms d2
syms a2
syms d3
syms th2

Th01 = [cos(th1) -sin(th1) 0 0;
        sin(th1) cos(th1) 0 0;
        0 0 1 0;
        0 0 0 1]
Th12 = [cos(th2 + 90) -sin(th2+90) 0 0;
        0 0 -1 -d2;
        sin(th2+90) cos(th2+90) 0 0;
        0 0 0 1]

Th23 = [1 0 0 0;
        0 0 -1 -a2;
        0 1 0 0;
        0 0 0 1]
    
Th34 = [1 0 0 0;
        0 1 0 0;
        0 0 1 d3;
        0 0 0 1]
    
Th04 = Th01 * Th12 * Th23 * Th34
Th03 = Th01 * Th12 * Th23
Th02 = Th01 * Th12 


%% 
syms th1
syms a4
syms a2
syms a3
syms th2
syms th3

Th01 = [cos(th1) -sin(th1) 0 0;
        sin(th1) cos(th1) 0 0;
        0 0 1 0;
        0 0 0 1]
    
Th12 = [cos(th2 +90) -sin(th2+90) 0 0;
    0 0 -1 -a2;
    sin(th2+90) cos(th2+90) 0 0;
    0 0 0 1]

Th23 = [cos(th3) -sin(th3) 0 0;
        sin(th3) cos(th3) 0 0;
        0 0 1 a3;
        0 0 0 1]
Th34 = [1 0 0 0;
        0 1 0 0;
        0 0 1 a4;
        0 0 0 1]
Th04 = Th01 * Th12 * Th23 * Th34
Th03 = Th01 * Th12 * Th23
Th02 = Th01 * Th12 

%%
clc
clear all;
T01 = [1 0 0 0;
       0 0 -1 0;
       0 1 0 0;
       0 0 0 1]

   
T12 = [0 -1 0 4;
       1 0 0 0;
       0 0 1 -3;
       0 0 0 1]
   
T23 = [0 1 0 7;
       0 0 -1 0;
       -1 0 0 0;
       0 0 0 1]
   
T00 = T01*T12*T23


%%
clc
clear all
syms th1
syms th2
syms L2
syms L3
syms d1
syms d3

T01 = [cos(th1) -sin(th1) 0 0;
       sin(th1) cos(th1) 0 0;
       0 0 1 d1;
       0 0 0 1]
T12 = [cos(th2) -sin(th2) 0 L2;
       -sin(th2) -cos(th2) 0 0;
       0 0 -1 0;
       0 0 0 1]
T23 = [1 0 0 L3;
       0 1 0 0;
       0 0 1 d3;
       0 0 0 1]

TC0 = T01*T12*T23
T20 = T01*T12
%%
clc 
clear all
syms th1
syms th2
syms th3
syms L1
syms L2
syms L3
syms L4

T01 = [cos(th1) -sin(th1) 0 0;
       sin(th1) cos(th1) 0 0;
       0 0 1 L1+L2;
       0 0 0 1]
   
T12 = [cos(th2) -sin(th2) 0 0;
       0 0 -1 0;
       sin(th2) cos(th2) 0 0;
       0 0 0 1]
   
T23 = [cos(th3) -sin(th3) 0 L3;
       sin(th3) cos(th3) 0 0;
       0 0 1 0;
       0 0 0 1]
   
T3T = [1 0 0 L4;
       0 1 0 0;
       0 0 1 0;
       0 0 0 1]

T0T= T01*T12*T23*T3T


%%
r01 = [cos(th1) -sin(th1) 0;
       sin(th1) cos(th1) 0;
       0 0 1]
r12 = [cos(th2) -sin(th2) 0;
       0 0 -1;
       sin(th2) cos(th2) 0]
r23 = [cos(th3) -sin(th3) 0;
       sin(th3) cos(th3) 0;
       0 0 1]
r03 = r01*r12*r23
r03 = simplify(r03)

jt = [0 L3*sin(th3) 0;
      0 L3*cos(th3)+L4 L4;
      -L3*cos(th2)-L4*cos(th2+th3) 0 0]
  
j0 = r03*jt
j0 = simplify(j0)
d= det(j0)
d = simplify(d)

%%
clc
clear all
syms a2
syms a3
syms a4
syms th1

j0 = [a2*cos(th1)+a3*cos(th1)+a4*cos(th1) 0 0;
      a2*sin(th1)+a3*sin(th1)+a4*sin(th1) 0 0;
      0 0 0]
det(j0)



