function predict_login= login_start(username)

%% Start Stream Sensor
% mode 1: Generate Testing DATA
% mode 2: View the prediction Result

%username='Peng';

mode=1;
if mode ==1
    
    %Init the myo armband if first time connected
    T=15;
    sensorData=myo_stream(T);
    
    path =['LoginSet/',username];
    cd ([cd ,'/',path]);
    save(['loginRawData_',username], 'sensorData');
    cd ../..
    
    %% Remove noise
    sensorData_smooth=dataSmooth(20,sensorData);
    
    %% Find predict_central from given data
    predict_central=central_prediction(sensorData.gyro,'all');   % Use all three dimension data
    sensorData_smooth.acc=bsxfun(@minus,sensorData_smooth.acc,mean(sensorData_smooth.acc))./std(sensorData_smooth.acc);
    sensorData_smooth.gyro=bsxfun(@minus,sensorData_smooth.gyro,mean(sensorData_smooth.gyro))./std(sensorData_smooth.gyro);
    
    
    %% Process to Seperate data
    TestActions=dataSeperation(predict_central,sensorData_smooth);
    
    %plot each action
    numActions=size(TestActions,2);     %Find out how many actions are detected
    for ii=1:numActions
        subplot(1,numActions,ii);
        plot(TestActions(ii).gyro);      %plot the gyro data
    end
    
    cd ([cd ,'/',path]);
    save(['LoginSet_',username], 'TestActions');
    cd ../..
    
    predict_login=testPredic_login(username);
    
elseif mode ==2
    %View the correlation
    predict_login = testPredic_login(username);
    
end
end