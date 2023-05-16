clearvars

fs = 8e+3;
x = dtmfdial('7', fs);
X = abs(fft(x(1:256)));

figure
plot(X)

%%
f = fs/length(X):fs/length(X):fs;
figure
plot(f(1:length(X)/2), X(1:length(X)/2))
xlabel('frequency in Hz')
ylabel('magnitude')
title('DTFM signal of number "7"')
[pks, locs] = findpeaks(X(1:length(X)/2));

