%computes the distance constraint error for a pair of vertices
%INPUTS:
%(xA, yA): coordinates of first vertex
%(xB, yB): coordinates of second vertex
%l_max: maximum allowable distance between two vertices
%OUTPUTS:
%e_len: constraint error.
% e_len<=0 when constraint is satisfied
% e_len>0 when constraint is violated
function e_len = single_string_error_func(xA,yA,xB,yB,l_max)
    l_current = sqrt((xA - xB)^2 + (yA - yB)^2);
    e_len = l_current - l_max;
end