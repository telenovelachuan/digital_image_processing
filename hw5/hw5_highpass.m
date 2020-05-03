pattern = imread('pattern.tif');
pattern = imnoise(pattern, 'gaussian', 0, 0.1);
%pattern = imread('a.png');
%pattern = rgb2gray(pattern);
%imshow(pattern);
%Determine good padding for Fourier transform
PQ = paddedsize(size(pattern));
%Create a Gaussian Lowpass filter 5% the width of the Fourier transform
D0 = 0.05*PQ(1);

d_options = [0.01 0.8];
results = {};
for idx = 1:numel(d_options)
    D0 = d_options(idx);
    H = hpfilter('btw', PQ(1), PQ(2), D0);
    % Calculate the discrete Fourier transform of the image
    F = fft2(double(pattern), size(H,1),size(H,2));
    % Apply the highpass filter to the Fourier spectrum of the image
    lp = H.*F;
    % convert the result to the spacial domain.
    spacial=real(ifft2(lp));
    % Crop the image to undo padding
    spacial=spacial(1:size(pattern,1), 1:size(pattern,2));
    spacial=uint8(255 * mat2gray(spacial));
    results = [results, spacial];
end  

figure
montage(results);
