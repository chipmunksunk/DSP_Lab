function [impulseResponse_h] = firlp(filterLength_N,cutoffFrequency_wc)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
alpha = (filterLength_N-1)/2;
n = 0:filterLength_N-1;
n = n-alpha;
impulseResponse_h = sinc(n.*cutoffFrequency_wc);