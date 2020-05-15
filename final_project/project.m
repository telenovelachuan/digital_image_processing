I1 = imread('images/1.jpg');
I2 = imread('images/2.jpg');
I3 = imread('images/3.jpg');
I4 = imread('images/4.jpg');
I5 = imread('images/5.jpg');

O1 = imread('outputs/images/1_traditional.jpg');
O2 = imread('outputs/images/2_traditional.jpg');
O3 = imread('outputs/images/3_traditional.jpg');
O4 = imread('outputs/images/4_traditional.jpg');
O5 = imread('outputs/images/5_traditional.jpg');

images = {I1 O1 I2 O2 I3 O3 I4 O4 I5 O5};
figure
montage(images, 'Size', [10, 1]);