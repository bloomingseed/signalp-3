function m = timeshift(x,k,defaultL,defaultR)
%Time left-shifting vector x by k: x[n-k]
%Usage: timeshift(x,k,defaultL,defaultR)
%       where:  x is the target vector 
%               k is the value to shift
%               defaultL: default value for elements added from the left
%               defaultR: default value for elements added from the right
m=x;
len=length(x);
for i=1:1:len
    rval=defaultL;
    if(i-k>len)
        rval=defaultR;
    else
        if(i-k>0)
            rval=x(i-k);
        end
    end
    m(i)=rval;
end