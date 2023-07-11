function [STFT_S] = calc_STFT(signal_x, window_w, timestep_T)
%Compute the STFT for a given signal
L = length(window_w);
K = 512;
n = 1:timestep_T:length(signal_x)-L;
N = length(n);

STFT_S = [];
for i = n
    x_temp = window_w.*signal_x(i:i+L-1);
    STFT_S = [STFT_S, fft(x_temp, K)]; % input length L, K-point DFT
    
end