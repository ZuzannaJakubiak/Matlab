w=5
syms x
hermiteH(0:w,x)

%%[ 1, 2*x, 4*x^2 - 2, 8*x^3 - 12*x, 16*x^4 - 48*x^2 + 12, 32*x^5 - 160*x^3 + 120*x]

A =[0 0 0 0 2 0;0 0 0 4 0 -2;0 0 8 0 -12 0;0 16 0 -48 0 12; 32 0 -160 0 120 0]

r=A(w,:)
zera=roots(r)
Wi=zeros(w,1)
for i=1:w
    wi=(2.^(w-1)*factorial(w).*sqrt(pi))./(w.^2.*(polyval(A(w-1,:),zera(i))).^2);
    Wi(i)=wi
end
fxi=zera.^2
I=sum(Wi.*fxi)

z=int(x.^2*exp(-x.^2),-inf,inf)
double(z)