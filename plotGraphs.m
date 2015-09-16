    clf;
    hold on;
    
    % Plot the vector field and ODE solutions
    
    function xdot = f(x,t)
      % x(1) is x, x(2) x
      k = 1;
      g = 9.81;
      xdot(2) = g - (k*(x(2)^2));
      xdot(1) = x(2);
    endfunction
    
    x = lsode("f", [0;sqrt(9.81)], (t = linspace(0,10,1000)'));
    
    %vectfield("f",0:1:10,-10:1:10);
    
    %p = plot(x(:,1),x(:,2), 'b-');
    p = plot(linspace(0,10,1000),x(:,1));
    set(p, 'LineWidth', 3);
    
    print b_x.png
    
    % print -dpdf Oscillator.pdf    
   