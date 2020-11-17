function F0s = pitchcontournosv(y,Fs)
%PITCHCONTOUR Return the fundamental frequencies, if exists, frame-by-frame
%   y: voice signal
%   Fs: sampling rate

flen=20;                % frame length (milliseconds)
felms = flen*Fs/1000;    % frame length (samples)
frames = splitx(y,felms);% frames boundaries in y
N = size(frames,1);     % number of rows == number of frames
F0s=zeros(1,N);         % initialize output vector

for k=1:N               % loop through each frame
    framek = y(frames(k,1):frames(k,2));    % specify working frame
    %DEBUGGING: illustrate this signal frame on the original signal
     %debugpitchcontour;  % SET A BREAKPOINT HERE
    
    f0 = fundfreq(framek,Fs);   % find f0 of this frame
    F0s(k) = f0;                % assign f0 to output vector
end
end