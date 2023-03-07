% parametry
fs = 10e3;
t = 0:1/fs:1-1/fs;
fn = 50;
fm = 1;
df = 5;
m = df/fn; % głębokość modulacji

% sygnał nośny
carrier = sin(2*pi*fn*t);

% sygnał modulujący
modulating = sin(2*pi*fm*t);

% sygnał zmodulowany
modulated = (1 + m*modulating).*carrier;

% wyświetlenie sygnałów
figure;
plot(t, modulated, 'b-', t, modulating, 'r--');
xlabel('Czas [s]');
ylabel('Amplituda');
title('Sygnał modulowany FM');
legend('Sygnał zmodulowany', 'Sygnał modulujący');


% próbkowanie
fs2 = 25;
ts = 0:1/fs2:1-1/fs2;
modulated_sampled = (1 + m*sin(2*pi*fm*ts)).*sin(2*pi*fn*ts);

% porównanie sygnałów
figure;
plot(t, modulated, 'b-', ts, modulated_sampled, 'r--');
xlabel('Czas [s]');
ylabel('Amplituda');
title('Porównanie sygnału zmodulowanego FM przed i po próbkowaniu');
legend('Sygnał zmodulowany - analogowy', 'Sygnał zmodulowany - próbkowany');

Fs = 10000; % częstotliwość próbkowania
t = 0:1/Fs:1-1/Fs; % wektor czasu
fc = 50; % częstotliwość nośna
fm = 1; % częstotliwość modulująca
df = 5; % głębokość modulacji
x = sin(2*pi*fc*t + 2*pi*df/fm*cos(2*pi*fm*t)); % sygnał

x = sin(2*pi*fc*t + 2*pi*df/fm*cos(2*pi*fm*t));
[Pxx,f] = pspectrum(x,Fs); % widmo gęstości mocy
plot(f,Pxx);
title('Widmo gęstości mocy sygnału zmodulowanego');
xlabel('Częstotliwość [Hz]');
ylabel('Gęstość mocy [W/Hz]');