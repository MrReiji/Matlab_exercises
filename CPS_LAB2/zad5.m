F = dftmtx(N); % macierz transformacji Fouriera o wymiarze NxN
% obliczenie widma sygnału sigPhaseRefSymb
A = sqrt(N)*F; % wygenerowanie macierzy A
X = A * x'; % obliczenie widma za pomocą X=Ax'
PhaseRefSymb_fft = fftshift(fft(X(505:end))); % usunięcie cyklicznego prefiksu i przesunięcie widma

% obrót kątowy widma
rot_angles = [pi/4, 3*pi/4, 5*pi/4, 7*pi/4];
Y = PhaseRefSymb_fft; % wykonujemy obrót na widmie referencyjnym
for i=1:length(Y)
    if Y(i) ~= 0
        k = mod(i-1, length(rot_angles))+1; % wybieramy kolejny kąt z rot_angles
        Y(i) = Y(i)*exp(1i*rot_angles(k)); % obrót kątowy
    end
end

% obliczenie sygnału y z Y
S = ifft(eye(N)); % generujemy macierz S dla F^-1
SigSymb_fft = fftshift(fft(SigSymb(505:end))); % obliczenie widma sygnału SigSymb i usunięcie prefiksu
Y_fft = fftshift(Y); % przesunięcie obróconego widma
y_fft = Y_fft .* SigSymb_fft; % wymnożenie widm
y = ifft
(y_fft); % obliczenie sygnału y

% przesunięcie ostatnich 504 wartości na początek
SigSymb_shifted = [SigSymb(end-503:end), SigSymb(1:end-504)];
y_shifted = [y(end-503:end), y(1:end-504)];

% obliczenie widma przesuniętych sygnałów
SigSymb_fft_shifted = fftshift(fft(SigSymb_shifted));
y_fft_shifted = fftshift(fft(y_shifted));

% obliczenie faz i bitów
phi = angle(y_fft_shifted ./ SigSymb_fft_shifted);
bits = sign(real(phi)) + 1j*sign(imag(phi));

% wyświetlenie wyników
disp("Wyniki bitów:")
disp(bits)

% porównanie z oryginalnymi danymi
if isequal(bits, bits_ref)
disp("Transmisja przebiegła pomyślnie.")
else
disp("W transmisji wystąpiły błędy.")
end