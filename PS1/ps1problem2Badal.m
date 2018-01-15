% Running function
mandelbrot(1000,500)

% Function
function mandelbrot(n, niter)

% Setup region R
x0 = -0.748766713922161;
x1 = -0.748766707771757;
y0 = 0.123640844894862;
y1 = 0.123640851045266;

% Creating m x m grid
x = linspace(x0, x1, n);
y = linspace(y0, y1, n);
[X,Y] = meshgrid(x, y);
grid = X + 1i * Y;

% Setup iteration
z_grid = zeros(size(grid));
k_grid = zeros(size(grid));

% Iteration
for j = 1:niter+1
    z_grid = z_grid.^2 + grid;
    k_grid(abs(z_grid) > 2 & ...
        k_grid == 0) = niter - j;
end

% Visualization
figure;
imagesc(x, y, k_grid);
axis equal;
axis([x0, x1, y0, y1]);

end