clear; clc; close all; 

%% Phase 2
syms s Vi Vm Vo Vo_A Vo_B Vd C L R Ic Il Il_A Il_B Ir t 

% x = [Vo Vm  Il  Ic  Ir]
A2  =[ s  -s  0  0  0;    % Vd = (Vo*s) - (Vm*s)
       0  -1  L*s  0  0;    % L*Il_A = L*(s*Il)  - Vm
      C*s  0  0  -1  0;    % C*Vo_A = C*(s*Vo) - Ic 
      -1  0  0  0  R;    % 0 = Ir*R - Vo
       0  0  1  1  1];    % 0 = Ir + Ic + Il

      
b2  =[ Vd; L*Il_A; C*Vo_A; 0; 0]; 

x2 = A2\b2;

Vo2 = x2(1)


%% Phase 3

% x = [Vo  Vm  Il  Ic  Ir]
A3  =[ 0  -1  L*s  0  0  ;    % L*Il_b = L*s*Il - Vm
       0  0  0  1  1  ;    % 0 = Ic + Ir
      -1  0  0  0  R  ;    % 0 = Ir*R - Vo  
       0  0  1  1  1  ;    % 0 = Ir + Ic + Il
      C*s  0  0  -1  0  ];    % C*Vo_B = C*s*Vo - Ic

      
b3  =[ L*Il_B;0; 0; 0; C*Vo_B]; 

x3 = A3\b3;

Vo3 = x3(1)