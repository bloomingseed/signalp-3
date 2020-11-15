function F0s = pitchcontour(y,Fs)
%PITCHCONTOUR Return the fundamental 
% frequencies, if exists, 
% of the signal every 200ms
%   y: voice signal
%   Fs: sampling rate

%DEBUGGING
miny=min(y);
maxy=max(y);

felms = 200*Fs/1000;    % number of elements in a frame

frames = splitx(y,felms);% frames boundaries in y
N = size(frames,1);     % number of rows == number of frames
F0s=zeros(1,N);         % zero-vector of N dimensions
for k=1:N               % for each frame
    framek = y(frames(k,1):frames(k,2));% working frame
    figure
%     plot(framek);
    %plot(y);    % original audio signal
    %drawing framek's region
    %line([frames(k,1),frames(k,1)],[miny,maxy],'LineStyle','--')
    %line([frames(k,2),frames(k,2)],[miny,maxy],'LineStyle','--')
    
    f0 = fundfreq(framek,Fs); 
    
    F0s(k) = f0;
end

end

