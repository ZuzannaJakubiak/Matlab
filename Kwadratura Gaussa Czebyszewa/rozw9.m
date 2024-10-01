n=61
w = pi/(n+1);

I=0;
for i=0:n
    x=cos(((2*i + 1)/(2*n+2))*pi)
    I=I+w*x^2
end

syms x
y=int(x.^2/sqrt(1-x.^2),-1,1)
y=double(y)
