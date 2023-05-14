clc;

x=rand(1000,1);
x_min=min(x)
x_max=max(x)
x_mean=mean(x)
x_std=std(x)

y=4*x-2;
y_mean=mean(y)
y_std=std(y)

% use randn now:
x2=randn(1000,1);
x2_min=min(x)
x2_max=max(x)
x2_mean=mean(x)
x2_std=std(x)

y2=4*x-2;
y2_mean=mean(y)
y2_std=std(y)

figure
hist(x)
%ax1 = ancestor(h1, 'axes')
title("Histogram for rand()")
xlabel("Value")
ylabel("Frequency")

figure
hist(x2)
%ax2=ancestor(h2,'axes')
title("Histogram for randn()")
xlabel("Value")
ylabel("Frequency")


