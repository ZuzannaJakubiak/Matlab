f =@(x) abs(x)

% wykres funkcji;
x = -1:1e-3:1;
y = f(x);
figure
plot(x,y); title('funkcja początkowa'); xlabel('x');ylabel('y');

% 7 równoodległych węzłów
xc = linspace(-1,1,7);
yc = f(xc);
p = polyfit(xc,yc,6);
figure 
plot(x,y)
hold on; 
plot(xc,yc,'o',x,polyval(p,x));
legend('funkcja początkowa','węzły równoodległe','interpolacja')
hold on;
figure
plot(x,abs(y-polyval(p,x))); xlabel('x');ylabel('|f(x)-p(x)|');title('Błąd');

% węzły Czebyszewa
n = 7;
k = 1:7;
xc = cos((2*k-1)/2/n*pi); 
yc = f(xc); 
figure
plot(x,y)
hold on;
plot(xc,yc,'o')

p = polyfit(xc,yc,n-1); 
plot(x,polyval(p,x)); 
legend('funkcja początkowa','węzły czebyszewa','interpolacja')
figure
plot(x,abs(y-polyval(p,x))); xlabel('x');ylabel('|f(x)-p(x)|');title('Błąd');

%wykres błędu od n
n=1:20;

blad_lw = zeros(1,length(n)); 
blad_cw = zeros(1,length(n)); 

for i=1:length(n)
    x_lw = linspace(-1,1,n(i)); 
    y_ln = f(x_lw);
    p_lw = polyfit(x_lw,y_ln,n(i)-1);
    blad_lw(i) = max( abs( y-polyval(p_lw,x) ) );

    k = 1:n(i); x_cw = cos((2*k-1)/2/n(i)*pi); y_cn = f(x_cw);
    p_cw = polyfit(x_cw,y_cn,n(i)-1);
    blad_cw(i) = max( abs( y-polyval(p_cw,x) ) );
end
figure
plot(n,blad_lw,n,blad_cw);
xlabel('n'); ylabel('błąd bezwzględny');
legend('węzły równoodległe','węzły Czebyszewa')