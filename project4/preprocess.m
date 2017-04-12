function [xTr, xTe, u, m] = preprocess(xTr, xTe)
% function [xTr,xTe,u,m]=preprocess(xTr,xTe);
%
% Preproces the data to make the training features have zero-mean and
% standard-deviation 1
%
% output:
% xTr - pre-processed training data (dxn)
% xTe - pre-processed testing data (dxn')
% 
% u,m - any other data should be pre-processed by x-> u*(x-m)
%


close all
% calculate mean
m = mean(xTr, 2);

% calculate inverse of standard deviation
xTr = xTr - m * ones(1, size(xTr, 2));
% u = diag(1 ./ sqrt(mean(xTr.*xTr, 2)));
u = diag(1 ./ std(xTr, 0, 2)); % for some reason this gives weird results

% calculate xTr and xTe
xTr = u * xTr;
xTe = u * (xTe - m * ones(1, size(xTe, 2)));
end







