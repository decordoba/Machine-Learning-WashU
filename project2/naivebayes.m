function logratio = naivebayes(x, y, x1)
% function logratio = naivebayes(x,y,x1);
%
% Computation of log P(Y|X=x1) using Bayes Rule
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
% x1: input vector of d dimensions (dx1)
%
% Output:
% poscond: log conditional probability log P(Y = 1|X=x1)
% negcond: log conditional probability log P(Y = -1|X=x1)
% logratio: log(poscond / negcond)

%% fill in code here
[w, b] = naivebayesCL(x, y);

logratio = w'*x1 + b;

end