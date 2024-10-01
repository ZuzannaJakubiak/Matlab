function[wynik,X,wyzn]=Cramer2(A,b)
[wA,kA] = size(A); 
[wb,kb] = size(b);

if wA ~= kA
        disp('Błąd. To nie macierz kwadratowa')
    return
end
if kb ~= 1
    disp('Błąd. To nie macierz o jednej kolumnie')
    return
end
if kA ~= wb
    disp('Błąd. A i b nie są kompatybilne')
    return
end

x1=linspace(-2,7,10) %%wykres
y1=x1
[X1 Y1]=meshgrid(x1,y1)
for j=1:kA
    Z=(b(j)-A(j,1).*X1-A(j,2).*Y1)./A(j,3)
mesh(x1,y1,Z)
hold on
end
hold off
xlabel('x')
ylabel('y')
zlabel('z')

WA = det(A); %%metoda Creamera
if WA == 0
    wyzn=zeros(wb,1)
 for i = 1:kA
    if i == 1
        Wi = [b A(:,2:kA)];
    elseif i < kA
        Wi = [A(:,1:i-1) b A(:,i+1:kA)];
    else
        Wi = [A(:,1:i-1) b];
    end
    wyzn(i) = det(Wi);
 end
 if wyzn(1)==0 & wyzn(2)==0 & wyzn(3)==0
     disp('Wyznacznik główny macierzy oraz wszystkie wyznaczniki szczególne są równe 0. Układ ma nieskończenie wiele rozwiązań')
     return
 elseif wyzn(1)~=0 | wyzn(2)~=0 | wyzn(3)~=0
     disp('Wyznacznik główny macierzy jest równy zero oraz przynajmniej jeden z wyznaczników szczególnych jest różny od zera. Układ jest sprzeczny')
     return
 end
end
    wynik = zeros(wb,1);    

for i = 1:kA
    if i == 1
        Wi = [b A(:,2:kA)];
    elseif i < kA
        Wi = [A(:,1:i-1) b A(:,i+1:kA)];
    else
        Wi = [A(:,1:i-1) b];
    end
    wynik(i) = det(Wi)/WA;
end

Ao=inv(A)%%metoda macierzowa
X=Ao*b







