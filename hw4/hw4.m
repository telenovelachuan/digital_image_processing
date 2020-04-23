images = {};
srcFiles = dir('/Users/macbook/Documents/git/digital_image_processing/hw4/images/*.JPG');  % the folder in which ur images exists
for i = 1:36
   filename = strcat('/Users/macbook/Documents/git/digital_image_processing/hw4/images/',srcFiles(i).name);
    I = imread(filename);
    I = rot90(I,3);
    images = [images, I];
    %imshow(I);
end

figure
montage(images, 'Size', [6, 6]);