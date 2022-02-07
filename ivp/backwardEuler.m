function [t,yb,h] = backwardEuler(a,b,N,M,y0,f,fx)
  h   =  (b-a)/N;
  t     =  zeros(1,N);
  yb    =  zeros(1,N);
  t(1)  =  a;
  yb(1) =  y0;
    for j=1:N
    x = yb(j);
    t(j+1)=t(j)+h;
      for i=1:M
      x = x-(x-yb(j)-h*f(t(j+1),x))/(1-h*fx(t(j+1),x));
      endfor
    yb(j+1)= x;
    endfor
end