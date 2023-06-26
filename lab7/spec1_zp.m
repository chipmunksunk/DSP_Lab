function [periodogram_I] = spec1(signal, L, window)
% Returns the averaged periodogram using the given window, with 10*M
% zeropadding.
N = length(signal);
M = N/L;
I = [];
for i = 1:L
    I = [I, 1/(sum(abs(window(1:M)).^2)) *...
        abs(fft(window(1:M).*signal(((i-1)*M+1:i*M)), 10*M)).^2];
end

periodogram_I = 1/L * sum(I, 2);

end