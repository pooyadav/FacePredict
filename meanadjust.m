% This takes a set of data, and subtracts
% the column mean from each column.
function [meanadjusted] = meanadjust(Data)
% Data = Data';
inputsize = size(Data);
numcols = inputsize(2);
means = mean(Data,1);
save 'mean.mat' means -tabs 
tmpmeanadjusted = Data(:,1) - means(:,1);
for var = 2:numcols
tmpmeanadjusted(:,var) = Data(:,var) - means(:,var);
end,
meanadjusted = tmpmeanadjusted;