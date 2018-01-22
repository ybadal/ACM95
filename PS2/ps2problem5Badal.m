function [X, Y] = ps2problem5Badal(x, y)

% Throwing out an error message if input
% corresponds to complex number on the
% branch cut of f(z)

if (x == 0) && (abs(y) > 1)
    error(strcat('Error! z = (%f, %f) belongs ',...
        'to the branch cut (-i(inf), -i]U[i, i(inf))'),...
        x, y)
end

% Using expression derived (see problem set)
% to calculate X and Y (Re[F(z) and Im[F[z]
% respectively).

denom = x.^2 + (1 + y).^2;
numer1 = 1 - x.^2 - y.^2;
numer2 = 2.*x;

repart = numer1./denom;
impart = numer2./denom;

absol = sqrt(repart.^2 + impart.^2);
argum = atan2(impart, repart) + 2*pi;

pow = (1./2).*log(absol);
X = exp(pow).*cos((1./2).*argum);
Y = exp(pow).*sin((1./2).*argum);

end