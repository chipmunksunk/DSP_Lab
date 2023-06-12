clearvars
load('speech.mat'); load('noise_5insx.mat');
fs = 8192;

soundsc(x_5insx, fs)