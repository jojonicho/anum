function IVPEuler(x, y, target, h, theta)
  nStep  = (target - x) / h - 1;
  
  #y_n+1 = y_n + h * ( (1-theta) * f(x,y) + theta * f(x+h, y_n+1) )
  # f(x+h, y_n+1) = x+h - y_n+1
  for i=0:nStep
##    y = y + h * f(x+h,y);
##    x = x + h;
    y = nextY(x, y, h, theta);
    x = nextX(x, h);
    printf("y_%d : y(%d) : %f\n", i+1, x, y);
  endfor
endfunction

function ytilde = f(x, y)
  ytilde = x - y;
endfunction

function x = nextX(x, h)
  x = x + h;
endfunction

function y = nextY(x, y, h, theta)
  y = (y + h*(1-theta)*(x-y) + h*theta*(nextX(x, h))) / (1 + h*theta);
endfunction

#function ytilde = f(x,y)
#  ytilde = (1 - 2*x*y)/x^2;
#endfunction