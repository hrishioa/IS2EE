    clear;
    clf;
   

    %%% Initial conditions %%%
    initX = 0;
    initV = 1;

    vNow = initV;
    xNow = initX;
    timeNow = 0;

    %%% Time handling %%%
    totalTime = 5*2*pi; %Total time to simulate
    N = 5000; % Number of simulation steps (more = more accuracy)
    delT = totalTime/N;  %Time for each time step

    %%% Arrays to store time points and associated x values %%%
    tSteps = [];
    xSteps = [];
    vSteps = [];
    
    
    %%% main "for" loop - do N steps if simulation %%%%
    for step = 1:1:N, 
        fNow = calcForce(xNow);   % calculate force at point x
        aNow = calcAccel(fNow);   % calculate acceleration at point x
        
        xNow = xNow + calcDeltaX(vNow,aNow,delT);   % update x (location)
        vNow = vNow + calcDeltaV(aNow,delT);   % update velocity
        timeNow = timeNow+delT;    % update time
        
        tSteps = [tSteps, timeNow];  % store current time for plotting
        xSteps = [xSteps, xNow];  % store current location for plotting
        vSteps = [vSteps, vNow];
        
        hold on;
        f1 = plot(xSteps, vSteps);
        drawnow;

        
    end
    
    NvSteps = gradient(xSteps)/delT;
    NaSteps = gradient(NvSteps)/delT;

    
    
    
    %%%   See what you have done here
            % plot(tSteps,xSteps);
        % quiver(xSteps,zeros(size(xSteps)), vSteps, zeros(size(vSteps)))
        % quiver(xSteps, xSteps, vSteps, vSteps);
        % drawnow;
        % pause










