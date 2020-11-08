% n=1:100;
% sig=5*cos(n*pi/3);
[sig,F1]=audioread("TinHieuMau/lab-female.wav");
flen=200;   % frame length in millisec
felms = flen*F1/1000;   % number of samples in frame
% n=12000:12000+felms;
% sig=sig(n);  
frames = splitx(sig,felms);
framek=frames(38,1:2);               % select a frame
sig=sig(framek(1):framek(2));        % signal value at framek

R=autocorrel(sig);
nR = datanormalize(R);
pivot = 0.5;

figure
subplot(3,1,1)
plot(sig)
title("Signal")

subplot(3,1,2)
plot(R)
title("Autocorrelation of the signal")

subplot(3,1,3)
plot(nR);
title("Normalized autocorrelation of the signal")
line([0,length(nR)],[pivot,pivot])