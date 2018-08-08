function [corrMatrix]=trainAcc(username)

% This code will used to test the trainning accuracy
% PENG JIANG

%user_id=1;
%users={'Peng'};
path =['/TrainingDataSet/',char(username)];
cd ([cd path]);

dinfo = dir('TrainData_*.mat'); % find number of actions
numTrainData=size(dinfo,1);

for idx=1:numTrainData

    load(['TrainData_',num2str(idx-1),'.mat']);
    AllTrainingNumber(idx).data= TrainingActions;
end

cd ..\..\


for ii=1:numTrainData
    for jj=1:numTrainData
       Corr(ii,jj)=corrFunction(AllTrainingNumber(ii).data,AllTrainingNumber(jj).data,1);
    end
end

maxIdx=find(Corr==max(Corr));
CorrResult=zeros(numTrainData,numTrainData);
CorrResult(maxIdx)=1;

CorrResult=CorrResult'

end