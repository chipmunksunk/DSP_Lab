function Cxx_smooth = spec2(X, m)
N = length(X);
Cxx = 1/N * abs(fft(X)).^2; % compute standard Peridogram

Cxx_smooth = zeros(N,1);
 
% smooth Periodogram, hand
for k = 1:m
   Cxx_smooth(k) = 1/(m+k) * sum(Cxx(1:k+m)); 
end
for k = m+1:N-m
    Cxx_smooth(k) = 1/(2*m+1) * sum(Cxx(k-m:k+m));
end
for k = N-m+1:N
    Cxx_smooth(k) = 1/(N-k+m) * sum(Cxx(k-m:N));
end

end