%files = ["lab-male.wav","lab-female.wav", "studio-male.wav", "studio-female.wav"];
files = ["lab-male.wav"];%, "studio-female.wav"];
for k=1:length(files)
    [y,F1]=audioread("TinHieuMau/"+files(k));
    flen=200;   % frame length in millisec
    felms = flen*F1/1000;   % number of samples in frame
    
    frames = splitx(y,felms); 
%     framek=frames(ceil(length(frames)/2),[1,2]);
%     R=autocorrel(y(framek(1):framek(2)));
    F0s = pitchcontour(y,F1);   % f0 in each frames
    disp(files(k)+": mean="+mean(F0s,'omitnan')+", std="+std(F0s,'omitnan'))
    
    
    
    % plotting figure
    figure

    subplot(2,1,1)
    plot(y)
    title("Signal "+ files(k))
%     for i=1:length(frames)
%        % draw frame boundaries
%        line([frames(i,2), frames(i,2)], [-1 1], 'LineStyle','--')
%     end
%     line([framek(1) framek(1)], [min(y) max(y)], 'LineStyle','--')
%     line([framek(2) framek(2)], [min(y) max(y)],'LineStyle','--')


    subplot(2,1,2)
    scatter(0:length(frames)-1,F0s,'filled')
    xlim(0:length(frames))
    title("Pitch contour pane")
    
end
