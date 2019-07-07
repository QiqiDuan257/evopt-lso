function [y, g] = evoFG_Ellipsoid_(x)
y = evoFuncEllipsoid_(x);
g = evoGradEllipsoid_(x);
end
