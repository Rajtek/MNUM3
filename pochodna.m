function [ W2 ] = pochodna(W)
%obliczanie pochodnej wielomianu
n=length(W)-1;%d³ugoœæ nowego wielomianu
if n==0%sprawdzanie czy pochodna nie jest zerowa
W2=0;
else
W2=zeros(1,n);
for i=1:n
   W2(i)=W(i)*(n-i+1);%wyznaczanie kolejnych wsp.
end
end
end

