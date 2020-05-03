pattern=imread('pattern.tif');
imshow(pattern)

%Determine good padding for Fourier transform
PQ = paddedsize(size(pattern));

% Calculate the discrete Fourier transform of the image
F=fft2(double(pattern),PQ(1),PQ(2));

% Display the Fourier Spectrum 
% Move the origin of the transform to the center of the frequency rectangle.
Fc=fftshift(F);

% use abs to compute the magnitude and use log to brighten display
S1=log(1+abs(Fc)); 
figure, imshow(S1,[])
