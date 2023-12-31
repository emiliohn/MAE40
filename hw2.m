%% HW 2 

%% Question 1
clear; clc; close all;
syms s R_a C_b C_c R_d Vo
% x = [V1, V2, I_Ra, I_Cb, I_Cc, I_Rd]

A  =[ 1  0  R_a  0  0  0;   %  I_Ra = 1/(Ra) * (Vo-V1)
      0  1  0  1/(C_b*s)  0  0;  % I_Cb =  Cb*s*(Vo-V2)
      0  -1  0  0  1/(s*C_c)  0;   % I_Cc =  Cc*s*(V2-V1)
      0  -1  0  0  0  R_d;  % I_Rd*R_d = V2
      0  0  0  -1  1  1;  % I_Cb = I_Cc + I_Rd
      0  0  1  0  1  0];  % I_Ra + I_Cc = 0
b  =[ Vo; Vo; 0; 0; 0; 0]; 
x=A\b; V1filter = simplify(x(1)/Vo)

omega = 10; F = RR_tf([1 omega omega^2],[1 3*omega omega^2]); 
RR_bode(F)
hold off

%% Question 2
syms s C_a R_b R_c C_d Vo
% x = [V1, V2, I_a, I_b, I_c, I_d]

A  =[ 1  0  1/(C_a*s)  0  0  0;   
      0  1  0  R_b  0  0;  
      0  -C_d*s  0  0  0  1; 
      0  -1  0  0  R_c  0;  
      0  0  0  1  -1  -1;  
      0  0  1  0  1  0];  
b  =[ Vo; Vo; 0; 0; 0; 0]; 
x=A\b; V2filter = simplify(x(1)/Vo)

omega = 10; F = RR_tf([1 omega omega^2],[1 3*omega omega^2]); 
RR_bode(F)
hold off
