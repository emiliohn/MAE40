%% MAE 20 Homework 1

%% Question 1
% Second-order low-pass LC filter: 
% Solve for Vo as a function of Vi 
% x={IL,IC, IRload, Vo}  <-- unknown vector

syms L s C Rload Vi
A  =[ -1   1  1   0;   %  -IL + IC + IRload = 0
      L*s   0   0  1;  % L*(d/dt(IL)) + Vo = Vi
      0  1   0   -C*s;   % IC - C*(d/dt(Vo)) = 0 
      0   0  -Rload  1];  % IRload*Rload = Vo = 0 
b  =[ 0; Vi; 0; 0]; 
x=A\b; Vo_HPF1biased = simplify(x(4))
% Question 2
for i=1:3
    zeta=[.1 .7 1];
omega4 = 10; F_LPF2 = RR_tf([omega4^2],[1 2*zeta(i)*omega4 omega4^2]);
figure(1), hold on, RR_bode(F_LPF2)

end


% Question 3
%  x={IL, IC, IRd, ICd, V1, V2}
syms L s C Rd Cd Vo
A  =[ 1  -1  -1  0  0  0;   %  IL - IC - IRd = 0
      0  0  1  -1  0  0;  % IRd - ICd = 0
      L*s  0  0  0  1  0;   % L*s*IL + V1 = Vo 
      0  1  0  0  -C*s  0;  % IC - C*s*V1 = 0
      0  0  -Rd  0  1  -1;  % V1 - V2 - IRd*Rd = 0
      0  0  0  1  0  -Cd*s];  
b  =[ 0; 0; Vo; 0; 0; 0]; 
x=A\b; Vo_LPF2Regulated = simplify(x(5))


% Question 4
%  x={IL, IC, IRd, ICd, V1, V2}
syms L s C Vo

Rd = sqrt(L/C); Cd = 4*C;
A  =[ 1  -1  -1  0  0  0;   %  IL - IC - IRd = 0
      0  0  1  -1  0  0;  % IRd - ICd = 0
      L*s  0  0  0  1  0;   % L*s*IL + V1 = Vo 
      0  1  0  0  -C*s  0;  % IC - C*s*V1 = 0
      0  0  -Rd  0  1  -1;  % V1 - V2 - IRd*Rd = 0
      0  0  0  1  0  -Cd*s];  
b  =[ 0; 0; Vo; 0; 0; 0]; 
x=A\b; Vo_LPF2wRdandCd = simplify(x(5));

omega = 10; F_LPF2wRdandCd = RR_tf([1 omega],[(1/1600) 5*(1/1600)*omega 1 omega]); 
RR_bode(F_LPF2wRdandCd)
hold off