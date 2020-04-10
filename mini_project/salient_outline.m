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


% % evaluating
% srcFiles = dir('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/img_original/*.jpg');  % the folder in which ur images exists
% for i = 1:200
%     file_name = srcFiles(i).name;
%     origin_name = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/img_original/',srcFiles(i).name);
%     origin = imread(origin_name);
%     name_split = split(file_name,".");
%     name = name_split{1};
%     mb_name = strcat(name, '_MB+.png');
%     png_name = strcat(name, '.png');
%     gt_path = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/ground_truth_mask/', png_name);
%     gt = imread(gt_path);
%     gt = im2bw(gt);
%     segment_path = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/saliency_map_seg_disk/', mb_name);
%     segmented = imread(segment_path);
%     figure('visible', 'off')
%     imshow(origin)
%     info_gt = regionprops(gt,'Boundingbox');
%     info_seg = regionprops(segmented,'Boundingbox');
%     hold on
%     for k = 1 : length(info_gt)
%          BB = info_gt(k).BoundingBox;
%          rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','g','LineWidth',2) ;
%     end
%     hold on
%     for k = 1 : length(info_seg)
%          BB = info_seg(k).BoundingBox;
%          rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','r','LineWidth',2) ;
%     end
% 
%     folder = '/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/evaluation';
%     F = getframe;
% 	imwrite(F.cdata, fullfile(folder, srcFiles(i).name))
%     close(figure)
%     
%     %figure, imshow(I);
% end


% origin = imread('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/img_original/2008_002682.jpg');
% gt = imread('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/ground_truth_mask/2008_002682.png');
% gt = im2bw(gt);
% segmented = imread('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/saliency_map_seg_disk/2008_002682_MB+.png');
% figure('visible', 'off')
% imshow(origin)
% info_gt = regionprops(gt,'Boundingbox');
% info_seg = regionprops(segmented,'Boundingbox');
% hold on
% for k = 1 : length(info_gt)
%      BB = info_gt(k).BoundingBox;
%      rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','g','LineWidth',2) ;
% end
% hold on
% for k = 1 : length(info_seg)
%      BB = info_seg(k).BoundingBox;
%      rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','r','LineWidth',2) ;
% end
% F = getframe ;
% imwrite(F.cdata, '/Users/macbook/Desktop/p.jpg')
% close(figure)

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

% % comparison on Gaussian filter
% srcFiles = dir('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/gausssian_cmp/*.png');  % the folder in which ur images exists
% groups = {};
% for i = 1:5
%     no_filter = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/output_original/',srcFiles(i).name);
%     I_no_filter = imread(no_filter);
%     groups = [groups, I_no_filter];
%     filtered = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/output_filtered/',srcFiles(i).name);
%     I_filtered = imread(filtered);
%     groups = [groups, I_filtered];
% 
%     %figure, imshow(I);
% end
% 
% figure
% montage(groups, 'Size', [5, 2]);

% evaluation samples
srcFiles = dir('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/evaluation_global_threshold_selected/*.jpg');  % the folder in which ur images exists
evaluations = {};
for i = 1:6
    image = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/evaluation_global_threshold_selected/',srcFiles(i).name);
    I = imread(image);
    evaluations = [evaluations, I];

    %figure, imshow(I);
end

figure
montage(evaluations, 'Size', [3, 2]);


% % evaluating for thresholding
% srcFiles = dir('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/img_original/*.jpg');  % the folder in which ur images exists
% for i = 1:200
%     file_name = srcFiles(i).name;
%     origin_name = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/img_original/',srcFiles(i).name);
%     origin = imread(origin_name);
%     name_split = split(file_name,".");
%     name = name_split{1};
%     mb_name = strcat(name, '_MB+.png');
%     png_name = strcat(name, '.png');
%     thresholding_path = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/saliency_map_seg_global_threshold/', mb_name);
%     threshold_img = imread(thresholding_path);
%     seg_path = strcat('/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/saliency_map_seg_disk/', mb_name);
%     seg_img = imread(seg_path);
%     %gt = im2bw(gt);
%     figure('visible', 'off')
%     imshow(origin)
%     info_thresholding = regionprops(threshold_img, 'Boundingbox');
%     info_seg = regionprops(seg_img, 'Boundingbox');
%     hold on
%     for k = 1 : length(info_thresholding)
%          BB = info_thresholding(k).BoundingBox;
%          rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','b','LineWidth',2) ;
%     end
%     hold on
%     for k = 1 : length(info_seg)
%          BB = info_seg(k).BoundingBox;
%          rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','r','LineWidth',2) ;
%     end
% 
%     folder = '/Users/macbook/Documents/git/digital_image_processing/mini_project/MBS/Windows/evaluation_seg_vs_threshold';
%     F = getframe;
% 	imwrite(F.cdata, fullfile(folder, srcFiles(i).name))
%     close(figure)
%     
%     %figure, imshow(I);
% end