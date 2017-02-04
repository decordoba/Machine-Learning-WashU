function [preds] = linearmodel(w, xTe)
% function w=linearmodel(w,yTr)
%
% INPUT:
% w weight vector (default w=0)
% xTe dxn matrix (each column is an input vector)
%
% OUTPUTS:
% 
% preds predictions
% 

preds = w'*xTe;

end

