clearvars
set(groot, 'defaultAxesFontSize',15)

fs = 8e+3;
x = dtmfdial('7', fs);
X = abs(fft(x(1:256)));
X = X(1:length(X)/2);


%%
f = fs/(2*length(X)):fs/(2*length(X)):fs/2;
figure
plot(f, X)
xlabel('frequency in Hz')
ylabel('magnitude')
title('DTFM signal of number "7"')

%%
s = dtmfcoef(X, fs);
dtmf_chars_coded



