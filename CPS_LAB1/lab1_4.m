clear all; close all; clc;

fid = fopen('DAB_real_2.048MHz_IQ_float.dat', 'r');
x = fread(fid, 'float32');
fclose(fid);

x = x(1:2:end) + 1j*x(2:2:end);

L = 2552;
sigPhaseRefSymb = PhaseRefSymbGen(L);

R = xcorr(x, sigPhaseRefSymb);

% wyznaczenie początku sygnału PhaseReference
[~, startIdx] = max(abs(R));

% usunięcie początkowych próbek przed sygnałem PhaseReference
x = x(startIdx:end);

% wyszukanie bloku NullSymbol
K = 76;
M = 2656;
N = L + M;
y = x(1:3*N);

idx = find(abs(y) < 0.01*max(abs(y)));

% wyznaczenie początku sekwencji 76 bloków
startIdx = idx(find(diff(idx) > M) + 1);

% usunięcie początkowych próbek przed początkiem sekwencji 76 bloków
x = x(startIdx:end);

% wyznaczenie liczby próbek w jednym bloku
L = 2552;

% wyznaczenie liczby powtórzeń sekwencji 504 próbek w każdym bloku
numReps = 504/L;

% wyznaczenie liczby próbek w sekwencji 76 bloków
seqLen = L*numReps*76;

% wyznaczenie początku sekwencji 76 bloków
K = 76;
M = 2656;
N = L + M;
y = x(1:3*N);

idx = find(abs(y) < 0.01*max(abs(y)));
startIdx = idx(find(diff(idx) > M) + 1);
xSeq = x(startIdx:startIdx+seqLen-1);

% wyznaczenie liczby próbek w jednym prefiksie
M = 32;

for i = 1:K
    % wyznaczenie indeksów próbek w i-tym bloku
    idx = (i-1)*N + (M+1):(i*N);
    
    % wyznaczenie początku i końca sekwencji 504 próbek
    startIdx = (numReps*(i-1)*L) + 1;
    endIdx = startIdx + numReps*L - 1;
    
    % wyznaczenie sekwencji 504 próbek w i-t bloku

blockStart = i*(N+M) + M + 1; % indeks początku i-tego bloku (po prefiksie)
blockEnd = blockStart + N - 1; % indeks końca i-tego bloku
blockSamples = signal(blockStart:blockEnd); % próbki i-tego bloku

% wyznaczenie korelacji wzajemnej sygnału z PhaseReferenceSymbol
corr = xcorr(blockSamples, sigPhaseRefSymb);

% wyznaczenie początku sekwencji 76 bloków
if i == 0
    maxCorr = max(corr); % wartość maksymalnej korelacji
    nullEnd = find(corr == maxCorr, 1); % indeks końca bloku NullSymbol
    seqStart = nullEnd + 1; % początek sekwencji 76 bloków
end

% wyznaczenie sekwencji 504 próbek w i-tym bloku
seqSamples = blockSamples(end-503:end);

% sprawdzenie, czy sekwencja 504 próbek jest podobna do pierwszych 504 próbek
% pierwszego bloku
if i > 0 && corr(1) > maxCorr/2 % jeśli początek i-tego bloku jest podobny
                                  % do początkowego bloku PhaseReferenceSymbol
    if ~isequal(seqSamples, refSeqSamples)
        disp(['Sekwencja w bloku ', num2str(i), ' jest inna niż w pierwszym bloku'])
    end
else % jeśli początek i-tego bloku jest podobny do NullSymbol
    if corr(1) > maxCorr/10 % jeśli początek bloku jest podobny do NullSymbol
        if ~isequal(seqSamples, zeros(504,1)) % jeśli sekwencja próbek nie jest zerowa
            disp(['Sekwencja w bloku ', num2str(i), ' nie jest zerowa'])
        end
    else
        disp(['Nie znaleziono sekwencji w bloku ', num2str(i)])
    end
end

% ustawienie próbek końcowych bloku jako próbki referencyjne dla kolejnego bloku
refSeqSamples = blockSamples(end-503:end);
end