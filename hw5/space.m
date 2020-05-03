I = imread('space.tif');
%Determine good padding for Fourier transform
PQ = paddedsize(size(I));
%Create a Gaussian Lowpass filter 5% the width of the Fourier transform
D0 = 0.05*PQ(1);

d_options = [0.01];
results = {};
for idx = 1:numel(d_options)
    ratio = d_options(idx);
    D0 = ratio * PQ(1);
    H1 = notch('btw', PQ(1), PQ(2), 10, 50, 100);
    H2 = notch('btw', PQ(1), PQ(2), 10, 1, 400);
    H3 = notch('btw', PQ(1), PQ(2), 10, 620, 100);
    H4 = notch('btw', PQ(1), PQ(2), 10, 22, 414);
    H5 = notch('btw', PQ(1), PQ(2), 10, 592, 414);
    H6 = notch('btw', PQ(1), PQ(2), 10, 1, 114);
    % Calculate the discrete Fourier transform of the image
    F = fft2(double(I), PQ(1), PQ(2));
    % Apply the highpass filter to the Fourier spectrum of the image
    lp = F.*H1.*H2.*H3.*H4.*H4.*H6;
    % convert the result to the spacial domain.
    spatial=real(ifft2(lp));
    % Crop the image to undo padding
    spatial=spatial(1:size(I,1), 1:size(I,2));
    spatial=uint8(255 * mat2gray(spatial));
    results = [results, spatial];
end  

figure
montage(results);