function [ y ] = wielomian( x,W )
%obliczanie wartoœci wielomianu
n=length(W); %stopien 
y=W(1); % pierwszy element
for i=2:n
    y=y*x+W(i); %domna¿anie kolejnych potêg x i dodawanie wspó³czynników
end
end

