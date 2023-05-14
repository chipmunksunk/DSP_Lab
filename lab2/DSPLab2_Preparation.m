% Preparation: Generate signals
% -10 <= n <= 20
% sin(0.12*pi*n)
% u(n) - u(n-6)
% 0.9^n * u(n)
% 0.5*d(n-1) + d(n-2) + 0.5* d(n-3)
% o.9^n * cos(0.2*pi*n)
% sin(0.2*pi*n) / 0.2*pi*n

n = -10:20;
x1 = sin(0.12.*pi.*n);
x2 = u(n,0) - u(n, 6);
x3 = 0.9.^n .* u(n,0);
x4 = 0.5.*dirac(n,1) + dirac(n,2) + 0.5.*dirac(n,3);
x5 = 0.9.^n .* cos(0.2.*pi.*n);
x6 = sinc(0.2.*pi.*n);

%%%% 6_1_1 Plots
figure
subplot(3, 2, 1);
stem(n, x1);
title("Signal 1");
xlabel("Discrete Time n");
ylabel("Amplitude");

subplot(3,2,2);
stem(n, x2);
title("Signal 2");
xlabel("Discrete Time n");
ylabel("Amplitude");

subplot(3,2,3);
stem(n, x3);
title("Signal 3");
xlabel("Discrete Time n");
ylabel("Amplitude");

subplot(3,2,4);
stem(n, x4);
title("Signal 4");
xlabel("Discrete Time n");
ylabel("Amplitude");

subplot(3,2,5);
stem(n, x5);
title("Signal 5");
xlabel("Discrete Time n");
ylabel("Amplitude");

subplot(3,2,6);
stem(n, x6);
title("Signal 6");
xlabel("Discrete Time n");
ylabel("Amplitude");

%%%% Functions
function step_function = u(x, x0)
    step_function =+ (x>= x0);
end

function kronecker_delta = dirac(x, x0)
    kronecker_delta =+ (x==x0);
end
