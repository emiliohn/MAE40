
clear; clc; close all;
syms s R C C_1 L Vi 
% x = {Vo Vm IL Ic IR IRL}

A  =[ 0  1  L*s  0   0   0;     %  Vm + Ls(IL) = Vi 
      1  -1  0  1/(C*s)  0  0;  % (1/Cs)Ic + Vo - Vm = 0
      1  0  0  0 -R  0;         % Vo - IR*R = 0
      1  0  0  0  0  -(R/C_1);  % Vo - IRL*(R/C_1) = 0
      0  0  1  -1  0  0;        % IL - Ic = 0
      0  0  0  1  -1  -1];      % Ic - IR - IRL
b  =[ Vi ; 0; 0; 0; 0; 0]; 
x=A\b; V1ANTINOTCH = simplify(x(1))
Q=5;
omega = 10; F = RR_tf([omega/Q 0],[1 omega/Q omega^2]); 
RR_bode(F)
hold off