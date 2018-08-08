% This is main function
clear
close all

%% Start Stream Sensor
% mode 1 is streaming live data
% mode 2 is view the correlation matrix for the testing data
mode=1;
if mode ==1
    
    %Init the myo armband if first time connected
    %myo_init();
    T=20;
    str = input('Enter the training number:','s');
    sensorData=myo_stream(T);
    
    path ='TrainingDataSet/Peng';
    cd ([cd ,'/',path]);
    save(['sensorRawData_',str], 'sensorData');
    cd ../..

    %% Remove noise
    sensorData_smooth=dataSmooth(20,sensorData);
    
    
    %% Find predict_central from given data
    predict_central=central_prediction(sensorData.gyro,'all');   % Use all three dimension data
    
    sensorData_smooth.acc=bsxfun(@minus,sensorData_smooth.acc,mean(sensorData_smooth.acc))./std(sensorData_smooth.acc);
    sensorData_smooth.gyro=bsxfun(@minus,sensorData_smooth.gyro,mean(sensorData_smooth.gyro))./std(sensorData_smooth.gyro);
    
    
    %% Process to Seperate data
    TrainingActions=dataSeperation(predict_central,sensorData_smooth);
    
    %plot each action
    numActions=size(TrainingActions,2);     %Find out how many actions are detected
    for ii=1:numActions
        subplot(1,numActions,ii);
        plot(TrainingActions(ii).gyro);      %plot the gyro data
    end
    
    cd ([cd ,'/',path]);
    save(['TrainData_',str], 'TrainingActions');
    cd ../..
elseif mode ==2
    %View the correlation
    trainAcc('Peng');
end