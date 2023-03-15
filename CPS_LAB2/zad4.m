[x, fs] = audioread('mowa.wav');
t = (0:length(x)-1)/fs;
plot(t, x);
xlabel('Czas (s)');
ylabel('Amplituda');

N = 256;
M = 10;
A = dctmtx(N);
for k = 1:M
    n1 = (k-1)*N + 1;
    n2 = n1 + N - 1;
    xk = x(n1:n2);
    yk = A*xk;
    Y(:,k) = yk;
end


figure;
for k = 1:M
    n1 = (k-1)*N + 1;
    n2 = n1 + N - 1;
    xk = x(n1:n2);
    yk = Y(:,k);
    subplot(2, M, k);
    plot(xk);
    title(['Fragment ' num2str(k)]);
    subplot(2, M, k+M);
    f = (0:N-1)*fs/N;
    plot(f, abs(yk));
    xlim([0, fs/2]);
    xlabel('Częstotliwość (Hz)');
end