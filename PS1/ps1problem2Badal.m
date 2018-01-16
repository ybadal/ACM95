% Setup region R for part 2
x0 = -2;
x1 = 1;
y0 = -1.5;
y1 = 1.5;

% Running function for part 1
mandelbrot(x0, x1, y0, y1, 1000,500)

% Setup region R for part 2
x0_2 = -0.748766713922161;
x1_2 = -0.748766707771757;
y0_2 = 0.123640844894862;
y1_2 = 0.123640851045266;

% Running function for part 2
mandelbrot(x0_2, x1_2, y0_2, y1_2, 1000,500)

% Function
function mandelbrot(x0, x1, y0, y1, n, niter)

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