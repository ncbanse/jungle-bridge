%initialize the system parameters
%which contains parameters describing behavior/measurements of bridge
% param_struct.r0 = [x_0;y_0]: coordinates of leftmost vertex
% param_struct.rn = [x_n;y_n]: coordinates of rightmost vertex
% param_struct.num_links: number of rubber bands in bridge
% param_struct.k_list = [k_1;...;k_n]: list of stiffnesses
% param_struct.l0_list = [l0_1;...;l0_n]: list of natural lengths
% param_struct.m_list = [m_1;...;m_(n-1)]: list of weight masses
% param_struct.g = 9.8 m/sec^2: gravitational acceleration
function RBJungleBridgeSim()
    actual_x = cumsum([0,6.65,10.1,8.25,2.4,2.4]);
    actual_y = -[0,5.1,7.2,4.2,2.8,0];
    r1 = [8.1, 8.4, 8.6, 8.9];
    r2 = [9.6, 10.2, 11, 12];
    r3 = [9.1, 9.3, 9.4, 9.6];
    r4 = [2.3, 2.5, 2.6, 2.7];
    r5 = [3.4, 3.7, 3.9, 4.4];
    
    m = [.026, .026, .025, .025];
    w = cumsum(m);
    
    f = [r1; r2; r3; r4; r5];
    
    Y = w' .* 9.8;
    k = zeros(5, 1);
    l0 = zeros(5, 1);
    for i = 1:5
        A = [f(i, :)', ones(4,1)];
        mb = (A'*A)\A'*Y;
        k(i) = mb(1);
        l0(i) = -mb(2)/mb(1);
    end
    figure(1); clf(1);
    hold on
    plot(r1, Y', 'o', DisplayName="RB #1 Measured Data")
    plot(r1, k(1, 1) .* (r1 - l0(1, 1)), '-', DisplayName="Linear Regression")
    xlabel 'RB Length (cm)'
    ylabel 'Force (N)'
    title("Force vs. Rubber band length for RB #1 and it's regression")
    legend(Location="northwest")
    hold off
    
    x = r1;
    y = Y';

    dm = .05;
    db = .5;

    m_range = linspace(k(1) - dm/2, k(1) + dm/2, 31);
    b_range = linspace(-k(1) * l0(1) - db/2, -k(1) * l0(1) + db/2, 31);
    [m_grid, b_grid] = meshgrid(m_range, b_range);

    cost_grid = zeros(size(m_grid));
    for i = 1:length(x)
        cost_grid = cost_grid + (y(i) - (m_grid * x(i) + b_grid)).^2;
    end

    figure(2); clf(2)
    hold on
    surf(m_grid, b_grid, cost_grid, DisplayName="Cost Function")
    xlabel('Slope (k)')
    ylabel('Intercept (b)')
    zlabel('Cost (SSE)')
    title('RB #1 Cost Graph')
    plot3(m_range(16), b_range(16), cost_grid(16, 16), 'r.', MarkerSize=20, DisplayName="Minimum R^2")
    legend(Location="north")
    hold off
    

    param_struct = struct();
    param_struct.r0 = [0; 0];
    param_struct.rn = [29.8; 0];
    param_struct.num_links = 5;
    param_struct.k_list = k; %stiffnesses (N/cm)
    param_struct.l0_list = l0; %natural lengths (cm)
    param_struct.m_list = m; %mass list (kg)
    param_struct.g = -9.8; %gravitational acceleration (m/s^2)
    
    %compute the predicted bridge shape
    [x_list,y_list] = generate_shape_prediction(param_struct);
    %generate a plot comparing the predicted and measured bridge shape
    figure(6); clf(6);
    hold on
    plot(x_list,y_list, DisplayName='Predicted', LineWidth=1, LineStyle='--')
    plot(actual_x, actual_y, DisplayName='Measured', LineWidth=1)
    title("Comparison Between Measured and Predicted Rubber Band Bridges")
    xlabel("Horizontal Position (cm)")
    ylabel("Vertical Position (cm)")
    axis equal
    legend()
end
