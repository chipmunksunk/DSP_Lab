close all
clear all

set(groot, 'defaultAxesFontSize',15)

k = 4:8;
N_list = 2.^k;
f = 1e+3;
fs = 6e+3;

for b=1:length(N_list)
    N = N_list(b);
    n = 0:N-1;
    t = (2*pi*f/fs*n);
    dft_matrix = exp(-1i*2*pi / N .* n' * n);
    temp =  n' * n;
    x = sin(t);
    timerVal_mat = tic;
    X = dft_matrix * x';
    time_matrix(b) = toc(timerVal_mat);
    X = abs(X);

%     figure
%     subplot(2,1,1)
%     f_plot = (0:1/N:1);
%     plot(f_plot(1:N/2),X(1:N/2))
%     xlabel('frequency in radians $(\times\pi)$', Interpreter='latex',FontSize=15)
%     ylabel('magnitude',FontSize=15)
%     title('DFT calculation via Matrix', FontSize=12)
% 
%     subplot(2,1,2)
    timerVal_fft = tic;
    X_fft = fft(x);
    time_fft(b) = toc(timerVal_fft);
    X_fft = abs(X_fft);
%     plot(f_plot(1:N/2), X_fft(1:length(X_fft)/2))
%     xlabel('frequency in radians $(\times\pi)$', Interpreter='latex', FontSize=15)
%     ylabel('magnitude', FontSize=15)
%     title('DFT calculation via fft', FontSize=12)
end

%%
figure
stem(N_list, time_matrix)
hold on
stem(N_list, time_fft)
legend('matrix','fft', Location='best')
title('Comparison of computation time of DFT', FontSize=12)
xlabel('signal length n')
ylabel('time in s')



