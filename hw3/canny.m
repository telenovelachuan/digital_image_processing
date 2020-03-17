I = imread('ku.jpeg');
imshow(I);
grey = rgb2gray(I);
BW = edge(grey,'canny', [0.2 0.5]);
imshow(BW);