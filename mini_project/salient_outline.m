% I = imread("aa.png");
% BW = im2bw(I);
% st = regionprops(BW, 'BoundingBox' );
% info = regionprops(aa,'Boundingbox');
% 
% imshow(BW)
% hold on
% for k = 1 : length(info)
%      BB = info(k).BoundingBox;
%      rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','r','LineWidth',2) ;
% end

% I = imread('2007_000676_MB+.png');
% BW = imbinarize(I,'adaptive','ForegroundPolarity','dark','Sensitivity',0.9);
% %BW = imbinarize(I, 'adaptive');
% figure
% imshowpair(I,BW,'montage')

% % filtering
% srcFiles = dir('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/img/*.jpg');  % the folder in which ur images exists
% for i = 1:200
%    filename = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/img/',srcFiles(i).name);
%     I = imread(filename);
%     Iblur = imgaussfilt(I,2);
%     folder = '/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/img_filtered';
%     imwrite(Iblur,fullfile(folder, srcFiles(i).name))
%     %figure, imshow(I);
% end

% % segmentation on saliency map
% srcFiles = dir('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/output_filtered/*.png');  % the folder in which ur images exists
% for i = 1:200
%    filename = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/output_filtered/',srcFiles(i).name);
%     I = imread(filename);
%     BW = imbinarize(I);
%     folder = '/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/saliency_map_seg';
%     imwrite(BW,fullfile(folder, srcFiles(i).name))
%     %figure, imshow(I);
% end

% texture segmentation
