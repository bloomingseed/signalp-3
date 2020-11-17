files = ["lab-male.wav","lab-female.wav", "studio-male.wav", "studio-female.wav"];
%files = ["studio-male.wav"];%, "studio-male.wav", "studio-female.wav"];
 means = readmatrix("means.f0","FileType","text"); % wavesurfer's mean f0s
 sds = readmatrix("sds.f0","FileType","text");     % wavesurfer's standard deviations
 pmeans = [];    % program means
 psds = [];      % program standard deviations
 pmeansnosv = [];    % program means without svfilter
 psdsnosv = [];      % program standard deviations without svfilter
for k=1:length(files)
    
    [y,F1]=audioread("TinHieuMau/"+files(k));   % read signal 
    
    F0s = pitchcontour(y,F1);                   % f0 in each frames
    F0s2 = pitchcontournosv(y,F1);  
    pmeans = [pmeans mean(F0s,'omitnan')];
    psds = [psds std(F0s,'omitnan')];
    pmeansnosv = [pmeansnosv mean(F0s2,'omitnan')];
    psdsnosv = [psdsnosv std(F0s2,'omitnan')];
    % print mean and standard deviation result for this signal:
    disp(files(k)+": mean="+mean(F0s,'omitnan')+", std="+std(F0s,'omitnan'))
    disp(files(k)+" (no sv): mean="+mean(F0s2,'omitnan')+", std="+std(F0s2,'omitnan'))
    
    % plotting figure
%     figure
%     subplot(3,1,1)
%     plot(y)         
%     scaleupg;   % scale up graph    
%     title("Signal "+ files(k))
%     xlabel("Time(samples)")
%     ylabel("Amplitude")
% 
%     subplot(3,1,2)
%     scatter(0:length(F0s)-1,F0s,'filled')    % plot F0s
%     scaleupg;   % scale up graph
%     title("Pitch contour pane")
%     xlabel("Time(frames)")
%     ylabel("Frequency (Hz)")
%     % for better visualization
%     f0min = 70;     % minimum f0 (Hz)
%     f0max = 400;    % maximum f0
%     axis([0 length(F0s) f0min f0max])
%     
%     subplot(3,1,3)          % plotting nosv algorithm
%     scatter(0:length(F0s2)-1,F0s2,'filled')    % plot F0s
%     scaleupg;   % scale up graph
%     title("Pitch contour pane (wihtout Silence-Voicecd filtering)")
%     xlabel("Time(frames)")
%     ylabel("Frequency (Hz)")
%     % for better visualization
%     f0min = 70;     % minimum f0 (Hz)
%     f0max = 400;    % maximum f0
%     axis([0 length(F0s) f0min f0max])
    
    %DEBUGGING : rewind calculation process
%      pitchcontour(y,F1);     % set breakpoint here to have a result -
                             % process viewport; *also set breakpoint in inner DEBUGGING areas
    
end

figure; % comparing results
pxaxis = 1:4;   % xaxis for plotting
plot(pxaxis,means,pxaxis,pmeans,pxaxis,pmeansnosv,"magenta",pxaxis,sds,"blue--",pxaxis,psds,"red--",pxaxis,psdsnosv,"magenta--")
hold on
scatter(pxaxis,means,"filled","blue")
scatter(pxaxis,pmeans,"filled","red")
scatter(pxaxis,pmeansnosv,"filled","magenta")
scatter(pxaxis,sds,"filled","blue")
scatter(pxaxis,psds,"filled","red")
scatter(pxaxis,psdsnosv,"filled","magenta")
scaleupg
hold off
xticks(1:length(files));
xticklabels(files);
ylim([0,ceil(max([means,pmeans])*1.5)]); % spare top space
ylabel("Frequency (Hz)");
title("Comparing results, with and without Silence-Voiced filter, to Wave Surfer's")
legend("Mean F0 (Wave Surfer's)","Mean F0 (with SV filter)","Mean F0 (without SV filter)","Standard deviation (Wave Surfer's)","Standard deviation (with SV filter)","Standard deviation (without SV filter)")
