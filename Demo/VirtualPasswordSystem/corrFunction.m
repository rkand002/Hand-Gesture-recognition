function [ corr ] = corrFunction( StreamA, StreamB, mode )
% This function will calcuate the correclation between two sets of
% data stream

%For mode 1 "train" -> "TRAINING Correlation"
%Steam A and Steam B represent different numbers
%Result output the correlation matrix between numbers

%For mode 2 "test" -> "TESTING Correlation"
%Stream A represent the training data for a specfic number

%Stream B just represents actions need to identified

if mode== 1
    
    numTrainInstanceA=size(StreamA,2);
    numInstanceB=size(StreamB,2);
    
    for jj=1:numInstanceB
        for idxTrainNumber=1:numTrainInstanceA % read each digit in trainfile
            
            tmp_corr(jj,idxTrainNumber)=corr2(StreamA(idxTrainNumber).gyro,StreamB(jj).gyro);
            
        end
    end
    corr=mean2(tmp_corr);
    
else
    
    numTrainNumber=size(StreamA,2);
    
    for idxTrainNumber=1:numTrainNumber % Compare with each number
        
        numTrainInstance=size(StreamA(idxTrainNumber).data,2);
        
        for idxTrainInstance=1:numTrainInstance
            
            tmp_corr(idxTrainNumber,idxTrainInstance)=corr2(StreamA(idxTrainNumber).data(idxTrainInstance).gyro,StreamB.gyro);
        end
        corrMatrix=mean(tmp_corr');
    end
    corr=find(corrMatrix==max(corrMatrix));
end

end

