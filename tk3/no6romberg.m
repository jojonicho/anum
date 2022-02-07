function A = no6(k)
  dataPenduduk = [1960, 97.02; 1970, 119.21; 1980, 147.49; 1990, 179.38; 2000, 206.26; 2010, 237.63; 2020, 270.20];

  x0 = dataPenduduk(:, 1)';
  y0 = dataPenduduk(:, 2)';

  [c, v] =newtdd(x0,y0,7);
  A = romberg((@(x) nest(6, c, x, x0)), 1960, 2020, k);
endfunction