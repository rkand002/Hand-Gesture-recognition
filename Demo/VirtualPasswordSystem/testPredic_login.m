function [corrMatrix]=testPredic(trainusername)

% This code will used to test the trainning accuracy
% PENG JIANG

%user_id=1;
%users={'Peng'};
trainusername='Peng';
trainingFilepath =['/TrainingDataSet/',char(trainusername)];
cd ([cd trainingFilepath]);

dinfo = dir('TrainData_*.mat'); % find number of actions
numTrainData=size(dinfo,1);

for idx=1:numTrainData
    
    load(['TrainData_',num2str(idx-1),'.mat']);
    AllTrainingNumber(idx).data= TrainingActions;
end

cd ..\..\

% Testing file READ
testuser='Peng';
testFilepath =['/LoginSet/',char(testuser)];
cd ([cd testFilepath]);

load(['LoginSet_',char(testuser),'.mat']);

cd ..\..\

numTestInstance=size(TestActions,2);

for ii=1:numTestInstance
    CorrResult(ii)=corrFunction(AllTrainingNumber,TestActions(ii),2);
end

PredictNumber=CorrResult-1

corrMatrix = PredictNumber
end