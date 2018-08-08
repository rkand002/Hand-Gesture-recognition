%noise reduction function

function r=Noise_Reduction(raw_data)
%the only input value is the data measured by the armband

Window_Size=5; %define a window size for using moving average method
Cofficient=[1,1,1,1,1]/5; %define the cofficient of each weight

r=filter(Cofficient,1,raw_data);
end