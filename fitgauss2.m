function err = fitgauss2(lambda,t,y,handle)
%   Fitting functions for a Gaussian band spectrum.
%  T. C. O'Haver, 2006   Updated to Matlab 6, March 2006
global c
A = zeros(length(t),round(length(lambda)/2));
for j = 1:length(lambda)/2,
    A(:,j) = gaussian(t,lambda(2*j-1),lambda(2*j))';
end
c = A\y';
z = A*c;
err = norm(z-y');