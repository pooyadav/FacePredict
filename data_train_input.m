
[I1 map] = imread('\images\poo\p98.jpg');
[I2 map] = imread('\images\poo\p2000.jpg');
[I3 map] = imread('\images\poo\p2002.jpg');
[I4 map] = imread('\images\poo\p2004.jpg');
% [I5 map] = imread('');
% [I6 map] = imread('');
% % 
% I1=rgb2gray(I1);
% I2=rgb2gray(I2);
% I3=rgb2gray(I3);
% I4=rgb2gray(I4);
% I5=rgb2gray(I5);
% I6=rgb2gray(I6);

Sx=1;
Sy=1;
U=1;
V=1;
[G,I11]= gaborfilter(I1,Sx,Sy,U,V);
[G,I12]= gaborfilter(I2,Sx,Sy,U,V);
[G,I13]= gaborfilter(I3,Sx,Sy,U,V);
[G,I14]= gaborfilter(I4,Sx,Sy,U,V);
% [G,I15]= gaborfilter(I5,Sx,Sy,U,V);
% [G,I16]= gaborfilter(I6,Sx,Sy,U,V);

% imview(I11);
% imview(I12);

R1 = resizem(I11,[45 45]);
R2 = resizem(I12,[45 45]);
R3 = resizem(I13,[45 45]);
R4 = resizem(I14,[45 45]);
% R5 = resizem(I15,[25 25]);
% R6 = resizem(I16,[25 25]);

X1 = reshape(R1,[2025 1]);
X2 = reshape(R2,[2025 1]);
X3 = reshape(R3,[2025 1]);
X4 = reshape(R4,[2025 1]);
% X5 = reshape(R5,[625 1]);
% X6 = reshape(R6,[625 1]);
% out image
[I3 map] = imread('\images\poo\p2005.jpg');
Sx=1;
Sy=1;
U=1;
V=1;
[G,I17]= gaborfilter(I3,Sx,Sy,U,V);

%I3=rgb2gray(I3);
R7 = resizem(I17,[45 45]);
X7 = reshape(R7,[2025 1]);
% [c,vec2,out,finaldata,Originaldata]= cov(X3);
% save 'data_train_dest.txt' X3 -ascii -tabs    % out image end here

P = [X1 X2 X3 X4  X7];
save 'data.txt'   P  -ascii -tabs
[finaldata, Out2, Out3] = fastica(P');
%c,vec2,out,finaldata,Originaldata]= cov(P);
[r,c] = size(finaldata);
out = finaldata(:,c);
in = removecolumn(finaldata,c);
save 'data_train_dest.txt' out -ascii -tabs 
save 'data_train_input.txt'   in   -ascii -tabs