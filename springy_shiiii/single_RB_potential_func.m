%compute the potential energy of a SINGLE rubber band
%INPUTS
%(xA,yA): coordinates of left end of rubber band
%(xB,yB): coordinates of right end of rubber band
%k: stiffness of rubber band
%l0: natural length of rubber band
%OUTPUTS:
%U_RB_i: potential energy of rubber band
function U_RB_i = single_RB_potential_func(xA,yA,xB,yB,k,l0)
    %compute stretched length of rubber band
    l = sqrt((xA - xB)^2 + (yA - yB)^2);
    %compute potential energy (remember to use max function!)
    U_RB_i = .5 * k * (max(l - l0, 0))^2;
end