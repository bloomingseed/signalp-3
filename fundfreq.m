function f0 = fundfreq(y,Fs)
%FUNDFREQ Return fundamental frequency of the input signal
%   y: input signal
%   Fs: sampling rate
    
    f0=NaN;  % undefined
    R0 = 0.27;       % pitch detection threshold
    Fmin = 70;      % minimum tone pitch
    Fmax = 400;     % maximum tone pitch
    dfmin=floor(Fs/Fmax);
    dfmax=floor(Fs/Fmin);
    dpeak=10;   % peak length/locals to peak (samples)
    
    R=autocorrel(y);    % autocorrelation function of y
    %Rspeech = R(dfmin:dfmax);   % period must be amongst
    %[peak,peaki] = max(peaks(Rspeech));   % candidate peak value and index
    %peaki = peaki+dfmin;    % absolute index
    [peak,peaki] = max(peaks(R));   % find largest local maximum and its index
    localleft=max(1,peaki-dpeak);
    localright=peaki+dpeak;
    %debugfundfreq;  % draw framek's statistics
    
    if( peak >= R0...%)  % if greater than threshold (possibly not a noise)
        && peaki>=dfmin && peaki <=dfmax...   % inside acceptable f0 range
        && peak >= max(R(localleft),R(localright)))  % peak is truly local maximum
        T0=peaki/Fs; % fundamental period
        f0=1/T0;    % fundamental frequency
    end
end

