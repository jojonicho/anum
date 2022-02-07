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
## @deftypefn {} {@var{retval} =} F (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mamad <mamad@DESKTOP-FE0TDIR>
## Created: 2021-04-10

function retval2 = F (x0)
  x = x0(1);
  y = x0(2);
  z = x0(3);
  retval(1) = sin(x) + y^2 + log10(z) -3;
  retval(2) = 3*x + 2^y - z^3;
  retval(3) = x^2 + y^2 + z^3 -6;
  retval2 = retval'
endfunction
