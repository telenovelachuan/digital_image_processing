I = imread('test.png');
J1 = imrotate(I,-30,'bilinear','crop');
J2 = imresize(I, 2, 'cubic');

I2 = rgb2gray(I);
J1 = imadjust(I,[],[],0.3);
J2 = imadjust(I,[],[],3);

b1=bitget(I2,1);
b7=bitget(I2,7);
b8=bitget(I2,8);


