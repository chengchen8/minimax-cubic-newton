function y = agd(K, eta, theta, x, y)

    ty = y;
    
    for i = 1:K
        grad_ty = [(-(1/20) * ty(1) + x(2)); (-5 * ty(2) + x(3))];
        old_y = y;
        y = ty + eta * grad_ty;
        ty = (1+theta) * y - theta * old_y;
    end

end