%% clc, close all...
clc;
clear;
close all;

%% Create a sinusoidal FM signal
f_c = 100;
f_s = 1000;
alpha = 50;
beta = 1.5;
gamma = pi/3;
T = 3.04;
t_Start = 0;

sinFM = genFMsignal(alpha, beta, gamma, f_c, f_s, t_Start, t_Start+T);

figure;
plot(t_Start:1/f_s:t_Start+T, sinFM);
xlabel("Time t in [s]")
ylabel("Amplitude")
xlim([0, T+t_Start])

%% STFT
window = hamming(128);
timestep = 64;

STFT = calc_STFT(sinFM, window, timestep);
Spec = 10*log10(abs(STFT));
figure;
imagesc(Spec);

figure;
ovl = length(window)-timestep;
spectrogram(sinFM, window, ovl, 512, f_s, 'yaxis');
