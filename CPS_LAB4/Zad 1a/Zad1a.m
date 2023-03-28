clc;
% Zadanie 1a - FFT składane od drugiego poziomu „motylków”
clear all; close all;

% Instrukcja do zadania
figure(1);
Img=imread("Instrukcja11a.jpg");
Img=imshow(Img);
figure(2);
Img=imread("Instrukcja12a.jpg");
Img=imshow(Img);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Wygeneruj sygnał x, losowy, o długości 1024 próbek.
N = 1024;
x = randn(1,N);
f = (0:N-1)/(N-1) * 1000;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fast Fourier Transform
Xmat = fft(x, length(x));

% Transformujemy cały sygnał na raz (funkcja dft)
X = dft(x);

figure(3);
hold on;
plot(f,abs(X), "r-o");
plot(f,abs(Xmat), "k-*");
%xlim([0 1000])
set(figure(3),'units','points','position',[0,250,500,500])
title('Całość');
legend('MAT','DFT');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sygnał został podzielony na 2 podsygnały, 
% każdy złożony z innego co 2 bitu sygnału
% Transformujemy każdy z nich osobno
% Dodajemy osobno obliczone widma próbek z każdego podsygnału

X1 = dft(x(1:2:end));
X2 = dft(x(2:2:end));
X_co2(1:N) = 0;

for k=0:N/2-1
    X_co2(k+1)     = X1(k+1) + exp(1i*2*pi*(-k)/N)*X2(k+1);
    X_co2(N/2+k+1) = X1(k+1) + exp(1i*2*pi*(-k-N/2)/N)*X2(k+1);
end

figure(4);
hold on;
plot(f,abs(X_co2), "r-o");
plot(f,abs(Xmat), "k-*");
xlim([0 1000])
set(figure(4),'units','points','position',[480,250,500,500])
title('Co drugie');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sygnał został podzielony na 4 podsygnały, 
% każdy złożony z innego co 4 bitu sygnału
% Transformujemy każdy z nich osobno
% Dodajemy osobno obliczone widma próbek z każdego podsygnału

X11 = dft(x(1:4:end));
X21 = dft(x(2:4:end));
X12 = dft(x(3:4:end));
X22 = dft(x(4:4:end));
X_co4(1:N) = 0;

clear X1 X2;

for k=0:N/4-1
    X1(k+1)     = X11(k+1) + exp(1i*2*pi*(-k)/(N/2))*X12(k+1); 
    X1(N/4+k+1) = X11(k+1) + exp(1i*2*pi*(-k-N/4)/(N/2))*X12(k+1);
    X2(k+1)     = X21(k+1) + exp(1i*2*pi*(-k)/(N/2))*X22(k+1);
    X2(N/4+k+1) = X21(k+1) + exp(1i*2*pi*(-k-N/4)/(N/2))*X22(k+1);
end

for k=0:N/2-1
    X_co4(k+1)     = X1(k+1) + exp(1i*2*pi*(-k)/N)*X2(k+1);
    X_co4(N/2+k+1) = X1(k+1) + exp(1i*2*pi*(-k-N/2)/N)*X2(k+1);
end

figure(5);
hold on;
plot(f,abs(X_co4), "r-o");
plot(f,abs(Xmat), "k-*");
xlim([0 1000])
set(figure(5),'units','points','position',[960,250,500,500])
title('Co czwarte');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda');
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Błędy

fprintf('\nNajwiększy błąd - wszystkie próbki: %u\n', max(abs(Xmat - X)));
fprintf('Największy błąd - co 2 próbka:      %u\n'  , max(abs(Xmat - X_co2)));
fprintf('Największy błąd - co 4 próbka:      %u\n\n', max(abs(Xmat - X_co4)));

figure(6);
hold on;
plot(f,abs(Xmat-X), "b-");
xlim([0 1000])
set(figure(6),'units','points','position',[0,250,500,500])
title('Całość');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda');
hold off;

figure(7);
hold on;
plot(f,abs(Xmat-X_co2), "b-");
xlim([0 1000])
set(figure(7),'units','points','position',[480,250,500,500])
title('Co Drugie');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda');
hold off;

figure(8);
hold on;
plot(f,abs(Xmat-X_co4), "b-");
xlim([0 1000])
set(figure(8),'units','points','position',[960,250,500,500])
title('Co czwarte');
xlabel('Częstotliwość [Hz]');
ylabel('Amplituda');
hold off;
