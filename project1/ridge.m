function [loss, gradient] = ridge(w, xTr, yTr, lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0). Should be a dx1 vector
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

tmp = w'*xTr - yTr;
loss = tmp*tmp' + lambda*(w'*w);
gradient = 2*xTr*tmp' + 2*lambda*w;

end