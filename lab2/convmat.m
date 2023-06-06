function [y, H] = convmat(x_1,h)
% This function implements the convolution of two arrays using the
% convolution matrix notation
szh = size(h);
szh = szh(2);
szx = size(x_1);
szx = szx(2);
%if szh > szx
%    x = [x zeros(1,szh-szx)];
%    szx = size(x);
%    szx = szx(2);
%end
if szx > szh
    h = [h zeros(1,szx-1)];
    szh = size(h);
    szh = szh(2);
end

H = [h'];
for n = 2:szx
    H = [H, circshift(h,n-1).'];
end

y = (H*x_1')';
end