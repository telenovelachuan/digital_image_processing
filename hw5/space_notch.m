%footBall=imread('noiseball.png');
footBall=imread('space.tif');
imshow(footBall);

%Determine good padding for Fourier transform
PQ = paddedsize(size(footBall));

% Calculate the discrete Fourier transform of the image
F=fft2(double(footBall),PQ(1),PQ(2));

%Create Notch filters corresponding to extra peaks in the Fourier transform
xs = linspace(-500,500,21);
ys = linspace(-500,500,21);
FS_football = F;
for idx = 1:numel(xs)
    for idy = 1:numel(ys)
        x = xs(idx);
        y = ys(idy);
        if x == 0 && y == 0
            continue
        end
        H = notch('btw', PQ(1), PQ(2), 15, x, y);
        FS_football = FS_football.*H;
    end
end


% Apply the notch filters to the Fourier spectrum of the image
%FS_football = F.*H1.*H2.*H3.*H4.*H5.*H6;
%FS_football = F.*H1.*H2.*H3.*H4.*H5.*H6;

% convert the result to the spacial domain.
F_football=real(ifft2(FS_football)); 

% Crop the image to undo padding
F_football=F_football(1:size(footBall,1), 1:size(footBall,2));

%Display the blurred image
figure, imshow(F_football,[])

% Display the Fourier Spectrum 
% Move the origin of the transform to the center of the frequency rectangle.
Fc=fftshift(F);
Fcf=fftshift(FS_football);

% use abs to compute the magnitude and use log to brighten display
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S1,[])
figure, imshow(S2,[])

