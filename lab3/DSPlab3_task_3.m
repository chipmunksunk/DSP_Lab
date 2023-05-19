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
% s = dtmfcoef(X, fs);
load('mynumber.mat', 'xx') % load encoded numbers into xx
symb_length = length(xx)/11;
dtmf_char = zeros([11 1]);
for i = 1:11
    symb = xx((i-1)*symb_length+1:i*symb_length);
    symb_dtft = abs(fft(symb(1:256)));
    symb_dtft = symb_dtft(1:length(symb_dtft)/2);
%     plot(f, symb_dtft)
%     pause;
    dtmf_char(i) = dtmfcoef(symb_dtft, fs);
end

char(dtmf_char')
%%
figure
plot(xx)
title('Encoded DTMF signals')









