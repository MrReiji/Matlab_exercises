% interp_spline.m
clear all; close all;
% Funkcja dokladnie - malymi kroczkami
%x = ( -5 : 0.01 : 5)';
x = ( -20 : 0.01 : 20)';
%y = 1 ./ (1+x.^2);
y = (7+x) ./ (5+x.^2);
% Wezly - zgrubnie - duze kroki
%xk = ( -5 : 1 : 5)';
xk = ( -20 : 1 : 20)';
%yk = 1./(1+xk.^2);
yk = (7+xk) ./ (5+xk.^2);
% Linear spline
yi = interp1(xk,yk,x,'linear');
figure; plot(x,y,'r',xk,yk,'ko',x,yi,'b.'); xlabel('x'); title('y(x) - Linear'); grid; pause
% Cubic spline
yi = interp1(xk,yk,x,'cubic');
figure; plot(x,y,'r',xk,yk,'ko',x,yi,'b.'); xlabel('x'); title('y(x) - Cubic'); grid; pause
% Cubic spline ze Spline Toolbox
cs = spline(x,[0; y; 0]);
yi = ppval(cs,x);
figure; plot(x,y,'r-', xk,yk,'ko', x,yi,'b.-'); xlabel('x'); title('y=f(x) - Cubic Toolbox'); grid; pause

