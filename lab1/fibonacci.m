function f=fibonacci(N)
    % DSPLab1_Task2(N) generates first n numbers of fibonacci numbers
    f(1) = 1;
    f(2) = 2;
    for i=3:N
        f(i) = f(i-1)+f(i-2);
    end
end