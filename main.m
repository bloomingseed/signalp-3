files = ["lab-male.wav","lab-female.wav", "studio-male.wav", "studio-female.wav"];
for k=1:length(files)
    [y,F1]=audioread("TinHieuMau/"+files(k));
    flen=200;   % frame length in millisec
    felms = flen*F1/1000;   % number of samples in frame
    % n=12000:12000+felms;
    % sig=sig(n);  
    frames = splitx(y,felms);
    index = floor(length(frames)/2);
    framek=frames(index,1:2);               % select a frame
    sig=y(framek(1):framek(2));        % signal value at framek

    R=autocorrel(sig);
    %nR = datanormalize(R);
    nR = stdnormalize(R);
    pivot = 3.5;

    Fmin = 70;      % minimum pitch
    Fmax = 400;     % maximum pitch
    leftB = Fmin+1; % minimum delta_f
    rightB=Fmax+1;  % maximum delta_f
    
    figure

    subplot(4,1,1)
    plot(y)
    title(["Signal " files(k)])
    line([framek(1) framek(1)], [min(y) max(y)], 'LineStyle','--')
    line([framek(2) framek(2)], [min(y) max(y)],'LineStyle','--')

    subplot(4,1,2)
    plot(framek(1):framek(2),sig)
    title(["Signal at frame " index])

    subplot(4,1,3)
    plot(R)
    title("Autocorrelation of the signal")

    subplot(4,1,4)
    plot(nR);
    title("Normalized autocorrelation of the signal")
    line([0,length(nR)],[pivot,pivot])
    line([leftB leftB], [min(nR) max(nR)], 'LineStyle','--')
    line([rightB rightB], [min(nR) max(nR)],'LineStyle','--')

end
