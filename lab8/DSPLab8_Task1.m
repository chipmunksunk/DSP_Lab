%% clc, close all...
clc;
clear;
close all;

%% AR(3) process, samples
p=3;
N = 1024;
a_h = [1; 0.5; 0.7; 0.2];
b_h = 1;

z = randn(N,1);
x = filter(b_h, a_h, z);

%% Spectrum Estimation - aryule
a_hat = aryule(x, p);
[H_hat, w_hat] = freqz(1, a_hat, N);

figure;
plot(w_hat, abs(H_hat));

%% Spectrum Estimation - pyulear
%[H_hat_pyulear, w_pyulear] = pyulear(x, p, w_hat);
H_hat_pyulear = pyulear(x, p);
w_pyulear = linspace(0, pi, length(H_hat_pyulear));



%% True Spectrum
[H, w] = freqz(b_h, a_h, N);

%% Plots
set(groot, 'defaultAxesFontSize',15);
% samples from x
figure;
plot(x);
legend("Samples from X(n)");
xlabel("Sample n");
ylabel("Amplitude");
xlim([0, 1024]);
ylim([-5, 5]);

% spectrums
figure;
plot(w, abs(H_hat), w_pyulear, abs(H_hat_pyulear), w, abs(H));
legend(["aryule", "pyulear","true"]);
ylabel("Spectrum");
xlabel("Normalized Frequency \omega");