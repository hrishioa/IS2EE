function delX = calcDeltaX(vNow,aNow,delT)
    % Take acceleration and deltaT and return change in x
    delX = vNow*delT + 0.5*aNow*(delT^2);
end