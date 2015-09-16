

p1x = 1; p1y = 0; p2x = 5; p2y = 5;

function findforce = f(px,py,pc,y1val,y2val)
  fx=0;
  fy=0;
  yp1 = zeros(length(y1val),length(y2val));
  yp2 = zeros(length(y1val),length(y2val));
  
  for x=1:length(y1val)
    for y=1:length(y2val)
      for i=1:length(x)
        yp1(x,y) = pc(i)/((abs(y1val(x)-px(i)))^2);
        yp2(x,y) = pc(i)/((abs(y2val(y)-py(i)))^2);
      end
    end
  end
  
  quiver(y1val,y2val,yp1,yp2,'r');
endfunction

f([1 3 5],[1 1 1],[1 -1 1],-10:0.5:10,-10:.5:10);