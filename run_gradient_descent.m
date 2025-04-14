%save in file named 'run_gradient_descent.m'
%this function runs gradient descent to find the local minimum
%of an input function given some initial guess
%INPUTS:
%fun: the function we want to optimize
%V0: the initial guess for gradient descent
%params: a struct defining the optimization parameters
%params.beta: threshold for choosing alpha (step size scaling)
% via backtracking line-search
%params.gamma: growth/decay multiplier for backtracking line-search
%params.max_iter: maximum number of iterations for gradient descent
%params.min_gradient: termination condition for gradient descent
% If ||grad(f)||<min_gradient, terminate program
%OUTPUTS:
%Vopt: The guess for the local minimum of V0
function Vopt = run_gradient_descent(fun,V0,params, param_struct)
    %unpack params
    beta = params.beta;
    gamma = params.gamma;
    max_iter = params.max_iter;
    min_gradient = params.min_gradient;
    %set initial values for alpha, V, and n
    alpha = 1; V = V0; n = 0;
    %evaluate gradient and function for first time
    G = approximate_gradient(fun,V);
    F = fun(V);

    figure(5); clf(5);
    hold on
    %iterate until either gradient is sufficiently small
    %or we hit the max iteration limit
    while n<max_iter && norm(G)>min_gradient
        %plot the current iteration of V
        V_list = [param_struct.r0;V;param_struct.rn];
        x_list = V_list(1:2:(end-1));
        y_list = V_list(2:2:end);
        plot(x_list, y_list);

        %compute the scare of the norm of the gradient
        NG2 = norm(G)^2;
        %run line search algorithm to find alpha
        while fun(V-alpha*G)<F-beta*alpha*NG2
            alpha = alpha/gamma;
        end
        while fun(V-alpha*G)>F-beta*alpha*NG2
            alpha = alpha*gamma;
        end
        %once alpha has been found, update guess
        V = V-alpha*G;
        %evaluate gradient and function at new value of V
        G = approximate_gradient(fun,V);
        F = fun(V);
        %increment our iteration counter
        n = n+1;
    end
    %plot the final iteration of V
    V_list = [param_struct.r0;V;param_struct.rn];
    x_list = V_list(1:2:(end-1));
    y_list = V_list(2:2:end);
    plot(x_list, y_list);
    title("Progression of Gradient Descent")
    xlabel("Horizontal Position (cm)")
    ylabel("Vertical Position (cm)")
    axis equal

    %return final value of V as our numerical solution
    Vopt = V;
end