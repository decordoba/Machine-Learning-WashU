[x, y] = genTrainFeatures();
[w, b] = naivebayesCL(x, y);
preds = classifyLinear(x, w, b);
train_err = sum(preds~=y) / length(y)

cv_err = zeros(1, 10);
for c = 1:10
    % shuffle data into random order
    ii = randperm(length(y));
    x = x(:,ii);
    y = y(ii);

    % perform 10-fold cross-validation
    test_err = zeros(1, 10);
    for i = 1:10
        cut0 = length(y)*(i-1)/10 + 1;
        cut1 = length(y)*i/10;
        x_cv = x(:, cut0:cut1);
        y_cv = y(:, cut0:cut1);
        x_train = x(:, [1:cut0-1, cut1+1:end]);
        y_train = y(:, [1:cut0-1, cut1+1:end]);
        [w, b] = naivebayesCL(x_train, y_train);
        preds = classifyLinear(x_cv, w, b);
        test_err(i) = sum(preds~=y_cv) / length(y_cv);
    end
    cv_err(c) = mean(test_err);
end
cv_err = mean(cv_err)

whoareyou(w, b);