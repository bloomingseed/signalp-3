function ctour = pitchcontour(y,Fs)
%PITCHCONTOUR Return the fundamental frequencies, if exists, frame-by-frame
%   y: voice signal
%   Fs: sampling rate

    flen=20;                % frame length (milliseconds)
    felms = flen*Fs/1000;    % frame length (samples)

    vsbounds=svfilter(y,Fs);    % discriminate silence-voiced areas
    ctour=[];   % initialize contour map
    silenced = 1;   % let first area be silenced area
    for i=1:length(vsbounds)-1  % for each areas
       sig = vsbounds(i):vsbounds(i+1);     % silenced signal boundaries
       frames = splitx(sig,felms);          % split silenced signal into frames
       N=size(frames,1);                    % get number of frames
       F0s = NaN(1,N);                      % all frames have undefined f0
       if silenced ~= 1             % if not a silenced area
           for k=1:N                % loop through each frame
                framek = sig(frames(k,1):frames(k,2));    % specify working frame
                yframek=y(framek);                        % y(framek)
                %DEBUGGING: illustrate this signal frame on the original signal
%                   debugpitchcontour;  % SET A BREAKPOINT HERE

                f0 = fundfreq(yframek,Fs);  % find f0 of this frame
                F0s(k) = f0;                % assign f0 to output vector
           end
       end
       ctour=[ctour F0s];               % append reusult to output vector 
       silenced = -silenced;            % switch mode: silenced - voiced
    end
end