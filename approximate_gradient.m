% approximate_gradient.m
% Computes numerical gradient using finite difference
function G = approximate_gradient(fun, x)
    step_size = 1e-6;
    G = zeros(length(x), 1);
    delta_x = zeros(length(x), 1);

    for n = 1:length(x)
        delta_x(n) = step_size;
        f_plus = fun(x + delta_x);
        f_minus = fun(x - delta_x);
        G(n) = (f_plus - f_minus) / (2 * step_size);
        delta_x(n) = 0;
    end
end