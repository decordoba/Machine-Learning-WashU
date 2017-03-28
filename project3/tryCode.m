close all;
load spiral;
[bestC,bestP,bestval,allerrs]=crossvalidate(xTr,yTr,'rbf',2.^[-1:8],2.^[-2:3]);
[xx,yy]=meshgrid(-2:3,-1:8);
surf(xx,yy,allerrs);
xlabel('\gamma'); ylabel('C'); zlabel('Val Error');
svmclassify=trainsvm(xTr,yTr,bestC,'rbf',bestP);
testerr=sum(sign(svmclassify(xTe))~=yTe(:))/length(yTe)
figure;
visdecision(xTe,yTe,svmclassify,'vismargin',true);