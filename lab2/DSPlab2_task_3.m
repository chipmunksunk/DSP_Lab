clear all;
close all;
clc;
%% Determining impulse & freq response
b = [0.16, 0.48, 0.48, 0.16];
a = [1, 0.13, 0.52, 0.3];

n = -4:30;
x = +(n==0);

h = filter(b,a,x);

figure('units', 'normalized','OuterPosition',[0 0 1 1])
stem(n,h)
title('impulse response of filter')
xlabel('n')
ylabel('h(n)')

figure('units', 'normalized','OuterPosition',[0 0 1 1])
subplot(1,2,1)
[H,w] = freqz(b,a);
plot(w/pi, 20*log10(abs(H)))
title('actual freq response of filter')
ylabel('Magnitude $\mid H(\omega) \mid$', 'Interpreter','latex')
xlabel('frequency in radians $(\times \pi)$ ', 'Interpreter','latex')
ylim([-160 20])

%% exciting signals to measure magnitude
K = 100;
N = 256;
n = 0:N-1;
wk = (0:100).* pi ./ 100;
H = zeros([1 K]);
for k=1:K+1
    x = cos(wk(k).*n);
    y = filter(b,a,x);
    H(k) = max(y(30:end));
end

subplot(1,2,2)
plot(wk/pi, 20*log10(abs(H)))
title('measured freq response of filter')
ylabel('Magnitude $\mid H(\omega) \mid$', 'Interpreter','latex')
xlabel('frequency in radians $(\times \pi)$ ', 'Interpreter','latex')
ylim([-160 20])

%% local change test 2






