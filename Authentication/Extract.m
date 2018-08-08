%feature extraction of the template

function e=Extract(raw_data)
%this function is applied on the data after noise reduction, but generally this function can be applied on any time series data

%(1)select the data in the middle------------------------------------------(1)select the data from the middle 
Selected_data=raw_data(length(raw_data)/4:length(raw_data)*3/4);
Extracted_data=Noise_Reduction(Selected_data); 
%use the data from [1/4 to 3/4]

%(2)find the starting point and local minmum value-------------------------(2)find the starting point by looking at local minmum value

[local_min,local_min_index]=findpeaks(-Extracted_data,'MinPeakDistance', 20);
% [20] this number must be smaller than one cycle

Unmodified_local_min=local_min;
Modified_local_min=[];
%define an empty array that is going to save the boundary of each cycle

n=length(local_min);
Threshold_value=max(local_min);
for i=1:n
    if Threshold_value<0 
        if Unmodified_local_min(1)<=0.8*Threshold_value && Unmodified_local_min(1)>1.2*Threshold_value   
            %Threshold value is defined as +/- 20% of the minmum value
            Modified_local_min(i)=Unmodified_local_min(1);
            Unmodified_local_min(1)=[];
        else 
            Unmodified_local_min(1)=[];
        end
    end
    if Threshold_value>=0 
        if Unmodified_local_min(1)>=0.8*Threshold_value && Unmodified_local_min(1)<1.2*Threshold_value
            Modified_local_min(i)=Unmodified_local_min(1);
            Unmodified_local_min(1)=[];
        else
            Unmodified_local_min(1)=[];
        end
    end
end
Modified_local_min(Modified_local_min==0)=[];  
%the above for command is used to get the boundary point index of each cycle (with 0) and saved in the Modified_local_min

%(3)separate each cycle----------------------------------------------------(3)separate each cycle

k=length(Modified_local_min);
position=[];
for i=1:k
    position(i)=find(local_min==Modified_local_min(i));
end

separated_index=local_min_index(position);
j=length(separated_index);
%separated_index is the boundary point index of each cycle without 0

%(4)use linear interpolation to calculate the average template-------------(4)normalize each cycle

first_cycle=Extracted_data(separated_index(1):separated_index(2));
for i=1:j-1
    cycle_i=Extracted_data(separated_index(i):separated_index(i+1));
    x=length(first_cycle)./length(cycle_i).*(1:1:length(cycle_i));
    y=Extracted_data(separated_index(i):separated_index(i+1));
    xi(i,:)=(1:1:length(first_cycle));
    yi(i,:)=interp1(x,y,xi(i,:));
end
%use the linear interpolation to make each cycle in the same length 
for i=1:length(first_cycle)
    yy(i)=sum(yi(:,i))./(j-1);
end
%calculate the average template of the data, this is the final data after feature extration and will be compared with the input/attacker data using DTW 
e=yy;
end