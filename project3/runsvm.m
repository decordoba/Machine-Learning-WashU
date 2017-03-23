load spiral;
svmclassify = trainsvm(xTr, yTr, 6, 'rbf', 0.25);
