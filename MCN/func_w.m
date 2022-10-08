function f = func_w(eps, L, x)

    seps = sqrt(eps);
    eps32 = eps ^ 1.5;
    
    if x <= -L * seps
        f = seps * (x + (L+1) * seps)^2 - (x + (L+1) * seps)^3 / 3 - (3*L+1) * eps32 / 3;
    elseif x <= -seps
        f = eps * x + eps32 / 3;
    elseif x <= 0
        f = -seps * x * x - x^3 / 3;
    elseif x <= seps
        f = -seps * x * x + x^3 / 3;
    elseif x <= L * seps
        f = -eps * x + eps32 / 3;
    else
        f = seps * (x - (L+1) * seps)^2 + (x - (L+1) * seps)^3 / 3 - (3*L+1) * eps32 / 3;
    end

end