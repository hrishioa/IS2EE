function delX = calcDeltaX(vNow,aNow,delT)
    % Take acceleration and deltaT and return change in x
    delX = vNow*delT + (aNow*(delT^2));
end