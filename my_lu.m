function [L, U] = my_lu(A)

[n, n] = size(A);

% initialize lower triangle matrix
L = eye(n);

for i=1:n-1
  for j=i+1:n

    L(j, i) = A(j,i)/A(i,i);

    % Eliminasi baris i+1 .. n
    A(j,:) = A(j,:) - L(j, i) * A(i,:);
  endfor
endfor

U = A;

endfunction