% Initializing ode45 parameters
tspan_1 = [1, 0.2];
tspan_2 = [1, 2];

y0 = 1./3;

f = @(t,y) (-2./t).*y + t - 1 + (1./t);

% Solving numerically
[t1, y1] = ode45(f, tspan_1, y0);
[t2, y2] = ode45(f, tspan_2, y0);
t = [flipud(t1);t2];
y = [flipud(y1);y2];

% Exact solution
yExact = @(t) (1./4).*t.^2 - (1./3).*t + (1./2) -...
    (1./(12.*t.^2));

% Error of approximation
error = abs(yExact(t) - y);

% Plots
figure
subplot(1,2,1)
plot(t,yExact(t), 'r-o'); hold on;
plot(t,y,'b-x');
legend('Exact', 'Numerical', 'Location',...
    'southeast')
title('Exact and Numerical Solutions')
pbaspect([1 1 1])

subplot(1,2,2)
semilogy(t, error)
legend('Absolute Error', 'Location',...
    'southeast')
title('Absolute error of Approximation')
pbaspect([1 1 1])