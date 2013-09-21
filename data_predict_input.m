[I1 map] = imread('\images\poo\p98.jpg');
[I2 map] = imread('\images\poo\p2000.jpg');
[I3 map] = imread('\images\poo\p2002.jpg');
[I4 map] = imread('\images\poo\p2004.jpg');


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

R2 = resizem(I12,[45 45]);
R3 = resizem(I13,[45 45]);
R4 = resizem(I14,[45 45]);
% R5 = resizem(I15,[50 50]);
% R6 = resizem(I16,[50 50]);
R1 = resizem(I11,[45 45]);

X2 = reshape(R2,[2025 1]);
X3 = reshape(R3,[2025 1]);
X4 = reshape(R4,[2025 1]);
% X5 = reshape(R5,[2500 1]);
% X6 = reshape(R6,[2500 1]);
X1 = reshape(R1,[2025 1]);

P = [X1 X2 X3 X4 ];
[c,vec2,out,finaldata,Originaldata]= cov(P);
save 'data_predict_input.txt' finaldata -ascii -tabs

