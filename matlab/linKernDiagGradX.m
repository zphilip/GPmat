function gX = linKernDiagGradX(kern, x)

% LINKERNDIAGGRADX Gradient of linear kernel's diagonal with respect to a point x.

% IVM

gX = 2*x*kern.variance;
