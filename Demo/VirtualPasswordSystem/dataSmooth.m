function [sensorData_smooth]= dataSmooth(windowSize,sensorRawData)
%Summary of this function goes here
%Detailed explanation goes here


if size(sensorRawData,1)==size(sensorRawData,2)==1
    acc=sensorRawData.acc;
    gyro=sensorRawData.gyro;
    emg=sensorRawData.emg;
    
    acc_smooth=dataSmooth(windowSize,acc);
    gyro_smooth=dataSmooth(windowSize,gyro);
    emg_smooth=emg;
    
    sensorData_smooth.acc=acc_smooth;
    sensorData_smooth.gyro=gyro_smooth;
    sensorData_smooth.emg=emg_smooth;
    sensorData_smooth.timeStamp=sensorRawData.timeStamp;
else
    b = (1/windowSize)*ones(1,windowSize);
a = 1;
%  Find the moving average of the data and plot it against the original data.
numDimension=size(sensorRawData,2);

for ii=1:numDimension
    sensorData_smooth(:,ii)=filter(b,a,sensorRawData(:,ii));
end
end

end

