%digital time vector
n = 0:100;
%continuous time frequency in Hz
F=1;
%sampling rate in s
T=0.05;

s=sin(2*pi*F*n*T);

figure
stem(n,s)
title("Generated Sinusoidal Signal")
xlabel("Discrete Time n")
ylabel("Amplitude")

%figure
%plot(n*T,s)

S=fft(s,128);
P=S.*conj(S);
w=(0:127)/128;

figure
plot(2*w,P)
title("Spectrum of the Generated Signal")
xlabel("Normalized Frequency [rad/s]")
ylabel("Amplitude")

% Add Disturbance
s2 = s+sin(2*pi*4*n*T);
S2 = fft(s2,128);
P2=S2.*conj(S2);

figure
stem(n,s2)
title("Generated Sinusoidal Signal With Disturbance")
xlabel("Discrete Time n")
ylabel("Amplitude")

figure
plot(2*w,P2)
title("Spectrum of the Disturbed Signal")
xlabel("Normalized Frequency [rad/s]")
ylabel("Amplitude")

%Filter
b=[1 1 1 1]/4;
a=1;
[H,w1]=freqz(b,a);
figure
plot(w1/(2*pi*T),abs(H))
title("Frequency Response of the Filter")
xlabel("Normalized Frequency [rad/s]")
ylabel("Amplitude")

sf=filter(b,a,s2);
SF=fft(sf,128);
PF=SF.*conj(SF);

figure
stem(n,sf)
title("Recovered Signal")
xlabel("Discrete Time n")
ylabel("Amplitude")

figure
plot(2*w,PF)
title("Spectrum of the Recovered Signal")
xlabel("Normalized Frequency [rad/s]")
ylabel("Amplitude")