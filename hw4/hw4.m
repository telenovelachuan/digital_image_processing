images = {};
srcFiles = dir('/Users/macbook/Documents/git/digital_image_processing/hw4/tinted/*.JPG');  % the folder in which ur images exists
for i = 1:8
   filename = strcat('/Users/macbook/Documents/git/digital_image_processing/hw4/tinted/',srcFiles(i).name);
    I = imread(filename);
    %I = rot90(I,3);
    images = [images, I];
    %imshow(I);
end

figure
montage(images, 'Size', [2, 4]);

% I = imread('/Users/macbook/Documents/git/digital_image_processing/hw4/pano.jpg');
% imshow(I);

% I1 = imread('/Users/macbook/Documents/git/digital_image_processing/hw4/images/IMG_0371.JPG');
% I1 = rot90(I1,3);
% I2 = imread('/Users/macbook/Documents/git/digital_image_processing/hw4/images/IMG_0386.JPG');
% I2 = rot90(I2,3);
% I3 = imread('/Users/macbook/Documents/git/digital_image_processing/hw4/images/IMG_0373.JPG');
% I3 = rot90(I3,3);
% I4 = imread('/Users/macbook/Documents/git/digital_image_processing/hw4/images/IMG_0352.JPG');
% I4 = rot90(I4,3);
% montage({I1, I2, I3, I4}, 'Size', [2, 2]);
