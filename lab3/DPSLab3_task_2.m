N_1 = 36;
N_2 = 60;

% N1
rectangular_1 = rectwin(N_1);
bartlett_1 = bartlett(N_1);
hamming_1 = hamming(N_1);

[rectangular_1_DTFT, ~] = dtft(rectangular_1);
[bartlett_1_DTFT, ~] = dtft(bartlett_1);
[hamming_1_DTFT, w_1]  = dtft(hamming_1);
rectangular_1_DTFT_dB = 20*log10(abs(rectangular_1_DTFT));
bartlett_1_DTFT_dB = 20*log10(abs(bartlett_1_DTFT));
hamming_1_DTFT_dB = 20*log10(abs(hamming_1_DTFT));


figure;
plot(w_1, rectangular_1_DTFT_dB);
hold on
plot(w_1, bartlett_1_DTFT_dB);
hold on 
plot(w_1, hamming_1_DTFT_dB);
hold off
title("N = 36");
legend(["Rectangular" "Bartlett" "Hamming"])

% N2
rectangular_2 = rectwin(N_2);
bartlett_2 = bartlett(N_2);
hamming_2 = hamming(N_2);

[rectangular_2_DTFT, ~] = dtft(rectangular_2);
[bartlett_2_DTFT, ~] = dtft(bartlett_2);
[hamming_2_DTFT, w_2]  = dtft(hamming_2);
rectangular_2_DTFT_dB = 20*log10(abs(rectangular_2_DTFT));
bartlett_2_DTFT_dB = 20*log10(abs(bartlett_2_DTFT));
hamming_2_DTFT_dB = 20*log10(abs(hamming_2_DTFT));

figure;
plot(w_2, rectangular_2_DTFT_dB);
hold on
plot(w_2, bartlett_2_DTFT_dB);
hold on 
plot(w_2, hamming_2_DTFT_dB);
hold off
title("N = 60");
legend(["Rectangular" "Bartlett" "Hamming"])

%Look for main lobe and side lobe levels
[r1_lobe_mag, r1_lobe_locs] = findpeaks(rectangular_1_DTFT_dB);
[r2_lobe_mag, r2_lobe_locs] = findpeaks(rectangular_2_DTFT_dB);
[b1_lobe_mag, b1_lobe_locs] = findpeaks(bartlett_1_DTFT_dB);
[b2_lobe_mag, b2_lobe_locs] = findpeaks(bartlett_2_DTFT_dB);
[h1_lobe_mag, h1_lobe_locs] = findpeaks(hamming_1_DTFT_dB);
[h2_lobe_mag, h2_lobe_locs] = findpeaks(hamming_2_DTFT_dB);
sidelobelevels = [r1_lobe_mag(1), r2_lobe_mag(1), b1_lobe_mag(1), b2_lobe_mag(1), h1_lobe_mag(1), h2_lobe_mag(1)];


% Sinusoid
n = 0:3;
x_sin = sin(0.5*pi*n);
[X_DTFT, w_x] = dtft(x_sin);

figure;
plot(w_x, 20*log(abs(X_DTFT)));
title("Sinusoid");
xlim([0, pi/2]);

%Two sinusoids
n = 0:N_1-1;
w__0 = 0.2*pi;
alpha = 0.1;
w__1 = (w__0+2*pi*alpha)/N_1;
x_sins = sin(w__0*n)+sin(w__1*n);
[X_sins_DTFT, w_xsins] = dtft(x_sins);

figure;
plot(w_xsins, 20*log(abs(X_sins_DTFT)));
title("Check resolution");
 xlim([0, pi/2]);
