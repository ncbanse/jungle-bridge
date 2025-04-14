%use fmincon to predict the shape of the string bridge
%INPUTS:
%param_struct: struct containing parameters of the bridge
% param_struct.r0 = [x_0;y_0]: coordinates of leftmost vertex
% param_struct.rn = [x_n;y_n]: coordinates of rightmost vertex
% param_struct.num_links: number of links in bridge
% param_struct.l0_list = [l_1;...;l_n]: list of link lengths
% param_struct.m_list = [m_1;...;m_(n-1)]: list of weight masses
% param_struct.g = 9.8 m/sec^2: gravitational acceleration
%OUTPUTS:
%x_list = [x_0;x_1;...;x_n]: x coordinates of predicted vertex positions
%y_list = [y_0;y_1;...;y_n]: x coordinates of predicted vertex positions
function [x_list,y_list] = generate_shape_prediction_fmincon(param_struct)
    %generate an initial guess for the coordinate locations
    %coords_guess = [x_1;y_1;...;x_(n-1);y_(n-1)]
    x0 = param_struct.r0(1);
    xn = param_struct.rn(1);
    x_guess = linspace(x0,xn,param_struct.num_links+1);
    y_guess = zeros(1, param_struct.num_links+1);
    coords_i_guess = zeros(2*(param_struct.num_links-1),1);
    for n = 1:(param_struct.num_links-1)
        coords_i_guess(2*n-1,1) = x_guess(n+1);
        coords_i_guess(2*n,1) = y_guess(n+1);
    end
    %use anonymous function syntax to define the cost func
    %define cost func as the gravitational potential energy function
    %using the current values in param_struct
    f_cost = @(V_in) total_G_potential_func(V_in,param_struct);
    %use anonymous function syntax to define the constraint func
    %define cost func as the distance constraint function
    %using the current values in param_struct
    f_cstr = @(V_in) bridge_error_func(V_in,param_struct);
    %use fmincon to compute the predicted vertex locations
    coords_sol = fmincon(f_cost, coords_i_guess, [], [], [], [], -Inf, Inf, f_cstr);
    %unpack result and combine with r0 and rn from param_struct
    %to generate list of positions, x_list and y_list
    V_list = [param_struct.r0;coords_sol;param_struct.rn];
    x_list = zeros(length(V_list/2), 1);
    y_list = zeros(length(V_list/2), 1);
    for i = 1:length(V_list/2)
        x_list(i) = V_list(2 * i - 1);
        y_list(i) = V_list(2 * i);
    end
end