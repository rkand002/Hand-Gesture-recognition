function e=Extract_TD(raw_data)
%% this function is applied on the feature extraction of the trainning data

%plot the raw data

figure(1)

plot(1:1:length(raw_data),raw_data)

%% (1)select the data in the middle and noise reduction

Selected_data=raw_data(length(raw_data)/4:length(raw_data)*3/4);
Extracted_data=smooth(Selected_data,7);

figure(2)
plot(1:1:length(Extracted_data),Extracted_data,'linewidth',2)

%use the data from [1/4 to 3/4]

%% (2)find the starting point and local minmum value

[local_min,local_min_index]=findpeaks(-Extracted_data,'MinPeakDistance', 5);

figure(3)
findpeaks(-Extracted_data,'MinPeakDistance', 5)

slope=[];

%slope lower than defaul_slope will be considered as idle period
for i=1:length(local_min)-1
    slope(i)=abs((local_min(i+1)-local_min(i))./(local_min_index(i+1)-local_min_index(i)));
end

for i=1:length(slope)
        if slope(i)< tan(atan(max(slope))*0.1)
           %slope lower than defaul_slope will be considered as idle period
           slope(i)=0;
        end
end

slope_index=find(slope); %the slope index of the local min

j=1;

cycle_index=struct('index',[]);

for i=1:length(slope_index)-1
    if (slope_index(i+1)-slope_index(i))>1
        n=1;
            for k=1:j
                n=n+length(cycle_index(k).index);
            end
        cycle_index(j).index=slope_index(n:i);
        j=j+1;
        cycle_index(j).index=[];
    end
end

%% (3)separate each cycle

figure(4)
%get the index of each boundary potin
for i=1:length(cycle_index)-1
    cycle=Extracted_data(local_min_index(cycle_index(i).index(1)):local_min_index(cycle_index(i).index(end)+1));
    max_cycle(i)=length(cycle);
    plot(1:1:length(cycle),cycle);
    hold on
end

figure(5)
for i=1:length(cycle_index)-1
    cycle=Extracted_data(local_min_index(cycle_index(i).index(1)):local_min_index(cycle_index(i).index(end)+1));
    if length(cycle)<max(max_cycle)*0.7
        cycle=[];
    end
    plot(1:1:length(cycle),cycle);
    hold on
end


%use the linear interpolation to make each cycle in the same length 
first_cycle=Extracted_data(local_min_index(cycle_index(i).index(1)):local_min_index(cycle_index(i).index(end)+1));
for i=1:j-1
    cycle_i=Extracted_data(local_min_index(cycle_index(i).index(1)):local_min_index(cycle_index(i).index(end)+1));
    x=length(first_cycle)./length(cycle_i).*(1:1:length(cycle_i));
    y=Extracted_data(local_min_index(cycle_index(i).index(1)):local_min_index(cycle_index(i).index(end)+1));
    xi(i,:)=(1:1:length(first_cycle));
    yi(i,:)=interp1(x,y,xi(i,:));
end

%calculate the average template of the data, this is the final data after feature extration and will be compared with the input/attacker data using DTW 
for i=1:length(first_cycle)
    yy(i)=sum(yi(:,i))./(j-1);
end

figure(6)
plot(1:1:length(yy),yy)

e=yy;
end