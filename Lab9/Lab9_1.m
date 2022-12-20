%%%
%Wzór współczynnika oporu powietrza jest następujący:

%b = F / (1/2 * r * v² * S)

%gdzie:

%b - współczynnik oporu powietrza
%F - siła oporu powietrza działająca na ciało
%r - gęstość powietrza
%v - prędkość ciała w powietrzu
%S - powierzchnia ciała prostopadła do kierunku ruchu
%Przykładowa wartość współczynnika oporu powietrza dla samochodu osobowego 
% wynosi około 0,3-0,4, dla samolotu o wartościach od 0,025 do 0,1, 
% a dla kuli o wartości 1,0. Te wartości są jedynie orientacyjne 
% i mogą się różnić w zależności 
% od konkretnego obiektu i warunków, w jakich 
% został pomierzony współczynnik oporu powietrza.

%%%




% equnonlin_balista.m
clear all; close all;

m=5; v0=50; alpha=30; h=50; g=9.81;
alpha = alpha/180*pi;

b = 0.4;

x = 0 : 1 : 350;
a = - g / (2*v0^2*cos(alpha));
b = tan(alpha);
c = h;
y = a*x.^2+b*x+c;

x1 = 0 : 1 : 250;
y_with_b = 50+((tan(alpha)+m*g/(b*v0*cos(alpha)))*x1+g*(m^2/b^2)*log(1-(x1*b/(m*v0*cos(alpha)))));

range_X=max(roots([a,b,c])),
y_range_X = a*(range_X)^2+b*range_X+c,
figure; plot(x,y); xlabel('x'); ylabel('y'); title('y(x)'); grid;
figure; plot(x1,y_with_b); xlabel('x'); ylabel('y'); title('y(x) and b'); grid;
