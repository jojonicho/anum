function [coeff] = Spline(x, y)
  coeff = SplineCoef(x, y);
endfunction
  
function coeff = SplineCoef(x, y)
  n = length(x);
  v1 = 0;
  vn = 0;
  
  [A r] = CreateBandedMatrix(x, y, n);
  
  coeff = zeros(n, 3);
  coeff(:, 2) = A \ r;
  
  [dx, dy] = GetDelta(x, y, n);
  
  for i = 1:n-1
    coeff(i, 3) = (coeff(i+1, 2) - coeff(i, 2))/(3*dx(i));
    coeff(i, 1) = dy(i)/dx(i) - dx(i)*(2*coeff(i, 2) + coeff(i+1, 2))/3;
  end
endfunction

% Function to create banded matrix for cubic spline
% Input: set of points x, y, and the size n
% Output: The banded matrix
function [A, r] = CreateBandedMatrix(x, y, n)
  [deltaX, deltaY] = GetDelta(x, y, n);
  A = zeros(n, n);
  r = zeros(n, 1);
  
  for i = 2 : n-1
    A(i, i-1:i+1) = [deltaX(i - 1), 2*(deltaX(i-1) + deltaX(i)), deltaX(i)];
    r(i) = 3*(deltaY(i)/deltaX(i) - deltaY(i-1)/deltaX(i-1));
  end
  A(1, 1) = 1; A(n, n) = 1;
endfunction

% Function to get deltaX and deltaY
% Input: set of points x, y, and the size n
% Output: deltaX and deltaY
function [deltaX, deltaY] = GetDelta(x, y, n)
  deltaX = []; deltaY = [];
  for i = 1 : n - 1
    deltaX(i) = x(i + 1) - x(i);
    deltaY(i) = y(i + 1) - y(i);
  end
endfunction