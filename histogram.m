I = imread('test.png');
imhist(I);
J = histeq(I,256);
figure, imshow(J);
figure, imhist(J,256)

% gray scale transformation
[J,T] = histeq(I);
figure,plot((0:255)/255,T);