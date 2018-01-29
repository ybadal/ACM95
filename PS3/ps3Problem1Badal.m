% We parameterize the semicircle by
% C = {Re^(it) | t in [-pi/2, pi/2]}

% We calculate the integral
fun = @(r, t) (r.*exp(1i.*t) + log(r.*...
    exp(1i.*t)))*(1i.*r.*exp(1i.*t))./...
    ((r.*exp(1i.*t)).^3 + 1);

% Limits of integration
t1 = -pi./2;
t2 = pi./2;

% Calculating the integral
beta = @(r) abs(integral(@(t) fun(r,t), t1, t2,...
    'ArrayValued', true));

% Applying beta function to range array
r_array = 2:0.1:30;
beta_array = arrayfun(beta, r_array);

% Calculating alpha
alpha = @(r) pi.*(r.^2 + r.*(log(r)) + r.*(pi./2))...
    ./(r.^3 - 1);

% Applying alpha function to range array
alpha_array = arrayfun(alpha, r_array);

% Plotting the integral and the bound
plot(r_array, beta_array, r_array,...
    alpha_array)
xlabel('R')
title('Plot of \alpha (R) and \beta (R) against R')
legend('\beta (x) = |I(R)|', '\alpha (R) = ML Bound')
pbaspect([1 1 1])