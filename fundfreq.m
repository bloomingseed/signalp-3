function f0 = fundfreq(y,Fs)
%FUNDFREQ Return fundamental frequency of the input signal
%   y: input signal
%   Fs: sampling rate
    
    % CONSTANTS
    N=length(y);    % length of y (samples)
    f0=NaN;         % let initial f0 be undetermined
    R0 = 0.27;      % pitch detection threshold
    f0min = 70;     % minimum f0 (Hz)
    f0max = 400;    % maximum f0
    dfmin=max(1,floor(Fs/f0max));   % minimum delay (sample): using proven formula
    dfmax=min(N,floor(Fs/f0min));   % minimum delay (sample)
    dpeak=max(1,floor(N/100));% number of samples being locals to peak
    % PROCESS
    R=autocorrel(y);                % autocorrelation function of y
    [peak,peaki] = max(peaks(R));   % find largest local maximum and its index
    tc = peaki-1;                   % concrete period
    localleft=max(2,peaki-dpeak);   % left most local sample
    localright=min(peaki+dpeak,N);  % right most local sample
    %DEBUGGING: draw framek's statistics
%     debugfundfreq;  % SET A BREAKPOINT HERE
    
    if( peak >= R0...%)  % if greater than threshold (possibly not a noise)
        && tc>=dfmin && tc <=dfmax...   % inside acceptable f0 range
        && peak >= max(R(localleft),R(localright)))  % peak is truly local maximum
        T0=tc/Fs; % fundamental period
        f0=1/T0;    % fundamental frequency
    end
end

