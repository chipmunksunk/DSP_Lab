n = length(Ta);
m = 20;
Ta_smooth = zeros(size(Ta));
for i =1:n
    if (i>m) && (i<n-m)
        Ta_smooth(i) = sum(Ta(i-m:i+m)) / (2*m+1);
    elseif (i<=m)
        Ta_smooth(i) = sum(Ta(1:i)) / length(Ta(1:i));
    elseif (i>=n-m)
        Ta_smooth(i) = sum(Ta(i:end)) / length(Ta(i:end));
    else
        disp('Wrong if statement!!!!!')
    end
end
figure
plot(year, Ta_smooth)
xlabel('year')
ylabel('yearly averaged temparature anomaly')
title(sprintf('Smoothed Ta with m = %d', m))