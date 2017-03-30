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

%% Evaluate all parameter settings
size_data = size(xTr, 2);
allvalerrs = zeros(length(Cs), length(paras));
for i = 1:length(Cs)
    for j = 1:length(paras)
        for s = 1:10
            start_split = floor((s-1)*size_data/10);
            end_split = floor(s*size_data/10);

            xTv = xTr(:, start_split+1:end_split);
            yTv = yTr(:, start_split+1:end_split);
            xTr_ = xTr(:, [1:start_split, end_split+1:size_data]);
            yTr_ = yTr(:, [1:start_split, end_split+1:size_data]);

            svmclassify = trainsvm(xTr_, yTr_, Cs(i), ktype, paras(j));
            allvalerrs(i,j) = allvalerrs(i,j) + sum(sign(svmclassify(xTv))~=yTv(:))/length(yTv);
        end;
    end;
end;

%% Identify best setting
[bestval_tmp, idx] = min(allvalerrs);
[bestval, idx_paras] = min(bestval_tmp);
idx_Cs = idx(idx_paras);
bestC = Cs(idx_Cs);
bestP = paras(idx_paras);

end