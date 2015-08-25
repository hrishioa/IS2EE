function F = calcForce(x)
    % Take current x coordinate and return force acting on mass
    K = 1; % K is the spring constant
    F = (-1)*K*sign(x)*abs(x);
end