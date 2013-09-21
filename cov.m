
% c= covariance matrix
% vec2 = egein value with vectors
%out=principle vectors choosed
%final data PCdata
%Originaldata

function [c,vec2,Out,finaldata,Originaldata]= cov1(x)   
% Get the size of the array
x = x';
sizex=size(x);
disp(sizex);
% Get the mean of each row
meanx = mean (x, 1);
save ' mean.mat' meanx  -tabs
% For each pair of variables, x1, x2, calculate
% sum ((x1 - meanx1)(x2-meanx2))/(m-1)
for var = 1: 1 :sizex(2),
x1 = x(:,var);
mx1 = meanx (var);
for ct = var:1:sizex (2),
x2 = x(:,ct);
mx2 = meanx (ct);
tem = x1 - mx1 ;
% tem = tem';
if isequal(sizex(1),1) sizex(1) = sizex(1)+1;
end
v = sum(tem .* (x2 - mx2))./(sizex(1) - 1);
v1 = size(v);
cv(var,ct) = v;
cv(ct,var) = v;
% do the lower part of c also.
end,
end,
c = cv;
[V,D] = eig(c);
val = diag(D);
val1 = val';
vec1 = [ val1 ;V];
vec2 = vec1;
sizv1 = size(vec1);
npc = sizv1(2);
for pc = 1 : npc
column = highestvalcolumn(vec1);
out(:,pc) = vec1(:,column);
vec1 = removecolumn(vec1,column);
end,

Out = out';
Out = removecolumn(Out,1);
DataAdjust = meanadjust(x);
RowdataAdjust = DataAdjust';
sizer = size(RowdataAdjust);
finaldata = Out * RowdataAdjust;
finaldata = finaldata';
[finaldata, Out2, Out3] = fastica(finaldata);
save 'out.txt' Out -ascii -tabs
Originaldata= Out'* finaldata ;

