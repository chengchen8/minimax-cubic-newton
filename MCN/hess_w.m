function h = hess_w(eps, L, x)

    seps = sqrt(eps);
    
    if x <= -L * seps
        h = 2 * seps - 2 * (x + (L+1) * seps);
    elseif x <= -seps
        h = 0;
    elseif x <= 0
        h = -2 * seps - 2*x;
    elseif x <= seps
        h = -2 * seps + 2*x;
    elseif x <= L * seps
        h = 0;
    else
        h = 2 * seps + 2 * (x - (L+1) * seps);
    end
end