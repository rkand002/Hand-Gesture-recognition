function [sensorData]=myo_stream(T)
% This funtion will initialize the arm band and start streaming the sensor
% data
countMyos=1;
mm = MyoMex(countMyos);

%global m1;
m1 = mm.myoData(1);

%% Start Streaming to log

m1.isStreaming
disp('Start Streaming ');
m1.startStreaming();
pause(T);
disp('Stop Streaming ');
m1.stopStreaming();


%global sensorData_gyro
sensorData.gyro=m1.gyro_log;
%global sensorData_acc
sensorData.acc=m1.accel_log;
%global sensorData_timeStamp
sensorData.timeStamp=m1.timeIMU_log;

sensorData.emg=m1.emg_log;


mm.delete;
clear mm
end

