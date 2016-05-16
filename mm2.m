function [ Wynik ] = mm2(f, x, iter )
df=pochodna(f);%pierwsza pochodna
ddf=pochodna(df);%druga pochodna
Wynik=zeros(iter,1);%alokacja pami�ci
for i=1:iter
    %por�wnywanie modu��w
    %wyznaczanie pierwiastkow zgodnie ze wzorem
    if abs(wielomian(x,df)+sqrt(wielomian(x,df)^2-2*wielomian(x,f)*wielomian(x,ddf)))>abs(wielomian(x,df)-sqrt(wielomian(x,df)^2-2*wielomian(x,f)*wielomian(x,ddf)))
        z=-2*wielomian(x,f)/(wielomian(x,df)+sqrt(wielomian(x,df)^2-2*wielomian(x,f)*wielomian(x,ddf)));
    else
        z=-2*wielomian(x,f)/(wielomian(x,df)-sqrt(wielomian(x,df)^2-2*wielomian(x,f)*wielomian(x,ddf)));
    end
    %zapis wyniku iteracji
    Wynik(i)=x+z;
    %wyznaczanie kolejnej wartosci
    x=x+z;
end

