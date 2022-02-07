function S = simpson(f, a, b, N)
  if(mod(N, 2) == 1)
    printf("N must be an even integer.\n");
    return;
  endif
  
  dx = (b-a) / N;
  x = linspace(a, b, N+1);
  y = f(x);
  S = dx / 3 * sum( y(1 : 2 : N) + 4 * y(2: 2 : N+1) + y(3: 2 : N+1) );
  
  # err = I - S <= (b-a)^5 * K_4 / (180 * N^4)
endfunction