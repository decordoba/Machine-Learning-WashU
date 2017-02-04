function [loss, gradient] = hinge(w, xTr, yTr, lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0). Should be a dx1 vector
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

left_side = 1 - (w'*xTr).*yTr;
loss = sum(max(0, left_side)) + lambda*(w'*w);
% We set to zero all the positions where left_side is smaller than zero
gradient = -xTr*(yTr .* (left_side > 0))' + 2*lambda*w;

end
