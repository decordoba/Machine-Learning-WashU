function [pos, neg] = naivebayesPY(x, y)
% function [pos,neg] = naivebayesPY(x,y);
%
% Computation of P(Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% pos: probability p(y=1)
% neg: probability p(y=-1)
%

% add one all-ones positive and negative example
[d, ~] = size(x);
x = [x ones(d, 2)];
y = [y -1 1];

[~, n] = size(x);

%% fill in code here
% P(Y = +1) = num 1's / num samples
pos = sum(y == 1) / n;
% P(Y = -1) = 1 - P(Y = +1) *Only valid if y can only be {-1, 1}
neg = 1 - pos;

end