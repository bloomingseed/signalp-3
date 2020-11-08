function frames = splitx(x, len)
% Split input signal into frames of specified length
%   x: input signal
%   len: length (elements) of each frame (samples)

% constants
N=length(x);
C = ceil(N/len);   % number of frames

frames = zeros(C,2);   % initialize matrix
for k=1:C
    % calculating left and right bounds
    rightB = k*len;        
    leftB = rightB-len+1;
    if(rightB>N)
        rightB=N;
    end
    % storing left and right bounds to (k)th frame
    frames(k,1)=leftB;  
    frames(k,2)=rightB;
end