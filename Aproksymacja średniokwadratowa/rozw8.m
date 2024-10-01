x=-1:0.01:1
y=x./(x.^2+2)
a=polyfit(x,y,2)
p=polyval(a,x) 
bapr=y-p
baprmax=max(abs(bapr))
figure
plot(x,y,x,p)
title('aproksymacja funkcji')
legend('funkcja', 'funkcja przybliżająca')
xlabel('x')
ylabel('y')
figure
plot(x,bapr)
title('błąd aproksymacji')
xlabel('x')
ylabel('y') 