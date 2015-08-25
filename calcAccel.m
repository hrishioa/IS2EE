function aNow = calcAccel(F)
    % Take force and mass and return acceleration based Newtons second law
    mass = 1;  % mass of oscillator    
    aNow = F/mass;
end