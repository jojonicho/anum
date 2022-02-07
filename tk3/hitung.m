1;

dataPenduduk = [1960, 97.02; 1970, 119.21; 1980, 147.49; 1990, 179.38; 2000, 206.26; 2010, 237.63; 2020, 270.20];

function A = hitung(basis, data)
  [n, m] = size(data)
  # Akan dibuat vandermonde matrix
  for i=1:n
    for j=1:n
      if(j == 1)
        A(i, j) = 1;
        base = basis(data(i));
      else
        A(i, j) = base * A(i, j - 1);
      endif
    end
  end
  cond(A)
endfunction

hitung(@(x) x,dataPenduduk)
hitung(@(x) x - 1970,dataPenduduk)
hitung(@(x) x - 2010,dataPenduduk)
hitung(@(x) (x - 2010)/30,dataPenduduk)