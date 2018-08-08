function [Actions]= dataSeperation(predict_central,sensorData)

numActions=size(predict_central,1);
cutOffWindow=75;

for ii=1:numActions

    Actions(ii).centralIndex=predict_central(ii); % relative data point
    Actions(ii).startPoint=predict_central(ii)-cutOffWindow;
	Actions(ii).endPoint=predict_central(ii)+cutOffWindow;
    
    
    Actions(ii).centralTime=sensorData.timeStamp(predict_central(ii));
    Actions(ii).startTime=sensorData.timeStamp( Actions(ii).startPoint);
    Actions(ii).endTime=sensorData.timeStamp(Actions(ii).endPoint);

    Actions(ii).gyro=sensorData.gyro(Actions(ii).startPoint:Actions(ii).endPoint,:);
    Actions(ii).acc=sensorData.acc(Actions(ii).startPoint:Actions(ii).endPoint,:);
 %   Actions(ii).emg=sensorData.acc(startPoint:endPoint,:);

    
end

end