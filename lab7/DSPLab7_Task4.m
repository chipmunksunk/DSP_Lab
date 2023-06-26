clearvars
N = 64;
n = 0:N-1;
X = sin(0.2*pi*n) + 2 * sin(0.4*pi*n) + sin(0.45*pi*n) + randn([1 N]);
Ixx64 = 1/N * abs(fft(X, 256)).^2;
%%
N = 256;
n = 0:N-1;
X = sin(0.2*pi*n) + 2 * sin(0.4*pi*n) + sin(0.45*pi*n) + randn([1 N]);
Ixx256 = 1/N * abs(fft(X, 256)).^2;
%%
wk = (0:N-1) / N * 2;
figure(Position=[100 100 900 500])
subplot(1,2,1)
plot(wk,Ixx64); title('Peridogram N=64'); xlabel('Normalized Frequency'); ylabel('Ixx')
subplot(1,2,2)
plot(wk, Ixx256); title('Peridogram N=256'); xlabel('Normalized Frequency'); ylabel('Ixx')

