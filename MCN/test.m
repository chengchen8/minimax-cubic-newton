clear;
clc;

eps = 0.01;
L = 5;

%x = ones(3,1) * 0.001; % initial point x_1
x = [1,0,0]';   % initial point x_2
y = zeros(2,1);

eta_x = 0.01;
eta_y = 0.1;

n = 500;
step = 5;

[P_gda,P_grad_gda,P_hessmin_gda,time_gda] = gda(eps, L, n, step, x, y, eta_x, eta_y);
oracle_gda = 2*(0:step:n);


n = 21;
K = 8;
M = 10;

eta = 0.1;
theta = 0.9;

[P_cubic,P_grad_cubic,P_hessmin_cubic,time_cubic] = cubic_newton(eps, L, x, y, n, K, M, eta, theta);
oracle_cubic = (K+3)*(0:n);



figure;
semilogy(time_cubic, P_cubic+2/375,'b-*');
hold on;
semilogy(time_gda, P_gda+2/375,'g-o');

figure;
semilogy(time_cubic, P_grad_cubic,'b-*');
hold on;
semilogy(time_gda, P_grad_gda,'g-o');

figure;
plot(time_cubic, P_hessmin_cubic,'b-*');
hold on;
plot(time_gda, P_hessmin_gda,'g-o');

%save('syn_result_2','P_gda','P_cubic','time_gda','time_cubic','P_grad_gda','P_grad_cubic','P_hessmin_gda','P_hessmin_cubic');




