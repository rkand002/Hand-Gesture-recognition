function [ B ] = covert2Alfa( A )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for ii = 1:size(A,2)
    if A(ii)==0
        B(ii)='A'
    elseif A(ii)==1
        B(ii)='C'
    elseif A(ii)==2
        B(ii)='Z' 
    end
end

end

