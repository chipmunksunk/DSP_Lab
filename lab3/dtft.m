function [X_DTFT, normalized_frequency] = dtft(x)
%Compute the approximated DTFT of a signal
%   Detailed explanation goes here
N = length(x);
M = 16*N;
%x = [x ; zeros(M-N,1)];
normalized_frequency = 2*pi*(0:1/M:1-1/M)';
X_DTFT = fft(x,M);
end