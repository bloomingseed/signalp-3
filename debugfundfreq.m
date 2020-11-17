% DEBUGGING(for fundfreq.m only): display frame autocorrelation graph along
% the threshold, expected domain, 
figure
maxr=max(R);
minr=min(R);
acgh=plot(R);    % autocorrelation graph
title("F0 calculation demonstration")
scaleupg;       % scale up graph
% show autocorrelation threshold
r0h=line([0 length(R)], [R0 R0],'LineStyle','--','Color','blue');
% show expected domain:
ledh=line([dfmin dfmin], [minr maxr],'LineStyle','--','Color','red');
redh=line([dfmax dfmax], [minr maxr],'LineStyle','--','Color','red');
% show peak
phandle=line([peaki peaki], [minr maxr],'LineStyle','--','Color','black');
% show locals to peak
pllh=line([localleft localleft], [minr maxr],'LineStyle','--','Color','#7E2F8E');
prlh=line([localright localright], [minr maxr],'LineStyle','--','Color','#7E2F8E');
legend([acgh,r0h,ledh,redh,phandle,pllh,prlh],...
    ["R(lag)","R0","70Hz","400Hz","Local maximum","Leftmost local","Rightmost local"])
xlabel("Lag(sample)")
ylabel("Amplitude")