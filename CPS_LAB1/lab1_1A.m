A = 230; % amplituda [V]
f = 50; % częstotliwość [Hz]

fs1=10000;
fs2 = 500;
fs3 = 200;

t = 0:(1/fs1):0.1; % czas w sekundach [s] dla fs1=10 kHz
s1 = A*sin(2*pi*f*t); % sinusoida dla fs1=10 kHz
t2 = 0:(1/fs2):0.1; % czas w sekundach [s] dla fs2=500 Hz
s2 = A*sin(2*pi*f*t2); % sinusoida dla fs2=500 Hz
t3 = 0:(1/fs3):0.1; % czas w sekundach [s] dla fs3=200 Hz
s3 = A*sin(2*pi*f*t3); % sinusoida dla fs3=200 Hz
figure;
plot(t, s1, 'b-', t2, s2, 'ro', t3, s3, 'kx'); % rysowanie wykresów
xlabel('Czas [s]');
ylabel('Napięcie [V]');
legend('fs1=10 kHz', 'fs2=500 Hz', 'fs3=200 Hz');