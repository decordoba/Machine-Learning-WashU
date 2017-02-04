function [loss, gradient] = logistic(w, xTr, yTr, lambda)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0). Should be a dx1 vector
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

if nargin < 4, lambda = 0; end;

expWXY = exp(-(w'*xTr).*yTr);
loss = sum(log(1 + expWXY)) + lambda*(w'*w);
gradient = -xTr*(yTr.*expWXY./(1 + expWXY))' + 2*lambda*w;

end