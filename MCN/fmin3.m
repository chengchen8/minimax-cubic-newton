% Find the minimum of f(x) = a*x + (1/2)*b*x^2 + (1/3)*c*abs(x)^3
% The solution satisfies (b+lambda)*x = -a where lambda = c*abs(x)

function x = fmin3(a,b,c)
    
    %% initialize
    lambda = 100;
    f = a*a/(b+lambda)^2 - lambda*lambda/c^2;
    while f >=0
        lambda = lambda * 2;
        f = a*a/(b+lambda)^2 - lambda*lambda/c^2;
    end
    
    %% binary search
    first = 0;
    last = lambda;
    for i = 1:30
        mid = (first + last) / 2;
        f = a*a/(b+mid)^2 - mid*mid/c^2;
        
        if f > 0
            first = mid;
        else
            last = mid;
        end
    end
    x = -a / (b+first);

end