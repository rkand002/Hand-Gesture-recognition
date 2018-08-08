function [predit_Central]= central_prediction(sensorData_full,mode )
%    sensorData=lowpass_gyo_y
if mode == 'x'
    sensorData=sensorData_full(:,1);
elseif mode == 'y'
    sensorData=sensorData_full(:,2);
elseif mode =='z'
    sensorData=sensorData_full(:,3);
elseif mode =='all'
    sensorData=sensorData_full;
end



%% Calcuate power of each window
WindowStep=5;
WindowSize=100;
numData=size(sensorData,1);
cnt=1;
for i=1:WindowStep:numData-WindowSize
    WindowData(cnt,:,:)=sensorData(i+1:i+WindowSize,:);
    cnt=cnt+1;
end

WindowSum=sum(sum(abs(WindowData),2),3);
WindowSum_Filtered = dataSmooth(20,WindowSum);

%WindowSum=sum(pow2(WindowData'),2);


[pks,locs] = findpeaks(WindowSum_Filtered);
predit_Central=locs*5+10;


end