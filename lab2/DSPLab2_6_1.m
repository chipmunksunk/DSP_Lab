clc;
h = 0.2*ones(1,5);
x_1 = ones(1,10);
x_2 = sin(0.2*pi*[0:35]);
x_3 = sin(0.4*pi*[0:35]);

y_1 = convmat(x_1, h);
y_2 = convmat(x_2, h);
y_3 = convmat(x_3, h);

y__1 = conv(h, x_1);
y__2 = conv(h, x_2);
y__3 = conv(h, x_3);

max(y_1-y__1)
max(y_2-y__2)
max(y_3-y__3)

%% PLOTS
figure
subplot(3,2,1)
stem(0:9, x_1)
title("Signal x_1");
xlabel("Discrete Time n");
ylabel("Amplitude");
subplot(3,2,2)
stem(0:13, y_1)
title("Filtered x_1");
xlabel("Discrete Time n");
ylabel("Amplitude");

subplot(3,2,3)
stem(0:35, x_2)
title("Signal x_2");
xlabel("Discrete Time n");
ylabel("Amplitude");
subplot(3,2,4)
stem(0:39, y_2)
title("Filtered x_2");
xlabel("Discrete Time n");
ylabel("Amplitude");

subplot(3,2,5)
stem(0:35, x_3)
title("Signal x_3");
xlabel("Discrete Time n");
ylabel("Amplitude");
subplot(3,2,6)
stem(0:39, y_3)
title("Filtered x_3");
xlabel("Discrete Time n");
ylabel("Amplitude");