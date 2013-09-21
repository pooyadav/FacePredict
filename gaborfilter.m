
function [G,Y1] = gaborfilter(I,Sx,Sy,U,V);

if isa(I,'double')~=1 
    I = double(I);
    size(I)
end

for x = -fix(Sx):fix(Sx)
    for y = -fix(Sy):fix(Sy)
        G(fix(Sx)+x+1,fix(Sy)+y+1) = (1/(2*pi*Sx*Sy))*exp(-.5*((x/Sx)^2+(y/Sy)^2)+2*pi*i*(U*x+V*y));
    end
end
G1=imag(G);
G2=real(G)
R = I(:,:,1);
% Gr = I(:,:,2);
% B =I(:,:,3);

% I1=0.2990*I(:,:,1) + 0.5870*I(:,:,2) +0.1140*I(:,:,3);
ImgaboutR = myfft(R,G1,'same');
% ImgaboutGr = myfft(Gr,G1,'same');
% ImgaboutB = myfft(B,G1,'same');

RegaboutR = myfft(R,G2,'same');
% RegaboutGr =myfft(Gr,G2,'same');
% RegaboutB = myfft(B,G2,'same');

% Imgabout = myfft(I1,G1,'same');
% Regabout = myfft(I1,G2,'same');
% %figure,imshow(uint8(I1));

% gabout = uint8(sqrt(Imgabout.*Imgabout + Regabout.*Regabout));
% gaboutR = uint8(sqrt(ImgaboutR.*ImgaboutR + RegaboutR.*RegaboutR));
% gaboutGr = uint8(sqrt(ImgaboutGr.*ImgaboutGr + RegaboutGr.*RegaboutGr));
% gaboutB = uint8(sqrt(ImgaboutB.*ImgaboutB + RegaboutB.*RegaboutB));
% outRGB(:,:,1)=gaboutR;
% outRGB(:,:,2)=gaboutGr;
% outRGB(:,:,3)=gaboutB;


outRGB(:,:,1)= uint8(sqrt(RegaboutR.*RegaboutR));
% outRGB(:,:,2)= uint8(sqrt(RegaboutGr.*RegaboutGr));
% outRGB(:,:,3)= uint8(sqrt(RegaboutB.*RegaboutB));
%figure, imshow(outRGB);
outR = outRGB(:,:,1);
% outG = outRGB(:,:,2);
% outB = outRGB(:,:,3);


% outRGB1(:,:,1)= uint8(sqrt(outR.*outR));
% outRGB1(:,:,2)= uint8(sqrt(outGr.*outGr));
% outRGB1(:,:,3)= uint8(sqrt(outB.*IoutB));
% figure, imshow(outRGB1);


%figure,Imshow(outR);
Y1(:,:,1)= dyaddown(outR,1,'m');
% Y1(:,:,2) = dyaddown(outG,1,'m');
% Y1(:,:,3) = dyaddown(outB,1,'m');
%   figure,imview(Y1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Image reconstruction

% R1 = Y1(:,:,1);
% Gr1 =Y1(:,:,2);
% B1 = Y1(:,:,3);
%                                                     % Y2(:,:,1)= dyadup(R1,0,'m');
                                                    % Y2(:,:,2) = dyadup(Gr1,0,'m');
                                                    % Y2(:,:,3) = dyadup(B1,0,'m');


% Y2(:,:,1)= imresize(R1,2);
% Y2(:,:,2) = imresize(Gr1,2);
% Y2(:,:,3) = imresize(B1,2);


                                                    % G3 = qmf(G2)


% R11 = Y2(:,:,1);
% Gr11 = Y2(:,:,2);
% B11 = Y2(:,:,3);
% 

                                                    % Image reconstruction
                                                    % 
                                                    % R11 = imresize(R1,2);
                                                    % 
                                                    % Gr11  = imresize(Gr1,2);
                                                    % B11  = imresize(B1,2);
                                                    % 

                                                    %  figure,imshow(Y2);


                                                    % ImgaboutR1 = myfft(R11,G1,'same');
                                                    % ImgaboutGr1= myfft(Gr11,G1,'same');
                                                    % ImgaboutB1 = myfft(B11,G1,'same');
                                                    % 
%  RegaboutR1 = myfft(double(R11),G2,'same');
%  RegaboutGr1 = myfft(double(Gr11),G2,'same');
%  RegaboutB1 = myfft(double(B11),G2,'same');
%  
%  
% outRGB1(:,:,1)= uint8(sqrt(RegaboutR1.*RegaboutR1));
% outRGB1(:,:,2)= uint8(sqrt(RegaboutGr1.*RegaboutGr1));
% outRGB1(:,:,3)= uint8(sqrt(RegaboutB1.*RegaboutB1));
% figure,imview(outRGB1);
% size(outRGB1);

% 
% % Imgabout = myfft(I1,G1,'same');
% % Regabout = myfft(I1,G2,'same');
% %gabout = uint8(sqrt(Imgabout.*Imgabout + Regabout.*Regabout));
% gaboutR1 = uint8(sqrt(ImgaboutR1.*ImgaboutR1 + RegaboutR1.*RegaboutR1));
% gaboutGr1 = uint8(sqrt(ImgaboutGr1.*ImgaboutGr1 + RegaboutGr1.*RegaboutGr1));
% gaboutB1 = uint8(sqrt(ImgaboutB1.*ImgaboutB1 + RegaboutB1.*RegaboutB1));
% outRGB1(:,:,1)=gaboutR1;
% outRGB1(:,:,2)=gaboutGr1;
% outRGB1(:,:,3)=gaboutB1;
% figure,imshow(outRGB1);
