function [x] = genFMsignal(alpha, beta, gamma, f_c, f_s, tStart, tStop)
% Generate a sinusoidal FM signal
t = tStart:1/f_s:tStop;
Psi = 2*pi*f_c*t + alpha/beta * sin(2*pi*beta*t+gamma); 
x = 1*cos(Psi);
x = x';
end