function g = gradient_w(eps, L, x)

    seps = sqrt(eps);
    
    if x <= -L * seps
        g = 2 * seps * (x + (L+1) * seps) - (x + (L+1) * seps)^2;
    elseif x <= -seps
        g = eps;
    elseif x <= 0
        g = -2 * seps * x - x*x;
    elseif x <= seps
        g = -2 * seps * x + x*x;
    elseif x <= L * seps
        g = -eps;
    else
        g = 2 * seps * (x - (L+1) * seps) + (x - (L+1) * seps)^2;
    end
end
