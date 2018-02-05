% Generating 10^4 approximately uniformly
% distributed points around 0 and within
% the radius of convergence R = 1

z = randomDisk(0, 1, 10.^4);

% We use the absolute value of the
% difference between the function f and its
% truncated power series g to quantify the
% quality of approximation  of f given by g

d = abs((1 + z).^1i - (1 + 1i.*z - (1+1i).*(z.^2)./2));

% We visualize the discrepancy using scatter

scatter(real(z), imag(z), [], d, 'filled')
pbaspect([1 1 1])
colorbar
grid on