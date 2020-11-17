%DEBUGGING(for pitchcontour.m only): show current frame on top of original
%signal
miny=min(y);    % minimum amplitude of original signal
maxy=max(y);    % maximum amplitude
figure
plot(y);          % show original audio signal
%drawing framek's region
line([sig(frames(k,1)),sig(frames(k,1))],[miny,maxy],'LineStyle','--')
line([sig(frames(k,2)),sig(frames(k,2))],[miny,maxy],'LineStyle','--')
title("Current frame")
legend("Original signal","Current frame")
scaleupg;   % scale up graph