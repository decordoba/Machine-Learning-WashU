function [w, b] = naivebayesCL(x, y)
% function [w,b]=naivebayesCL(x,y);
%
% Implementation of a Naive Bayes classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
% b : bias (scalar)
%

%% fill in code here
[pYpos, pYneg] = naivebayesPY(x, y);
[pXgivenYpos, pXgivenYneg] = naivebayesPXY(x, y);

% Naive bayes assumption: prod(P(Xi|Y)) = P(X|Y)
w = log(pXgivenYpos ./ pXgivenYneg);
b = log(pYpos / pYneg);

end