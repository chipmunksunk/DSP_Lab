set(groot, 'defaultAxesFontSize',15)
clearvars
close all

%% 7.3
N = 53;
w_c = 0.15*pi;
alpha = (N-1)/2;
n_c = round((alpha+1) * 0.15);

Hmag=[ones(1,n_c),zeros(1,alpha+1-n_c)];
wk=2*pi/N*(0:alpha);
Hphi=exp(-1i*wk*alpha);
H=Hmag.*Hphi;

H=[H,conj(H(end:-1:2))];
h=ifft(H);


H = abs(fft(h, 1e+3));
H = H(1:round(length(H)/2)) ./ length(h);
H(2:end-1) = H(2:end-1)*2;

n = -(N-1)/2:N/length(h):(N-1)/2;
f = 1/length(H):1/length(H):1;

figure('Position',[0 100 1200 500]);
sgtitle('Low pass \omega_c = 0.15\pi via Frequency Sampling', fontsize=15)

subplot(1,2,2); plot(f, 10*log10(H))
title('frequency response')
xlabel('normalized frequency (\times \pi)')
ylabel('|H(\Omega)|')

subplot(1,2,1); stem(n, h)
title('Impulse response')
xlabel('n')
ylabel('h(n)')

saveas(gcf, '7_3_Freq_samp__Low_pass.png', 'png')
