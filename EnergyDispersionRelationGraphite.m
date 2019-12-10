clc
clear all;
close all;

nano = 10^-9;
a = 1;
%phi_a = 1;
%phi_b = 1;
%energy dispersion relation
e2p = 0;
t = -3.033;
s = 0.129;
i = 1;
j = 1;
clear Eg2Dp;
clear Eg2Dn;
%{
for k_x = -sqrt(3)*pi/a :0.1: sqrt(3)*pi/a
    for k_y = -pi:0.1:pi
        omega = sqrt(1+4*cos(sqrt(3)*k_x*a/2)*cos(k_y*a/2)+ 4*cos(k_y*a/2)*cos(k_y*a/2));
        Eg2Dp (i,j) = (e2p + t*omega)/(1 + s*omega);
        Eg2Dn (i,j) = (e2p - t*omega)/(1 - s*omega);
        j = j+1;
    end
j = 1;
i = i+1;    
end
figure;
surf(-pi:0.1:pi, -sqrt(3)*pi/a:0.1:sqrt(3)*pi/a,  Eg2Dp);
hold on;
surf(-pi:0.1:pi, -sqrt(3)*pi/a:0.1:sqrt(3)*pi/a, Eg2Dn);
%}
k_x = -sqrt(3)*pi/a :0.1: sqrt(3)*pi/a;
k_y = -pi:0.1:pi;
for i = 1:length(k_y)
   for j = 1:length(k_x)
        omega = sqrt(1+4*cos(sqrt(3)*k_x(j)*a/2)*cos(k_y(i)*a/2)+ 4*cos(k_y(i)*a/2)*cos(k_y(i)*a/2));
        Eg2Dp (i,j) = (e2p + t*omega)/(1 + s*omega);
        Eg2Dn (i,j) = (e2p - t*omega)/(1 - s*omega);
    end
j = 1;   
end
figure ('Name','Energy Dispersion Relation 2D Graphite','NumberTitle','off');
surf(k_x, k_y,  Eg2Dp);
hold on;
surf(k_x, k_y, Eg2Dn);
colorbar;
xlabel ('k_x');
ylabel ('k_y');