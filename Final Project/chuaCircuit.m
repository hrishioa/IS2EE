    clf;
    hold on;
      
    %----------Chua.m----------
  function out = chua(in,t)

    x = in(1);
    y = in(2);
    z = in(3);

    alpha  = 15.6;
    beta   = 28; 
    m0     = -1.143;
    m1     = -0.714;

    h = m1*x+0.5*(m0-m1)*(abs(x+1)-abs(x-1));

    xdot = alpha*(y-x-h);
    ydot = x - y+ z;
    zdot  = -beta*y;

    out = [xdot ydot zdot];
    endfunction
    
    timestep = 100000;
    tmin = 0;
    tmax = 1000;
    
    x2 = lsode("chua", [0.7;0;0] , (t = linspace (tmin, tmax, timestep)) ) ;
    
    driver = 5*sin(omega*(linspace(tmin,tmax,timestep)));

    p = plot(x2(:,1),x2(:,2), 'b-');
    %p = plot(linspace(tmin,tmax,timestep),driver);
    %p = plot(linspace(tmin,tmax,timestep),x2(:,1), 'b-');
    %set(p, 'LineWidth', 3);
    % print growthFunction3.png       