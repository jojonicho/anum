function s = asimpson(f,a,b,e)
  
s=0;
y=[a,b];
z=1;
k=0;

while length(y)>1
  n = length(y);
  for i=1:n/2
    a1=y(2*i-1);
    b1=y(2*i);
    m=(a1+b1)/2;
    left=(m-a1)/6*(f(a1)+4*f((m+a1)/2)+f(m));
    right=(b1-m)/6*(f(m)+4*f((m+b1)/2)+f(b1));
    whole=(b1-a1)/6*(f(a1)+4*f(m)+f(b1));
    
    delta=left+right-whole;
    #printf("%d %d %d %d\n", left, right, whole, delta);
    
    #printf("%d ? %d\n", abs(delta), 15*e);
    printf("left:%f right:%f whole:%f\n", left, right, whole);
    if abs(delta)<=15*e
      printf("tambahkan %f", left+right+delta/15);
      s=s+left+right+delta/15;
    else
        k=k+1;
        if k==1
            z=[a1,m,m,b1];
        else
            z=[z,a1,m,m,b1];
        endif             
    endif
  endfor
  y=z;    
  z=0;
  k=0;
end

endfunction