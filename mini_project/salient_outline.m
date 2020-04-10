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
%     %BW = imbinarize(I);
%     
%     %[~,threshold] = edge(I,'sobel');
%     %fudgeFactor = 0.5;
%     %BWs = edge(I,'sobel',threshold * fudgeFactor);
%     BWs = edge(I,'canny', [0.1 0.2]);
% 
%     se90 = strel('line',7,90);
%     se0 = strel('line',7,0);
%     BWsdil = imdilate(BWs,[se90 se0]);
%     BWdfill = imfill(BWsdil,'holes');
% 
%     BWnobord = imclearborder(BWdfill,8);
%     %seD = strel('diamond',1);
%     seD = strel("disk",3); 
%     BWfinal = imerode(BWnobord,seD);
%     %BWfinal = imerode(BWfinal,seD);
% 
%     folder = '/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/saliency_map_seg_disk';
%     imwrite(BWfinal,fullfile(folder, srcFiles(i).name))
%     %figure, imshow(I);
% end

% % texture segmentation
% I = imread('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/output_filtered/2008_002682_MB+.png');
% BWs = edge(I,'canny', [0.1 0.2]);
% 
% 
% se90 = strel('line',7,90);
% se0 = strel('line',7,0);
% BWsdil = imdilate(BWs,[se90 se0]);
% BWdfill = imfill(BWsdil,'holes');
% 
% BWnobord = imclearborder(BWdfill,8);
% %SE = strel('diamond',1);
% SE = strel("disk",3); 
% BWfinal = imerode(BWnobord,SE);
% %BWfinal = imerode(BWfinal,SE);
% %imshow(BWfinal)
% 
% figure
% montage({I, BWfinal})


% evaluating
%BW = imread('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/saliency_map_seg_disk/2008_002682_MB+.png');
gt = imread('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/ground_truth_mask/2008_002682.png');
gt = im2bw(gt);
imshow(gt)
info_gt = regionprops(gt,'Boundingbox');
hold on
for k = 1 : length(info_gt)
     BB = info_gt(k).BoundingBox;
     rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','g','LineWidth',2) ;
end



% function ratio = evalMetric (org,gt)
%     I= max(0, min(org(1)+org(3), gt(1)+gt(3)) - max(org(1), gt(1))) * max(0, min(org(2)+org(4), gt(2)+gt(4)) - max(org(2), gt(2)));
%     A = org(3) * org(4);
%     B = gt(3) * gt(4);
%     S=A+B-I;
%     ratio = I/S;
% end

% org = imread('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/saliency_map_seg_disk/2008_002682_MB+.png');
% gt = imread('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/ground_truth_mask/2008_002682.png');
% %org = im2uint8(org);
% gt = im2bw(gt);
% test = evalMetric(org, gt);
% 
% function ratio = evalMetric (org,gt)
%     I= max(0, min(org(1)+org(3), gt(1)+gt(3)) - max(org(1), gt(1))) * max(0, min(org(2)+org(4), gt(2)+gt(4)) - max(org(2), gt(2)));
%     A = org(3) * org(4);
%     B = gt(3) * gt(4);
%     S=A+B-I;
%     ratio = I/S;
% end




