% Program do problemu 1.2 z lab nr 1 (Matlab - środowisko do obliczeń
% technicznych)

% Program oblicza pierwiastki równania a^2+bx+c = 0

clear all; close all;       % Zerowanie pamięci i usuwanie rysunków
echo on;                    % Wyświetlanie linii programu na ekranie

a = input('Podaj współczynnik a: ');
b = input('Podaj współczynnik b: ');
c = input("Podaj współczynnik c: ");

d = b^2 - 4*a*c;            % Delta
sqrt_d = sqrt(d);           % Pierwiastek z delty
        
p1 = (-b-sqrt_d)/(2*a);     % 1 miejsce zerowe
p2 = (-b+sqrt_d)/(2*a);     % 2 miejsce zerowe

disp('Pierwiastki to: ')

if p1 == p2                 % Gdy 1 rozwiązanie
  disp(p1)

else                        % Gdy 2 rozwiązania
  disp([p1,p2])

end                         % Koniec if'a

disp('Sprawdzenie: ')

disp('Dla p1:')
disp(a*p1^2+b*p1+c)

disp('Dla p2:')
disp(a*p2^2+b*p2+c)




