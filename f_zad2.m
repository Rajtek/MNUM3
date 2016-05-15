function [ y ] = f_zad2( x )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
Wsp=[-1 -2 5 2 1];
y=Wsp(1);
for i=2:5
    y=y*x+Wsp(i);
end
end

