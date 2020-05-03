space=imread('space.tif');
imshow(space);

%Determine good padding for Fourier transform
PQ = paddedsize(size(space));

% Calculate the discrete Fourier transform of the image
F=fft2(double(space),PQ(1),PQ(2));

%Create Notch filters corresponding to extra peaks in the Fourier transform
xs = linspace(-500,500,21);
ys = linspace(-500,500,21);
result = F;
for idx = 1:numel(xs)
    for idy = 1:numel(ys)
        x = xs(idx);
        y = ys(idy);
        if x == 0 && y == 0
            continue
        end
        H = notch('btw', PQ(1), PQ(2), 15, x, y);
        result = result.*H;
    end
end


% Apply the notch filters to the Fourier spectrum of the image
%FS_football = F.*H1.*H2.*H3.*H4.*H5.*H6;
%FS_football = F.*H1.*H2.*H3.*H4.*H5.*H6;

% convert the result to the spacial domain.
spatial=real(ifft2(result)); 

% Crop the image to undo padding
spatial=spatial(1:size(space,1), 1:size(space,2));

%Display the blurred image
figure, imshow(spatial,[])

% Display the Fourier Spectrum 
% Move the origin of the transform to the center of the frequency rectangle.
Fc=fftshift(F);
Fcf=fftshift(result);

% use abs to compute the magnitude and use log to brighten display
S1=log(1+abs(Fc)); 
S2=log(1+abs(Fcf));
figure, imshow(S1,[])
figure, imshow(S2,[])

