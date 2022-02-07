function no5()
%Program 3.6 Cubic spline plot
%Computes and plots spline from data points
%Input: x,y vectors of data points, number k of plotted points
%   per segment
%Output: x1, y1 spline values at plotted points
#function [x1,y1]=splineplot(x,y,k)

dataPenduduk = [1960, 97.02; 1970, 119.21; 1980, 147.49; 1990, 179.38; 2000, 206.26; 2010, 237.63; 2020, 270.20];

x = dataPenduduk(:, 1)';
y = dataPenduduk(:, 2)';
k = 10;

n=length(x);
coeff=splinecoeff(x,y);
x1=[]; y1=[];
for i=1:n-1
    xs=linspace(x(i),x(i+1),k+1);
    dx=xs-x(i);
    ys=coeff(i,3)*dx; % evaluate using nested multiplication
    ys=(ys+coeff(i,2)).*dx;
    ys=(ys+coeff(i,1)).*dx+y(i);
    x1=[x1; xs(1:k)']; y1=[y1;ys(1:k)'];
end
x1=[x1; x(end)];y1=[y1;y(end)];
plot(x,y,'o',x1,y1)
  
endfunction