function [ y ] = ddf_zad2( x )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
Wsp=[-12 -12 10];
y=Wsp(1);
for i=2:3
    y=y*x+Wsp(i);
end

end

