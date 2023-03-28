clc;
% Zadanie 1b - FFT za pomocą rekurencji
clear all; close all;

% Instrukcja do zadania
figure(1);
Img=imread("Instrukcja1b.jpg");
Img=imshow(Img);

% Poniższa funkcja realizuje zespoloną transformację Fouriera 
% poprzez podział w dziedzinie czasu DIT (ang. Decimation i Time).
% dit(x)

N = 256;
x = randn(N, 1);
X1 = fft(x);                 % oryginalne DFT
X2 = dit(x);                 % DFT ,,sklejane'' z dwóch połówek (1 etap podziału)
X3 = radix2(x);              % DFT ,,sklejane'' z dwóch połówek (p etapów podziału)
                             % Błędy

fprintf("Błąd DFT - DiT:    %u\n", mean(abs(X1-X2)));   
fprintf("Błąd DFT - Radix2: %u\n", mean(abs(X1-X3)));

