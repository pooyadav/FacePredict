
% This finds the column number that has the
% highest value in it’s first row.
function [column] = highestvalcolumn(A)
inputsize = size(A);
numcols = inputsize(2);
maxval = A(1,1);
maxcol = 1;
for var = 2:numcols
if A(1,var) > maxval
maxval = A(1,var);
maxcol = var;
end,
end,
column = maxcol