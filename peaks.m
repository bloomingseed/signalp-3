function peakis = peaks(y)
%PEAKS Exclude all non-peak elements in the input signal
%   y: Input signal

N=length(y);    % length of input signal
peakis = zeros(1,N);    %initialize peaks

for i=2:N-1
    if y(i)>y(i-1) && y(i)>y(i+1)
        peakis(i) = y(i);   % save index i
    end
end

