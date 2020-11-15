function R = autocorrel(x)
% Return the normalized autocorrelation of signal x
N=length(x);    % length (samples) of input signal
R=zeros(1,N);   % initialize output vector with N samples
for k=0:N-1
   fself = timeshift(x,-k,0,0); % future self is the input signal right-shifted by k samples
   R(k+1)= sum(x.*fself);       % autocorrelation value at (k+1) sample
end
R=R/R(1);   % normalize
end

