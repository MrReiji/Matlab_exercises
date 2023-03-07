A = 230; % amplituda [V]
f = 50; % częstotliwość [Hz]

fs1=10000;
fs2 = 51;
fs3 = 50;
fs4 = 49;

% fs2 = 26;
% fs3 = 25;
% fs4 = 24;

t = 0:(1/fs1):1; % czas w sekundach [s] dla fs1=10 kHz
s1 = A*sin(2*pi*f*t); % sinusoida dla fs1=10 kHz
t2 = 0:(1/fs2):1; % czas w sekundach [s] dla fs2=500 Hz
s2 = A*sin(2*pi*f*t2); % sinusoida dla fs2=500 Hz
t3 = 0:(1/fs3):1; % czas w sekundach [s] dla fs3=200 Hz
s3 = A*sin(2*pi*f*t3); % sinusoida dla fs3=200 Hz
t4 = 0:(1/fs4):1; % czas w sekundach [s] dla fs3=200 Hz
s4 = A*sin(2*pi*f*t4); % sinusoida dla fs3=200 Hz
figure;
plot(t, s1, 'b-', t2, s2, 'go', t3, s3, 'ro', t4, s4, 'ko'); % rysowanie wykresów
xlabel('Czas [s]');
ylabel('Napięcie [V]');
legend('fs1=10 kHz', 'fs2=51 Hz', 'fs3=50 Hz', 'fs4=49 Hz');
%legend('fs1=10 kHz', 'fs2=26 Hz', 'fs3=25 Hz', 'fs4=24 Hz');