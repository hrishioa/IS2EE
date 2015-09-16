function aNow = calcAccel(F, mass, length)
    % Take force and mass and return acceleration based Newtons second law    
    aNow = F/(mass*length);
end