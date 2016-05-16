function [ Wynik ] = zad2()
W=[-1 -2 5 2 1]; %zadany wielomian
n=length(W)-1;%stopień wielomianu
Wynik=zeros(4,1);%alokacja pamięci
pocz=0;%punkt startowy
for i=1:n
   temp=mm2(W,pocz,20); %wyznaczenie pierwiastka
   Wynik(i)=temp(length(temp));%pierwiastek jest ostatnim elementem wetora wyniku
   pocz=Wynik(i);%nowy punkt startowy
   W=schemat_hornera(W,Wynik(i));%deflacja wielomianu
end
end

