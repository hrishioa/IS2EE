    clf;
    hold on;
    
    % Plot the vector field and ODE solutions
    
    f = @(t,y) [y(2);-y(1)];
    vectfield(f,-2:.15:2,-2:.15:2);

    [tt, yy] = ode45(f,[0,10],[1;0]);
    p = plot(yy(:,1), yy(:,2), 'b-');
    set(p, 'Linewidth', 3);
    
    [tt, yy] = ode45(f,[0,10],[2;0]);
    p = plot(yy(:,1), yy(:,2), 'k-');
    set(p, 'Linewidth', 3);
    
    [tt, yy] = ode45(f,[0,10],[0.5;0]);
    p = plot(yy(:,1), yy(:,2), 'm-');
    set(p, 'Linewidth', 3);
    
    print -dpdf Oscillator.pdf
    
        
    % p1 = plot(tSteps, xSteps, 'color', 'r');
    % p2 = plot(tSteps, vSteps, 'color', 'k');
    % p3 = plot(tSteps, NvSteps, 'color', 'c');
    % p4 = plot(tSteps, -NaSteps, 'color', 'm');
    
   