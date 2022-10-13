%% Rs por jacobianos 
syms L1
syms L2
syms L3
syms L4
syms th1
syms th2
syms th3

R04 = [cos(th1)*cos(th2)*cos(th3)-cos(th1)*sin(th2)*sin(th3) -cos(th1)*cos(th2)*sin(th3)-cos(th1)*cos(th3)*sin(th2) sin(th1);
      cos(th2)*cos(th3)*sin(th1)-sin(th1)*sin(th2)*sin(th3) -cos(th2)*sin(th1)*sin(th3)-cos(th3)*sin(th1)*sin(th2) -cos(th1);
      cos(th3)*sin(th3)+cos(th3)*sin(th2) cos(th2)*cos(th3)-sin(th2)*sin(th3) 0];
R04 = simplify(R04)
J4 = [-(L1+L2)*cos(th2)*cos(th3)+sin(th3)*(L1+L2)*sin(th2) sin(th3)*L3 0;
      (L1+L2)*cos(th2)*sin(th3)+cos(th3)*(L1+L2)*sin(th2)+L4*(sin(th2)*sin(th3)-cos(th2)*cos(th3)) cos(th3)*L3 0;
      -cos(th2)*L3 L4 L4]
J0 = R04*J4
simplify(J0)
d = det(J0)
simplify(d)
%pretty(d)
