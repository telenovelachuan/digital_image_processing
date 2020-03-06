image = imread('alaska.jpg');
% figure; subplot(2,2,1),imshow(image); title('Original Image');
% 
% i = 1;
% for a=[0.2, 0.5, 0.7]
%     T = maketform('affine', [1 0 0; a 1 0; 0 0 1] );
%     color = [5 127 56]';
%     R = makeresampler({'cubic','nearest'}, 'fill');
%     B = imtransform(image, T, R, 'FillValues', color);
%     i = i + 1;
%     subplot(2,2,i),imshow(B); title(strcat('a=', num2str(a)));
% end

% i = 0;
% for a=[50, 100, 150, 200]
%     T = maketform('affine', [1 0 0; 0.3 1 0; 0 0 1] );
%     color = [mod(a-30, 255) mod(a*2, 255) mod(a*3, 255)]';
%     R = makeresampler({'cubic','nearest'}, 'fill');
%     B = imtransform(image, T, R, 'FillValues', color);
%     i = i + 1;
%     subplot(2,2,i),imshow(B); title(strcat('color=', mat2str(color)));
% end



