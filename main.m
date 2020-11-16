% files = ["lab-male.wav","lab-female.wav", "studio-male.wav", "studio-female.wav"];
files = ["studio-male.wav"];%, "studio-male.wav", "studio-female.wav"];
for k=1:length(files)
    
    [y,F1]=audioread("TinHieuMau/"+files(k));   % read signal 
    
    F0s = pitchcontour(y,F1);                   % f0 in each frames
    n=length(F0s);                              % number of frames
    % print mean and standard deviation result for this signal:
    disp(files(k)+": mean="+mean(F0s,'omitnan')+", std="+std(F0s,'omitnan'))
    
    % plotting figure
    figure
    subplot(2,1,1)
    plot(y)         
    scaleupg;   % scale up graph    
    title("Signal "+ files(k))
    xlabel("Time(samples)")
    ylabel("Amplitude")

    subplot(2,1,2)
    scatter(0:length(F0s)-1,F0s,'filled')    % plot F0s
    scaleupg;   % scale up graph
    title("Pitch contour pane")
    xlabel("Time(frames)")
    ylabel("Frequency (Hz)")
    % for better visualization
    f0min = 70;     % minimum f0 (Hz)
    f0max = 400;    % maximum f0
    axis([0 length(F0s) f0min f0max])
    
    %DEBUGGING : rewind calculation process
%      pitchcontour(y,F1);     % set breakpoint here to have a result -
                             % process viewport; *also set breakpoint in inner DEBUGGING areas
    
end
