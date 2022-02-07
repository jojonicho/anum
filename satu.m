function [A] = satu(n)

% creates the B vector (h^4/(E*I) * f(x) for a wood beam under its own weight
gravity = -9.81;
density = 480;
h = 2 / n;        % 2 meter board cut up into n pieces
width = 0.3;      % 30cm
thickness = 0.03; %  3cm
E = 1.3e10;
I = width * thickness^3 / 12;

A = ones(n, 1) * h^4/(E*I) * gravity*density*width*thickness;