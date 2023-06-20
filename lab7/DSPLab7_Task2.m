load('ar7.mat')
m = 10;
N = length(X);
wk = 2/N *(0:N-1);
figure('Position',[100 100 600 500])
Cxx_smooth = spec2(X, 0);
subplot(2,2,1); 
plot(wk,Cxx_smooth)
title('m=0'); xlabel('Normalized Frequency'); ylabel('C_{xx}^s')
Cxx_smooth = spec2(X, 10);
subplot(2,2,2);  
plot(wk,Cxx_smooth)
title('m=10'); xlabel('Normalized Frequency'); ylabel('C_{xx}^s')
Cxx_smooth = spec2(X, 20);
subplot(2,2,3); 
plot(wk,Cxx_smooth)
title('m=20'); xlabel('Normalized Frequency'); ylabel('C_{xx}^s')
Cxx_smooth = spec2(X, 50);
subplot(2,2,4);
plot(wk,Cxx_smooth)
title('m=50'); xlabel('Normalized Frequency'); ylabel('C_{xx}^s')
sgtitle('Smoothed Periodogram')

print -depsc '7_2_Smoothed'
