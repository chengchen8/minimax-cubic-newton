function [P_results, P_grad, P_hess_min, time] = cubic_newton(eps, L, x, y, n, K, M, eta, theta)

    
    s = zeros(3,1);

    P_results = zeros(n+1,1);
    P_grad = zeros(n+1,1);
    P_hess_min = zeros(n+1,1);
    time = zeros(n+1,1);
    total_time = 0;
    P_results(1) = func_w(eps, L, x(1)) + 10*x(2)^2 + 0.1 * x(3)^2;
    P_grad(1) = norm([gradient_w(eps, L, x(1)); 20*x(2); 0.2*x(3)]);
    P_hess_min(1) = min(0.05, hess_w(eps, L, x(1)));

    for i = 1:n
        tic;
        y = agd(K, eta, theta, x, y);
        s(1) = fmin3(gradient_w(eps, L, x(1)),hess_w(eps, L, x(1)), M/2);
        s(2) = fmin3(y(1),20, M/2);
        s(3) = fmin3(y(2),0.2,M/2);
        x = x + s;
        
        total_time = total_time + toc;
        
        P_results(i+1) = func_w(eps, L, x(1)) + 10*x(2)^2 + 0.1 * x(3)^2;
        P_grad(i+1) = norm([gradient_w(eps, L, x(1)); 20*x(2); 0.2*x(3)]);
        P_hess_min(i+1) = min(0.05, hess_w(eps, L, x(1)));
        time(i+1) = total_time;
    end

end