%footBall=imread('noiseball.png');
space=imread('space.tif');

%Determine good padding for Fourier transform
PQ = paddedsize(size(space));
%Create a Gaussian Lowpass filter 5% the width of the Fourier transform
D0 = 0.05*PQ(1);

d_options = [0.01 0.05 0.1 0.5];
results = {};
for idx = 1:numel(d_options)
    ratio = d_options(idx);
    D0 = ratio * PQ(1);
    H = lpfilter('gaussian', PQ(1), PQ(2), D0);
    % Calculate the discrete Fourier transform of the image
    F = fft2(double(space), size(H,1),size(H,2));
    % Apply the highpass filter to the Fourier spectrum of the image
    lp = H.*F;
    % convert the result to the spacial domain.
    spacial=real(ifft2(lp));
    % Crop the image to undo padding
    spacial=spacial(1:size(space,1), 1:size(space,2));
    spacial=uint8(255 * mat2gray(spacial));
    results = [results, spacial];
end  

figure
montage(results);


