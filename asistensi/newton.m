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
## @deftypefn {} {@var{retval} =} newton (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: mamad <mamad@DESKTOP-FE0TDIR>
## Created: 2021-04-10

function x0 = newton (x0)
  i = 0;
  tol = 1;
  while i<=2000 && tol > 10^-4
    f = F(x0);
    j = J(x0);
    d = j \ (-f);
    tol = norm(d)
    x = x0 + d';
    x0 = x;
    i = i+1
  endwhile


endfunction
