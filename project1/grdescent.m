function [w] = grdescent(func, w0, stepsize, maxiter, tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5, tolerance = 1e-02; end;

w = w0;
[prev_loss, gradient] = func(w0);
for i = 1:maxiter
    % Calculate new_w after moving in the gradient's direction
    new_w = w - stepsize * gradient;
    [loss, gradient] = func(new_w);
    
    % Multiply the stepsize by 1.01 if the loss decreases from prev_loss
    if loss < prev_loss
        stepsize = stepsize * 1.01;
        % We only update w if the loss decreases
        w = new_w;
        % Set current loss to previous loss
        prev_loss = loss;
    % Multiply the stepsize by 0.5 if the loss increases from prev_loss
    else
        stepsize = stepsize * 0.5;
    end
    % Terminate if norm of gradient is smaller than tolerance
    if norm(gradient) < tolerance
        break
    end
end

end