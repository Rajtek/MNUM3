function [ y ] = wielomian( x,W )
%obliczanie warto�ci wielomianu
n=length(W); %stopien 
y=W(1); % pierwszy element
for i=2:n
    y=y*x+W(i); %domna�anie kolejnych pot�g x i dodawanie wsp�czynnik�w
end
end

