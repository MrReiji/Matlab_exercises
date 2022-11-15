%Lab 2 Problem 2.2

clear all;

a = fi( 1.625,0,8,7), a.bin,
b = fi( 0.375,0,8,7), b.bin,
c = fi( 0.375,1,8,7), c.bin,
d = fi(-0.375,1,8,7), d.bin,


pi1 = fi(pi,0,8,7), pi1.bin,
pi2 = fi(pi,0,16,15), pi2.bin,
pi3 = fi(pi,1,8,7), pi3.bin,
pi4 = fi(pi,1,16,15), pi4.bin,

suma_pi1 = 0;
suma_pi3 = 0;
counter1 = 0;
counter2 = 0;

for i = pi1.bin
    suma_pi1 = suma_pi1 + str2double(i)*2^(counter1),
    counter1 = counter1 - 1;
end


for i = pi3.bin
    suma_pi3 = suma_pi3 + str2double(i)*2^(counter2),
    counter2 = counter2 - 1;
end

if pi3.bin(1) == '1'
    suma_pi3 = (suma_pi3 - 2);          % Kod uzupełnień do U2, -1 do 0 i -1 bo liczba ujemna
end

disp(suma_pi1);
disp("Błąd między liczbą pi, a wyliczoną sumą z pi1 wynosi: ")
disp(pi-suma_pi1);


disp(suma_pi3);
disp("Błąd między liczbą pi, a wyliczoną sumą z pi3 wynosi: ")
disp(pi-suma_pi3);

