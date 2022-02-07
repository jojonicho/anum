# based on soal uas 2020
function IVPEulerSteps(x, y, nStep, h)
  for i=0:nStep
    x = x + h;
    y = y + h * f(x*y);
    #t_next = f(x,y);
    #printf("x_%d : f(%d) : %f\n", i+1, x, t_next(1));
    #printf("y_%d : f(%d) : %f\n", i+1, y, t_next(2));
    printf("y_%d : y(%d) : %f\n", i+1, x, y);
  endfor
endfunction

function ytilde = f(x, y)
  ytilde = x - y;
endfunction

#function ytilde = f(x,y)
#  ytilde = (1 - 2*x*y)/x^2;
#endfunction