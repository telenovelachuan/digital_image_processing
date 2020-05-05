% I = imread('test.png');
% H1 = fspecial('average',[5 5]);
% H2 = fspecial('average',[15 15]);
% H3 = fspecial('average',[30 30]);
% G1 = imfilter(I,H1,'replicate');
% G2 = imfilter(I,H2,'replicate');
% G3 = imfilter(I,H3,'replicate');
% subplot(2,2,1), imshow(I);
% subplot(2,2,2), imshow(G1);
% subplot(2,2,3), imshow(G2);
% subplot(2,2,4), imshow(G3);

I = imread('test.png');
I = rgb2gray(I);
J = imnoise(I,'salt & pepper',0.02);
K = medfilt2(J);
subplot(1,3,1), imshow(I); subplot(1,3,2), imshow(J); subplot(1,3,3), imshow(K);
I2 = imread('test.png');
K2 = medfilt2(I2);
figure; subplot(1,2,1), imshow(I2); subplot(1,2,2), imshow(K2);

