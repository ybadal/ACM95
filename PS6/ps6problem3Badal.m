% Initializing ode45 parameters
tspan = [1, 2];

F = @(t, Y) [Y(2); (2./(t.^2)).*Y(1) + 3 - 1./(t.^2)];

Y0 = [3; 0];

% Solving numerically
[t, Y] = ode45(F, tspan, Y0);
y = Y(:,1);

% Exact solution
yExact = @(t) (1./2) + ((t.^2)./2) + ...
    (t.^2).*log(t) + (2./t);

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
legend('Log[Absolute Error]', 'Location',...
    'southeast')
title('Absolute error of Approximation')
pbaspect([1 1 1])