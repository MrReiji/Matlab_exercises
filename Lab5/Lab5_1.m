clear all; close all;

x1 = 5;
x2 = 7;
y1 = 13;
y2 = 17;
X = 12;

if ( first(X,x1,x2,y1,y2) == newton(X,x1,x2,y1,y2) && newton(X,x1,x2,y1,y2) == lagrange(X,x1,x2,y1,y2) )
    disp("Zapisy rownowazne");
else
    disp("Zapisy nie rownowazne");
end

x3 = 8;
y1 = 26;
y2 = 50;
y3 = 65;

disp(kwadratowe(X,x1,x2,x3,y1,y2,y3));




function [Y] = first(X,x1,x2,y1,y2)
    a = (y2-y1)/(x2-x1);
    b = (x2*y1-x1*y2)/(x2-x1);
    Y = a*X+b;    
end

function [Y] = newton(X,x1,x2,y1,y2)
    Y = y1+((y2-y1)/(x2-x1))*(X-x1);     
end

function [Y] = lagrange(X,x1,x2,y1,y2)
    Y = ((X-x2)/(x1-x2))*y1+((X-x1)/(x2-x1))*y2;
end

function [Y] = kwadratowe(X,x1,x2,x3,y1,y2,y3)
    wsp = inv([x3^2,x3,1;x2^2,x2,1;x1^2,x1,1])*[y3;y2;y1];
    Y = wsp(1)*X^2+wsp(2)*X+wsp(3);
end





