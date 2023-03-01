% wygeneruj sygnały
x = [zeros(1,9) ones(1,6) zeros(1,9)];
h = x;

% oblicz splot funkcją myConv
y1 = myConv(x, h);

% oblicz splot funkcją conv
y2 = conv(x, h);

% oblicz splot funkcją filter
y3 = filter(h, 1, x);

% wykresy wyników
subplot(3,1,1); stem(y1); title('Wynik myConv'); xlabel('n'); ylabel('y(n)');
subplot(3,1,2); stem(y2); title('Wynik conv'); xlabel('n'); ylabel('y(n)');
subplot(3,1,3); stem(y3); title('Wynik filter'); xlabel('n'); ylabel('y(n)');