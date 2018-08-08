function [predict]=  getNumber(userName)
    getFilepath =['/RegisterSet/',char(userName)];
    cd ([cd getFilepath]);
    load(['setNumberData_',char(userName),'.mat']);
    cd ..\..\
    predict = predictNum;
end