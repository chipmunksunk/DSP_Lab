% calculating the optimal size for a common beverage can with volume of
% 330ml
r = 0.5:10;
V = 330;
A =2*(pi*r.^2 + V./r);

plot(r, A)
[A_opt, r_opt] = min(A);
hold on
plot(r_opt, A_opt, '.', MarkerSize=15)
xlabel('radius of can in cm','Interpreter','latex')
ylabel('surface of can in $cm^2$','Interpreter','latex')

h_opt = V/(pi*r_opt^2);