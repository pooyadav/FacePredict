[I3 map] = imread('E:\MATLAB7\work\poonam\s\2006.jpg');
Sx=1;
Sy=1;
U=1;
V=1;
[G,I13]= gaborfilter(I3,Sx,Sy,U,V);

%I3=rgb2gray(I3);
R3 = resizem(I13,[25 25]);
X3 = reshape(R3,[625 1]);
% [c,vec2,out,finaldata,Originaldata]= cov(X3);
save 'data_train_dest.txt' X3 -ascii -tabs