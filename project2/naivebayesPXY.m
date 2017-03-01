function [posprob, negprob] = naivebayesPXY(x, y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d, ~] = size(x);
x = [x ones(d, 2)];
y = [y -1 1];

%% fill in code here
% P(X | Y = +1) = average x for Y = 1
posprob = x * (y == 1)';
posprob = posprob / sum(posprob);

% P(X | Y = -1) = average x for Y = -1
negprob = x * (y == -1)';
negprob = negprob / sum(negprob);

end