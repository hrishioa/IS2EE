    clf;
    hold on;
        % Plot the vector field and ODE solutions
    
    omega = 0.1;
    
    function xdot = f2(x,t)
      % d^2Q/dt^2 = -Q/CL  -  (R/L) * (dQ/Dt)
      C = 10;
      L = 10;
      R = 0.1;
      omega = 5;
      Vs = sin(omega*t);
      
      xdot(3) = ((0-x(2))/(C*L))-((R/L)*(x(3)));
      xdot(2) = x(3)+Vs;
      xdot(1) = x(2);
     endfunction
    
    timestep = 1000;
    tmin = 0;
    tmax = 1000;
    
    x2 = lsode("f2", [1;1;1] , (t = linspace (tmin, tmax, timestep)') ) ;

    p = plot(x2(:,1),x2(:,2), 'b-');
    %p = plot(linspace(tmin,timestep,tmax),driver);
    %p = plot(linspace(tmin,tmax,timestep),x2(:,1), 'b-');
    %set(p, 'LineWidth', 3);
    % print growthFunction3.png       