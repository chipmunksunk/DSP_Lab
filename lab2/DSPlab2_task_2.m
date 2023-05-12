clear all;
close all;
clc;

%% create single freq tone
fs = 8192; % sampling freq
f1 = 392; % fundamental freq
N = 30e+3; % signal length
n = (0:N-1);
x_1 = sin(2 .* pi .* f1 .* n ./ fs ); % tone
l = N/fs;
% soundsc(x_1)
% pause(4)

%% add harmonics
fk = f1.*(1:8);
x_2 = 0;
for k = 1:length(fk)
    x_2 = x_2 + 0.4.^(k-1) .* sin(2 .* pi .* fk(k) .* n ./ fs );
end
% soundsc(x_2) % tone is higher
% pause(4)

%% add envelope
d = 0.25;
n_12 = [240 7200];
A = envelope(N, d, n_12);
x_3 = x_2 .* A ;
% soundsc(x_3)

%% plot all signals in time domain
t = n./fs;
figure;
x_plot = [x_1; x_2; x_3];
plot_titles = ["sinusoidal tone", "tone with harmonics", "tone with envelope"];
for i=1:3
    subplot(2,3,i)
    plot(t,x_plot(i,:))
    xlabel('t in s')
    ylabel('amplitude')
    subtitle(plot_titles(i))
end

%% plot signals in freq domain
f = fs/2.*linspace(-1,1,N);
plot_titles = ["sinusoidal tone", "tone with harmonics", "tone with envelope"];
% figure
for i=1:3
    x_spectrum = abs(fftshift(fft(x_plot(i,:)))); 
    subplot(2,3,i+3)
    plot(f(N/2:N), x_spectrum(N/2:N))
    xlim([0 fs/2])
    ylim([0 12000])
    xlabel('f in Hz')
    ylabel('Magnitude')
    subtitle(plot_titles(i))
end

%% piano example
load pianoG3.mat
f_g = fs/2.*linspace(0,1,length(g)/2);
g_spectrum = abs(fftshift(fft(g)));

figure
subplot(1,2,2)
plot(f_g, g_spectrum(length(g)/2 + 1 : end))
xlim([0 fs/2])
ylim([0 2000])
xlabel('f in Hz')
ylabel('Magnitude')
title('spectrum of piano tones')
soundsc(g)
% pause(3)

subplot(1,2,1)
plot(f(N/2:N), x_spectrum(N/2:N))
xlabel('f in Hz')
ylabel('Magnitude')
xlim([0 fs/2])
ylim([0 2000])
title('spectrum of tone with envelope')
soundsc(x_3)

% spectrum of piano tone is a little bit off, to improve the realness we
% could change the amplitudes of the harmonics frequencies







