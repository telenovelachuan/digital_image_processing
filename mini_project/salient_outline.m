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

% segmentation on saliency map
srcFiles = dir('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/output_filtered/*.png');  % the folder in which ur images exists
for i = 1:200
   filename = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/output_filtered/',srcFiles(i).name);
    I = imread(filename);
    BW = imbinarize(I);
    
%     [~,threshold] = edge(I,'sobel');
%     fudgeFactor = 0.5;
%     BWs = edge(I,'sobel',threshold * fudgeFactor);
% 
%     se90 = strel('line',3,90);
%     se0 = strel('line',3,0);
%     BWsdil = imdilate(BWs,[se90 se0]);
%     BWdfill = imfill(BWsdil,'holes');
% 
%     BWnobord = imclearborder(BWdfill,4);
%     seD = strel('diamond',1);
%     BWfinal = imerode(BWnobord,seD);
%     BWfinal = imerode(BWfinal,seD);

    folder = '/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/saliency_map_seg_gt';
    imwrite(BW,fullfile(folder, srcFiles(i).name))
    %figure, imshow(I);
end

% texture segmentation
I = imread('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/output_filtered/2007_000676_MB+.png');






