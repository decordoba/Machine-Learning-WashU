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

[d, n] = size(x);

%% fill in code here
[pYpos, pYneg] = naivebayesPY(x, y);
[pXgivenYpos, pXgivenYneg] = naivebayesPXY(x, y);

% Technically, we have to divide each by pX, but when doing logratio,
% both p(X) would cancel, so we don't need to calculate them
pYposgivenX = pXgivenYpos * pYpos;
pYneggivenX = pXgivenYneg * pYneg;

% size(pYposgivenX / pYneggivenX)

logratio = log(prod(pYposgivenX ./ pYneggivenX));

end