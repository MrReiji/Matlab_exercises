%Lab 2 Problem 2.3

clear all;

a = fi(11.25,0,8,4), a.bin,
b = fi(4.75,0,8,4), b.bin,
c = fi(4.75,1,8,4), c.bin,
d = fi(-4.75,1,8,4), d.bin,


pi1 = fi(pi,0,8,6), pi1.bin,
pi2 = fi(pi,0,16,12), pi2.bin,
pi3 = fi(pi,1,8,6), pi3.bin,
pi4 = fi(pi,1,16,12), pi4.bin,

suma_pi1 = 0;
suma_pi3 = 0;
counter1 = 1;
counter2 = 1;

for i = pi1.bin
    suma_pi1 = suma_pi1 + str2double(i)*2^(counter1),
    counter1 = counter1 - 1;
end


for i = pi3.bin
    suma_pi3 = suma_pi3 + str2double(i)*2^(counter2),
    counter2 = counter2 - 1;
end

if pi3.bin(1) == '1'
    suma_pi3 = (suma_pi3 - 4);          % Kod uzupełnień do U2, -2 do 0 i -2 bo liczba ujemna
end

disp(suma_pi1);
disp("Błąd między liczbą pi, a wyliczoną sumą z pi1 wynosi: ")
disp(pi-suma_pi1);


disp(suma_pi3);
disp("Błąd między liczbą pi, a wyliczoną sumą z pi3 wynosi: ")
disp(pi-suma_pi3);