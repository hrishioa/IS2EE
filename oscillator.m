    clear;
    clf;
   

    %%% Initial conditions %%%
    initX = pi/16;
    initV =0;
    mass = 1;
    length = 1;
    dampC = 0;

    vNow = initV;
    xNow = initX;
    timeNow = 0;

    %%% Time handling %%%
    totalTime = 2*2*pi; %Total time to simulate
    N = 10000; % Number of simulation steps (more = more accuracy)
    delT = totalTime/N;  %Time for each time step

    %%% Arrays to store time points and associated x values %%%
    tSteps = [];
    xSteps = [];
    vSteps = [];
    dispSteps = [];
    pxSteps = [];
    pySteps = [];
    
    %%% main "for" loop - do N steps if simulation %%%%
    for step = 1:1:N, 
        fNow = calcForce(mass, xNow);   % calculate force at point x
        
        damping = dampC*vNow; %calculate damping
        fNow  = fNow - damping; %adjust force accordingly
        aNow = calcAccel(fNow,mass,length);   % calculate acceleration at point x
        
        xNow = xNow + calcDeltaX(vNow,aNow,delT);   % update x (location)
        vNow = vNow + calcDeltaV(aNow,delT);   % update velocity
        timeNow = timeNow+delT;    % update time
        
        tSteps = [tSteps, timeNow];  % store current time for plotting
        xSteps = [xSteps, xNow];  % store current location for plotting
        vSteps = [vSteps, vNow];
        dispNow = length*xNow;
        dispSteps = [dispSteps, dispNow];
        pxSteps = [pxSteps, length * sin(xNow)];
        pySteps = [pySteps, -(length * cos(xNow))];
      
    end
    
    figure;
    subplot(2,2,1);
    plot(xSteps,vSteps);
    title(["Phase Space (Theta over Omega): initx = " num2str(initX)]);
    
    subplot(2,2,2);
    plot(pxSteps, pySteps);
    title(["Location Plot: (x over y) initv = " num2str(initV)]);
    
    subplot(2,2,3);
    plot(vSteps, tSteps);
    title(['Omega over time: time = ' num2str(totalTime)]);
    
    subplot(2,2,4);
    plot(dispSteps, tSteps);
    title(['Theta over Time: damping = ' num2str(dampC)]);
    
    print plot6.png
    
    NvSteps = gradient(xSteps)/delT;
    NaSteps = gradient(NvSteps)/delT;
 
    %%%   See what you have done here
    %figure;
    %         plot(tSteps,xSteps);
    %     quiver(xSteps,zeros(size(xSteps)), vSteps, zeros(size(vSteps)))
    %     quiver(xSteps, xSteps, vSteps, vSteps);
    %     drawnow;
    %     pause










