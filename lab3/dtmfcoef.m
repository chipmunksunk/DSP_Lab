function s = dtmfcoef(X, fs)
dtmf_rows = [697, 770, 852, 941];
dtmf_cols = [1209, 1336, 1477, 1633];
dtmf_keys = ...
    ['1','2','3','A';
     '4','5','6','B';
     '7','8','9','C';
     '*','0','#','D'];
f = fs/(2*length(X)):fs/(2*length(X)):fs/2;
[~, locs] = findpeaks(X);
[~, row_ind] = min((f(locs(1))-dtmf_rows).^2);
[~, col_ind] = min((f(locs(2))-dtmf_cols).^2);
s = dtmf_keys(row_ind, col_ind);
end