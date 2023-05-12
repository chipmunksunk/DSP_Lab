f = fibonacci(12);
ratios = zeros(1,11);
for i=1:11
   ratios(i) = f(i+1)/f(i);
end

plot(2:12,ratios)
hold on
plot([2 12], [(sqrt(5)+1)/2 (sqrt(5)+1)/2])
legend('$f_{n} / f_{n-1}$', 'golden ratio', 'Interpreter', 'latex','Fontsize',10)
xlabel('n')
ylabel('value')