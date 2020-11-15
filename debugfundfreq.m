figure
plot(R)
maxr=max(R);
minr=min(R);
line([dfmin dfmin], [minr maxr],'LineStyle','--')
line([dfmax dfmax], [minr maxr],'LineStyle','--')
line([0 length(R)], [R0 R0],'LineStyle','--')
line([peaki peaki], [minr maxr],'LineStyle','--')
line([localleft localleft], [minr maxr],'LineStyle','--')
line([localright localright], [minr maxr],'LineStyle','--')
