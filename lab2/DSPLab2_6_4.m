% 6.4.1 - Load data
load("Lab 2\files_lab2\b3pulses.mat");

% 6.4.2 - Filter design
% Three hidden signals: 5..8kHz, 10.5...15.5kHz, 18...20kHz - Ts = 80kHz
% 1. Determine bandwidth parameters using (6)
T_s = 1/80000;
w_11 = 5/80 *2*pi;
w_21 = 8/80 *2*pi;
b_1 = (w_21-w_11);
w_01 = (b_1)/2+w_11;
r_1 = sqrt(-b_1/4 + sqrt((b_1^2)/16 +1));

w_12 = 10.5/80 *2*pi;
w_22 = 15.5/80 *2*pi;
b_2 = (w_22-w_12);
w_02 = (b_2)/2+w_12;
r_2 = sqrt(-b_2/4 + sqrt((b_2^2)/16 +1));

w_13 = 18/80 *2*pi;
w_23 = 20/80 *2*pi;
b_3 = (w_23-w_13);
w_03 = (b_3)/2+w_13;
r_3 = sqrt(-b_3/4 + sqrt((b_3^2)/16+1));

w_0 = [w_01 w_02 w_03]
r = [r_1 r_2 r_3]
r_sol = [0.89 0.82 0.92]

% 2. Determine filter coefficients using (5)
B = [1 0 -1; 1 0 -1; 1 0 -1]
A = [1 -2*r(1)*cos(w_0(1)) r(1)^2; 1 -2*r(2)*cos(w_0(2)) r(2)^2; 1 -2*r(3)*cos(w_0(3)) r(3)^2]
A_sol = [1 -2*r_sol(1)*cos(w_0(1)) r_sol(1)^2; 1 -2*r_sol(2)*cos(w_0(2)) r_sol(2)^2; 1 -2*r_sol(3)*cos(w_0(3)) r_sol(3)^2]

% 3. check b, a correct via plotting frequency response
figure

[H,w] = freqz(B(1,:),A(1,:));
plot(w/pi, 20*log10(abs(H)));

hold on

[H,w] = freqz(B(2,:),A(2,:));
plot(w/pi, 20*log10(abs(H)));

hold on

[H,w] = freqz(B(3,:),A(3,:));
plot(w/pi, 20*log10(abs(H)));
%title("Frequency Response");
xlabel("Normalized frequency \omega/\pi");
ylabel("|H(e^{jw})|^2 in dB");
legend(["5...8 kHz" "10.5...15.5 kHz" "18...20 kHz"]);
ylim([-30 50]);

hold off

% figure
% [H,w] = freqz(B(1,:),A(1,:));
% plot(w/pi, 20*log10(abs(H)));
% 
% hold on
% 
% [H,w] = freqz(B(2,:),A_sol(1,:));
% plot(w/pi, 20*log10(abs(H)));
% legend()
% 
% hold off

% 6.4.3 - Filter the signal
n = linspace(0, (size(x,1)-1)*T_s, size(x,1));
figure
stem(n, x);
xlabel("Time in s");
ylabel("Amplitude");

y_1a = filter(B(1,:), A(1,:), x);
y_1b = filter(B(1,:), A_sol(1,:), x);
figure
stem(n, y_1a);
hold on
stem(n, y_1b);
hold off
legend(["Designed filter" "Solution filter"]);
xlabel("Time in s");
ylabel("Amplitude");

y_2a = filter(B(2,:), A(2,:), x);
y_2b = filter(B(2,:), A_sol(2,:), x);
figure
stem(n, y_2a);
hold on
stem(n, y_2b);
hold off
legend(["Designed filter" "Solution filter"]);
xlabel("Time in s");
ylabel("Amplitude");

y_3a = filter(B(3,:), A(3,:), x);
y_3b = filter(B(3,:), A_sol(3,:), x);
figure
stem(n, y_3a);
hold on
stem(n, y_3b);
hold off
legend(["Designed filter" "Solution filter"]);
xlabel("Time in s");
ylabel("Amplitude");