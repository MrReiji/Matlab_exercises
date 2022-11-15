%Lab 2 Problem 2.4

clear all;

disp(num2bitstr( single( (1+1/4)*2^(-124) )));
disp(num2bitstr( single( -5.877472*10^(-38) )));

c = 299792458,      % Prędkość światła

c32 = num2bitstr(single(c));            % c na 32b
c64 = num2bitstr(double(c));            % c na 64b

disp("Prędkość światła zapisana i odtworzona na 32b")
disp(float_to_num(c32,32));

disp("Prędkość światła zapisana i odtworzona na 64b")
disp(float_to_num(c64,64));