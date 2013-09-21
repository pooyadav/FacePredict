% This removes a specified column from a matrix
% A = the matrix
% n = the column number you wish to remove
function [columnremoved] = removecolumn(A,n)
inputsize = size(A);
numcols = inputsize(2);
temp = A(:,1:(n-1));
for var = 1:(numcols - n)
temp(:,(n+var)-1) = A(:,(n+var));
end,
columnremoved = temp;
