t = 10;              % czas trwania sygnału w sekundach
fs = 44100;          % częstotliwość próbkowania w Hz
n_samples = t*fs;    % liczba próbek

t_vec = linspace(0,10,n_samples);

f1 = 1000;           % początkowa częstotliwość sygnału
fd = 5000;           % zmiana częstotliwości w Hz/s
f_vec = f1 + fd*t_vec;

x = sin(2*pi*cumsum(f_vec/fs));

sound(x, fs);        % odtwórz sygnał
plot(t_vec, x);      % wyświetl sygnał na wykresie
xlabel('Czas [s]');
ylabel('Amplituda');