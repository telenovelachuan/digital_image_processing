I = imread("aa.png");
BW = im2bw(I);
st = regionprops(BW, 'BoundingBox' );
info = regionprops(aa,'Boundingbox');

imshow(BW)
hold on
for k = 1 : length(info)
     BB = info(k).BoundingBox;
     rectangle('Position', [BB(1),BB(2),BB(3),BB(4)],'EdgeColor','r','LineWidth',2) ;
end