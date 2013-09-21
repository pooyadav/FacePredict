pred = load('data_predict_input.txt');
[m n]  = size(pred);
Q = m;
w2ih =load('w2ih.mat');
w2hj=load('w2hj.mat');

out1=struct2cell(w2ih);
wih=cell2mat(out1);

out2=struct2cell(w2hj);
whj = cell2mat(out2);
%result = result';
si = [ones(Q,1) pred(:,:)];
for k = 1 : Q
        zh = si(k,:) * wih;
        sh = [1 1./(1 + exp(-zh))];
        yj = sh * whj;
        sy = 1./(1 + exp(-yj))
        s(k,:) = sy;
end
save 'data_predict_out1.txt'  s  -ascii -tabs
im =load('data_predict_out1.txt');
% img=reshape(im,[25,25]);
% 
% imview(uint8(4000*img));
% img1=4000*img
% img = uint8(img1);
% imwrite(img,'out.bmp');

