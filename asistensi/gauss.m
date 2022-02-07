## Copyright (C) 2021 mamad
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} gauss (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mamad <mamad@DESKTOP-FE0TDIR>
## Created: 2021-04-10

function x = gauss (A, b)

[row,col] = size(A);
n = row;
x = zeros(size(b));
A=[A b];
for k = 1:n-1   
  for i = k+1:n
     m = A(i,k) / A(k,k);
     A(i, :) = A(i, :) - m * A(k, :);
  end
  
b = A(:,end);
x(n,1) = b(n)/A(n,n);
  for i=n-1:-1:1
    x(i,1) = (b(i) - A(i,i+1:n)*x(i+1:n,1))/A(i,i);
  end
end

endfunction
