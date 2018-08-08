function [ corr ] = findCorr( inputA,inputB )
% This function will calcuate the correclation between two sets of
% sensorData
sizeA=size(inputA);
sizeB=size(inputB);


idxInstance=3; % Choose the second instance


inputA(idxInstance).acc=(inputA(idxInstance).acc-mean(inputA(idxInstance).acc));
inputB(idxInstance).acc=(inputB(idxInstance).acc-mean(inputB(idxInstance).acc));

corr=corr2(inputA(idxInstance).gyro,inputB(idxInstance).gyro);


end

