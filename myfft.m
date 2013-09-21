
function [out] = myfft(z1,z2,shape,shape2)
if ((nargin==3)&&(isa(shape,'char'))) 
    if strcmp(shape,'same')
        z1x=size(z1,1);
        z1y=size(z1,2);
        z2x=size(z2,1);
        z2y=size(z2,2);
        
        if any(any(imag(z1)))||any(any(imag(z2)))
            out=(ifft2(fft2(z1,z1x+z2x-1,z1y+z2y-1).*fft2(z2,z1x+z2x-1,z1y+z2y-1)));
        else
            out=real(ifft2(fft2(z1,z1x+z2x-1,z1y+z2y-1).*fft2(z2,z1x+z2x-1,z1y+z2y-1)));
        end
        
        
        px=((z2x-1)+mod((z2x-1),2))/2;
        py=((z2y-1)+mod((z2y-1),2))/2;
        
        out=out(px+1:px+z1x,py+1:py+z1y);
        return;
    end
end