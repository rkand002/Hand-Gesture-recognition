%This code is used to generate feature matrix for each user
%Feature matrix intergate the sensor data collected from
%accelerometer ||  gyrocope


clear;
clc;
close all;
for user_id=2
    
    
    users={'Yash','Rohila'};
    
    features=[];
    for dig=1:3
        % 1 means circle
        % 2 means Square
        % 3 means Triangle
        path =[char(users(user_id)),'/',num2str(dig-1)];
        
        %path=sprintf('%d/%d',char(users(user_id)), dig-1);
        cd ([cd ,'/',path])
        dinfo = dir('*.csv');
        acc=(csvread(dinfo(1).name,1,1));
        gyo=(csvread(dinfo(3).name,1,1));
        orientation=csvread(dinfo(4).name,1,1);
        orientationEuler=csvread(dinfo(5).name,1,1);
        
        label=(dig-1)*ones(size(acc,1),1);
        tmp_aggregate=[acc gyo orientation orientationEuler label];
        features=[features; tmp_aggregate];
        
        cd ../..
        
        %% Applied Moving average filter
        windowSize = 20;
        b = (1/windowSize)*ones(1,windowSize);
        a = 1;
        %  Find the moving average of the data and plot it against the original data.
        
        lowpass_gyo_x = filter(b,a,gyo(:,1));
        lowpass_gyo_y = filter(b,a,gyo(:,2));
        lowpass_gyo_z = filter(b,a,gyo(:,3));
        lowpass_acc_x = filter(b,a,acc(:,1));
        lowpass_acc_y = filter(b,a,acc(:,2));
        lowpass_acc_z = filter(b,a,acc(:,3));
        
        %% Data plot

        figure;
        subplot(2,2,1);
        plot(gyo(:,1),'r');
        hold on;
        plot(gyo(:,2),'b');
        hold on;
        plot(gyo(:,3),'g');
        legend('x axis','y axis','z axis');
        title(['Gyo Sensor Data for number: ',num2str(dig-1),' [User: ', char(users(user_id)),']']);
        
        subplot(2,2,3);
        plot(acc(:,1),'r');
        hold on;
        plot(acc(:,2),'b');
        hold on;
        plot(acc(:,3),'g');
        legend('x axis','y axis','z axis');
        title(['Acc Sensor Data for number: ',num2str(dig-1),' [User: ', char(users(user_id)),']']);
        
         subplot(2,2,2);
        plot(lowpass_gyo_x,'r');
        hold on;
        plot(lowpass_gyo_y,'b');
        hold on;
        plot(lowpass_gyo_z,'g');
        legend('x axis','y axis','z axis');
        title(['Filtered Gyo Sensor Data for number: ',num2str(dig-1),' [User: ', char(users(user_id)),']']);
        
         subplot(2,2,4);
        plot(lowpass_acc_x,'r');
        hold on;
        plot(lowpass_acc_y,'b');
        hold on;
        plot(lowpass_acc_z,'g');
        legend('x axis','y axis','z axis');
        title(['Filtered Acc Sensor Data for number: ',num2str(dig-1),' [User: ', char(users(user_id)),']']);
        
      
      
    end
        save(char(users(user_id)), 'features');
    
    
    
end



% Plot Gyo

