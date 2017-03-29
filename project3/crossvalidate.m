function [bestC, bestP, bestval, allvalerrs] = crossvalidate(xTr, yTr, ktype, Cs, paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
%
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%

%% Split off validation data set
train_rate = 0.1;  % 90% training, 10% cross-validation
size_data = size(xTr, 2);
size_train = floor(size_data * train_rate);

xTv = xTr(:, size_train+1:end);
yTv = yTr(:, size_train+1:end);
xTr = xTr(:, 1:size_train);
yTr = yTr(:, 1:size_train);

%% Evaluate all parameter settings
allvalerrs = zeros(length(Cs), length(paras));
for i = 1:length(Cs)
    for j = 1:length(paras)
        svmclassify = trainsvm(xTr, yTr, Cs(i), ktype, paras(j));
        allvalerrs(i,j) = sum(sign(svmclassify(xTv))~=yTv(:))/length(yTv);
    end;
end;

%% Identify best setting
[bestval_tmp, idx] = min(allvalerrs);
[bestval, idx_paras] = min(bestval_tmp);
idx_Cs = idx(idx_paras);
bestC = Cs(idx_Cs);
bestP = paras(idx_paras);

end