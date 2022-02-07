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
## @deftypefn {} {@var{retval} =} J (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mamad <mamad@DESKTOP-FE0TDIR>
## Created: 2021-04-10

function retval = J (x0)
  x = x0(1);
  y = x0(2);
  z = x0(3);
  retval(1, 1) = cos(x);
  retval(2, 1) = 3;
  retval(3, 1) = 2*x;
  retval(1, 2) = 2*y;
  retval(2, 2) = log(2)*2^y;
  retval(3, 2) = 2*y;
  retval(1, 3) = 1/(log(10)*z);
  retval(2, 3) = -3*z^2;
  retval(3, 3) = 3*z^2;
endfunction
