function IVPbackwardEuler(x, y, target, h)
  nStep = (target - x) / h - 1;
  %
  for i=0:nStep
    x = x + h;
    y = (y * x^2 + h) / (x^2 + 2*x*h);
    printf("y_%d : y(%d) : %f\n", i+1, x, y);
  endfor
endfunction