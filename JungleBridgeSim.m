%initialize the system parameters
%which contains parameters describing behavior/measurements of bridge
% param_struct.r0 = [x_0;y_0]: coordinates of leftmost vertex
% param_struct.rn = [x_n;y_n]: coordinates of rightmost vertex
% param_struct.num_links: number of rubber bands in bridge
% param_struct.k_list = [k_1;...;k_n]: list of stiffnesses
% param_struct.l0_list = [l0_1;...;l0_n]: list of natural lengths
% param_struct.m_list = [m_1;...;m_(n-1)]: list of weight masses
% param_struct.g = 9.8 m/sec^2: gravitational acceleration
function JungleBridgeSim()
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
    figure()
    hold on
    plot(x_list,y_list, DisplayName='Calced')
    plot(cumsum([0,6.65,10.1,8.25,2.4,2.4]),-[0,5.1,7.2,4.2,2.8,0], DisplayName='Real')
    axis equal
    legend()
end
