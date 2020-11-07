n=1:100;
sinx=5*cos(n*pi/3);
R=autocorrel(sinx);

figure
subplot(2,1,1)
plot(n,sinx)
title("Signal")

subplot(2,1,2)
plot(n,autocorrel(sinx))
title("Autocorrelation of the signal")