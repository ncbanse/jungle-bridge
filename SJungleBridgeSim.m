%initialize the system parameters
%which contains parameters describing behavior/measurements of bridge
% param_struct.r0 = [x_0;y_0]: coordinates of leftmost vertex
% param_struct.rn = [x_n;y_n]: coordinates of rightmost vertex
% param_struct.num_links: number of rubber bands in bridge
% param_struct.l0_list = [l0_1;...;l0_n]: list of natural lengths
% param_struct.m_list = [m_1;...;m_(n-1)]: list of weight masses
% param_struct.g = 9.8 m/sec^2: gravitational acceleration
function SJungleBridgeSim()
    actual_x = cumsum([0,10.5,15.25,13,24.6,15.6]);
    actual_y = -[0,15.933,27.833,30.133,17.783,0];
    l0 = zeros(1, 5);
    for i = 1:length(l0)
        l0(i) = sqrt((actual_x(i + 1) - actual_x(i))^2 + (actual_y(i + 1) - actual_y(i))^2);
    end
    m = [.025, .025, .026, .026];
    param_struct = struct();
    param_struct.r0 = [0; 0];
    param_struct.rn = [actual_x(end); 0];
    param_struct.num_links = 5;
    param_struct.l0_list = l0; %natural lengths (cm)
    param_struct.m_list = m; %mass list (kg)
    param_struct.g = -9.8; %gravitational acceleration (m/s^2)
    
    %compute the predicted bridge shape using constrained optimization
    [x_list_constrained,y_list_constrained] = generate_shape_prediction_fmincon(param_struct);
    %compute the predicted bridge shape using unconstrained optimization
    %[x_list_unconstrained,y_list_unconstrained] = generate_shape_prediction_GD(param_struct);
    %generate a plot comparing the predicted and measured bridge shape
    figure(1); clf(1);
    hold on
    plot(x_list_constrained,y_list_constrained, DisplayName='Prediction', LineWidth=1, LineStyle='--')
    %plot(x_list_unconstrained,y_list_unconstrained, DisplayName='GD Prediction', LineWidth=1, LineStyle='--')
    plot(actual_x, actual_y, DisplayName='Measured', LineWidth=1)
    title("Comparison Between Measured and Predicted String Bridges")
    xlabel("Horizontal Position (cm)")
    ylabel("Vertical Position (cm)")
    axis equal
    legend()
end
