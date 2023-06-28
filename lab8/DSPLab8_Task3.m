%% clc, close all...
clc;
clear;
close all;

%% Variance of the residuals - Sigma_hat
load('.\files_lab8\arunknown.mat')
N = length(X);
m = 1:10;

% AR model parameters
a = {};
for i = m 
    a = {a{:}, aryule(X, i)};
end

% Variance of the residuals
sigma_hat = [];
for i = m 
    sum_n = 0;

    for n = i:N-1
        sum_k = 0;
        a_k = a{i};

        for k = 1:i
            sum_k = sum_k+a_k(k)*X(n-k+1);
        end

        sum_n = (X(n)+ sum_k)^2;
    end

    sigma_hat = [sigma_hat, 1/(N-i) * sum_n];
end


%% Akaike's Information Criterion (AIC)
AIC = log(sigma_hat)+ m.*(2/N);

%% Minimum Description Length (MDL)
MDL = log(sigma_hat)+ m.*(log(N)/N);

%% Plots
set(groot, 'defaultAxesFontSize',15);

figure;
plot(AIC);
hold on;
plot(MDL);
hold off;
legend(["AIC", "MDL"]);
xlabel("Model order m");
ylabel("Criterion Magnitude")

figure;
stem(AIC);
hold on;
stem(MDL);
hold off;
legend(["AIC", "MDL"]);
xlabel("Model order m");
ylabel("Criterion Magnitude")