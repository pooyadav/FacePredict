Out=load('out.txt');
des = load('data_predict_out1.txt');
final= Out' * des;
me = load('mean.mat');
out1=struct2cell(me);
 me =cell2mat(out1);
 me = me';
 final = final + me;
  final = reshape(final,[45,45]);
  imview(uint8(final));
  img = uint8(final);
 imwrite(img,'out1.bmp');



