% Voltage-biased first-order high-pass RC filter: 
% Solve for Vo as a function of Vi 
% x={IL,IC, IRload, Vo}  <-- unknown vector
syms L s C Rload Vi
A  =[ -1   1  1   0;   %  -IL + IC + IRload = 0
      L*s   0   0  1;  % L*(d/dt(IL)) + Vo = Vi
      0  1   0   -C*s;   % IC - C*(d/dt(Vo)) = 0 
      0   0  -Rload  1];  % IRload*Rload = Vo = 0 
b  =[ 0; Vi; 0; 0]; 
x=A\b; Vo_HPF1biased = simplify(x(4)), pause 