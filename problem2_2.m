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
counter = 0;

for i = pi1.bin
    suma_pi1 = suma_pi1 + str2double(i)*2^(-1*counter),
    counter = counter + 1;
end

disp(suma_pi1);
disp("Błąd między liczbą pi, a wyliczoną sumą z pi1 wynosi: ")
disp(pi-suma_pi1);

