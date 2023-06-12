set(groot, 'defaultAxesFontSize',15)
close all
clearvars

%% 7.2.1 - 7.2.2 Low pass via kaiser window
A = 30;
dw = (0.18-0.12)*pi;
w_c = 0.15;
[N, beta] = kwin(A, dw);
alpha = floor(N/2);

w = kaiser(N, beta);
n = -(N-1)/2:N/length(w):(N-1)/2;
% n = 0:length(w)-1;
h_d = sinc(w_c*n) * w_c;
h = w'.*h_d;
figure('Position',[0 100 1200 500]);
sgtitle('Low pass \omega_c = 0.15\pi via Kaiser window', fontsize=15)

subplot(1,2,1); stem(n, h)
title('Impulse response')
xlabel('n')
ylabel('h(n)')

H = abs(fft(h, 1e+3));
H = H(1:round(length(H)/2)) ./ length(h);
H(2:end-1) = H(2:end-1)*2;
f = 1/length(H):1/length(H):1;
subplot(1,2,2); plot(f, 10*log10(H))
title('frequency response')
xlabel('normalized frequency (\times \pi)')
ylabel('|H(\Omega)|')

% ylim([-60 -10])
% hold on
% plot([0.15 0.15], [0 -60])

saveas(gcf, '7_2_Kaiser_Low_pass.png', 'png')

%%%% forgot to multiply with h_d

%% 7.2.3 Highpass
w_c = 0.15;
h_d = sinc(w_c*n) * w_c;
h = w'.*h_d;
delta_kronecker = 1 * (n == 0);
h_hp = delta_kronecker - h;

H_hp = abs(fft(h_hp, 1e+3));
H_hp = H_hp(1:round(length(H_hp)/2)) ./ length(h_hp);
H_hp(2:end-1) = H_hp(2:end-1)*2;
f = 1/length(H_hp):1/length(H_hp):1;

figure('Position',[0 100 1200 500]);
sgtitle('High pass \omega_c = 0.15\pi via Kaiser window', fontsize=15)

subplot(1,2,2); plot(f, 10*log10(H_hp))
title('frequency response')
xlabel('normalized frequency (\times \pi)')
ylabel('|H(\Omega)|')

subplot(1,2,1); stem(n, h_hp)
title('Impulse response')
xlabel('n')
ylabel('h(n)')

saveas(gcf, '7_2_Kaiser_High_pass.png', 'png')

%% 7.2.3 Bandpass
w_0 = 0.25*pi; dw = 0.15; 
h_d = sinc(dw*n) .* dw .* cos(w_0*n);
h_bp = w'.*h_d;

H_bp = abs(fft(h_bp, 1e+3));
H_bp = H_bp(1:round(length(H_bp)/2)) ./ length(h_hp);
H_bp(2:end-1) = H_bp(2:end-1)*2;
f = 1/length(H_bp):1/length(H_bp):1;

figure('Position',[0 100 1200 500]);
sgtitle('Band pass \omega_0 = 0.25\pi, \Delta_\omega = 0.3\pi via Kaiser window', fontsize=15)

subplot(1,2,2); plot(f, 10*log10(H_bp))
title('frequency response')
xlabel('normalized frequency (\times \pi)')
ylabel('|H(\Omega)|')

subplot(1,2,1); stem(n, h_bp)
title('Impulse response')
xlabel('n')
ylabel('h(n)')

saveas(gcf, '7_2_Kaiser_Band_pass.png', 'png')

%% help functions
function [N, beta] = kwin(A, dw)
    N = ceil( (A-8) / (2.285*dw) + 1);
    if A < 21
        beta = 0;
    elseif A >= 21 && A < 50
        beta = 0.5842*(A-21)^0.4 + 0.07866* (A-21);
    elseif A >= 50
        beta = 0-1102*(A-8.7);
    else
        disp('wrong input for A')
    end
end
