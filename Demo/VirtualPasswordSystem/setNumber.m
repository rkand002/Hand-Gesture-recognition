function  setNumber(userName, predictNum)
    predictNum
    path =['RegisterSet/',userName];
    cd ([cd ,'/',path]);
    save(['setNumberData_',userName], 'predictNum');
    cd ../..
end

