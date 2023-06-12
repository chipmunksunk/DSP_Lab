function [impulseResponse_h] = firlp(filterLength_N,cutoffFrequency_wc)
%FIR Filter Type I Generator: Lowpass
alpha = (filterLength_N-1)/2;
n = 0:filterLength_N-1;
n = n-alpha;
impulseResponse_h = sinc(n.*cutoffFrequency_wc);