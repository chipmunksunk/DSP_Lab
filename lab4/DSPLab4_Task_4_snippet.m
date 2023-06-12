N = 25; %filter length
f = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.8 0.9 1]; %frequency vector
a = [0 0 1 1 0 0 0.5 0.5 0 0]; %magnitude vector
filter_params = firpm(N, f, a); %use firpm for filter parameters