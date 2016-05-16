A=zeros(100000:2);
A(:,1)=linspace(-5,10,100000);
for i=1:100000
   %A(i,2)=funkcja_zad1(A(i,1));
   A(i,2)=funkcja_poch_zad1(A(i,1));
end
plot(A(:,1),A(:,2))