fs = 100; % częstotliwość próbkowania
t = 0:1/fs:1; % wektor czasu


% pętla generująca sinusoidy o różnych częstotliwościach
for f = 0:5:300
    counter=f/5+1;
    x = sin(2*pi*f*t); % generowanie sinusoidy
    figure(1); clf; % czyścimy figurę przed narysowaniem nowej sinusoidy
    plot(t, x); % rysujemy sinusoidę
    xlabel('Czas [s]');
    ylabel('Amplituda');
    title(['Częstotliwość: ' num2str(f) ' Hz.', 'Obieg: ', num2str(counter)]);
    pause(0.15); % opóźnienie między kolejnymi sinusoidami
end

% porównanie wybranych sinusoid
f1 = 5; f2 = 105; f3 = 205;
x1 = sin(2*pi*f1*t);
x2 = sin(2*pi*f2*t);
x3 = sin(2*pi*f3*t);

figure(2); clf;
subplot(2,1,1);
plot(t, x1, t, x2, t, x3);
xlabel('Czas [s]');
ylabel('Amplituda');
title(['Porównanie sinusoid, f=' num2str(f1) ', ' num2str(f2) ', ' num2str(f3) ' Hz']);

f4 = 95; f5 = 195; f6 = 295;
x4 = sin(2*pi*f4*t);
x5 = sin(2*pi*f5*t);
x6 = sin(2*pi*f6*t);

subplot(2,1,2);
plot(t, x4, t, x5, t, x6);
xlabel('Czas [s]');
ylabel('Amplituda');
title(['Porównanie sinusoid, f=' num2str(f4) ', ' num2str(f5) ', ' num2str(f6) ' Hz']);