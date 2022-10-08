function [P_results, P_grad, P_hess_min, time] = gda(eps, L, n, step, x, y, eta_x, eta_y)
    
    P_results = zeros(ceil(n/step)+1,1);
    P_grad = zeros(ceil(n/step)+1,1);
    P_hess_min = zeros(ceil(n/step)+1,1);
    time = zeros(ceil(n/step)+1,1);
    %grad_x = zeros(3,1);
    %grad_y = zeros(2,1);
    total_time = 0;
    
    P_results(1) = func_w(eps, L, x(1)) + 10*x(2)^2 + 0.1 * x(3)^2;
    P_grad(1) = norm([gradient_w(eps, L, x(1)); 20*x(2); 0.2*x(3)]);
    P_hess_min(1) = min(0.05, hess_w(eps, L, x(1)));
    time(1) = 0;

    for i = 1:n
        
        tic;
        grad_x = [gradient_w(eps, L, x(1)); y(1); y(2)];
        grad_y = [(-(1/20) * y(1) + x(2)); (-5 * y(2) +x(3))];
        
        x = x - eta_x * grad_x;
        y = y + eta_y * grad_y;
        total_time = total_time + toc;
        
        if mod(i,step) == 0
            P_results(i/step+1) = func_w(eps, L, x(1)) + 10*x(2)^2 + 0.1 * x(3)^2;
            P_grad(i/step+1) = norm([gradient_w(eps, L, x(1)); 20*x(2); 0.2*x(3)]);
            P_hess_min(i/step+1) = min(0.05, hess_w(eps, L, x(1)));
            time(i/step+1) = total_time;
        end
    end

end