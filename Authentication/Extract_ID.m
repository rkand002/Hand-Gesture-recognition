function e=Extract_ID(raw_data)
%% this function is applied on the feature extraction of the trainning data

%plot the raw data

figure(1)

plot(1:1:length(raw_data),raw_data)

%% (1)select the data in the middle and noise reduction

Selected_data=raw_data(length(raw_data)/20:length(raw_data)*9/10);
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

input_numbers=struct('num',[]);

figure(5)
for i=1:length(cycle_index)-1
    cycle=Extracted_data(local_min_index(cycle_index(i).index(1)):local_min_index(cycle_index(i).index(end)+1));
    length(cycle);
    if length(cycle)<max(max_cycle)*0.5;
        cycle=[];
    end
    input_numbers(i).num=cycle;
    e=input_numbers(i).num;
    plot(1:1:length(e),e);
    hold on
end

