function trainspamfilter(xTr,yTr)
%function trainspamfilter(xTr,yTr);
% INPUT:	
% xTr
% yTr
%
% NO OUTPUT

% Pick model to test here!
%model = 'ridge';
model = 'hinge';
%model = 'logistic';

if strcmp(model, 'ridge') == 0
    f = @(w) ridge(w, xTr, yTr, 0.1);
elseif strcmp(model, 'hinge') == 0
    f = @(w) hinge(w, xTr, yTr, 0.1);
else
    f = @(w) logistic(w, xTr, yTr);
end
    
w0 = zeros(size(xTr, 1), 1); % initialize with all-zeros vector
w = grdescent(f, w0, 1e-03, 5000);

save('w0','w');

end