function [ y ] = df_zad2( x )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
Wsp=[-4 -6 10 2];
y=Wsp(1);
for i=2:4
    y=y*x+Wsp(i);
end

end

