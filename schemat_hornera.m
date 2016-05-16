function [ W2 ] = schemat_hornera( W,a)
%dzielenie wielomianu przez (x-a)
n=length(W)-1;
W2(1)=W(1);%pierwszy wsp. bez zmian
for i=2:n
    W2(i)=W(i)+W2(i-1)*a;%kolejne wsp. wielomianu
end

end

