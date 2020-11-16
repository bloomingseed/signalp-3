function frames = splitx(x, flen)
% Split input signal into frames of specified length
%   x: input signal
%   flen: length of each frame (samples)
%   OUTPUT: mattrix of Nx2 elements, where
%           N is number of frames;
%           column 1: starting sample (inclusive);
%           column 2: ending sample (inclusive);

% constants
N=length(x);
C = ceil(N/flen);   % number of frames

frames = zeros(C,2);   % initialize matrix
for k=1:C
    % calculating left and right bounds
    rightB = k*flen;        
    leftB = rightB-flen+1;
    if(rightB>N)    % if right boundary overflow frame boundary
        rightB=N;   % set right boundary to frame boundary
    end
    % storing left and right boundary index to (k)th frame
    frames(k,1)=leftB;  
    frames(k,2)=rightB;
end