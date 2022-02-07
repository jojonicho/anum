function IVPrk2(x, y, target, h)
  nStep  = (target - x) / h - 1;
  for i=0:nStep
    k1 = f(x, y)
    x = x + h;
    k2 = f(x, y + h*k1) # f(x+=h, y+ h*k1)
    y = y + h * (k1/2 + k2/2);
    printf("y_%d : y(%d) : %f\n", i+1, x, y);
  endfor
endfunction

function ytilde = f(x,y)
  ytilde = 1 / (x*y);
endfunction