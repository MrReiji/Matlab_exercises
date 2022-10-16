% Lab nr 2, problem 2.13

clear all; close all;       % Zerowanie pamięci i usuwanie rysunków
echo on;                    % Wyświetlanie linii programu na ekranie

a = input('Podaj współczynnik a: ');
b = input('Podaj współczynnik b: ');
c = input("Podaj współczynnik c: ");

% x1 - z typowego wzoru na pierwiastek z odejmowaniem pierwiastka z delty w
% liczniku
% x2 - z zaleznosci x1*x2 = c/a

d = b^2 - 4*a*c;            % Delta
sqrt_d = sqrt(d);           % Pierwiastek z delty
        
p1 = (-b-sqrt_d)/(2*a);     % 1 miejsce zerowe
p2 = (-b+sqrt_d)/(2*a);     % 2 miejsce zerowe

     
x1 = (-b-sqrt(b^2 - 4*a*c))/(2*a);     % 1 miejsce zerowe
x2 = (2*c)/(-b-sqrt(b^2 - 4*a*c));     % 2 miejsce zerowe

disp('Pierwiastki tradycyjną metodą to: ')
disp([p1,p2])
disp('Pierwiastki "przepisem kulinarnym" to: ')
disp([x1,x2])


disp('Sprawdzenie: ')

disp('Dla p1:')
disp(a*p1^2+b*p1+c)

disp('Dla p2:')
disp(a*p2^2+b*p2+c)

disp('Dla x1:')
disp(a*x1^2+b*x1+c)

disp('Dla x2:')
disp(a*x2^2+b*x2+c)

