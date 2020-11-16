function peakis = peaks(y)
%PEAKS Exclude all non-peak elements in the input signal
%   y: Input signal

N=length(y);    % length of input signal
peakis = zeros(1,N);    % let all samples be zero
% for samples in:
for i=2:N-1
    if y(i)>y(i-1) && y(i)>y(i+1)   % if sample(i) is a peak
        peakis(i) = y(i);   % save peak to index i
    end
end

