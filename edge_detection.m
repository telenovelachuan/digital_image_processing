I = imread('test.png');
I = rgb2gray(I);
E1 = edge(I,'roberts');
figure; imshow(E1);
E2 = edge(I,'prewitt');
figure; imshow(E2);
E3 = edge(I,'sobel');
figure; imshow(E3);

% Hough transform
I = imread('test.png');
I = rgb2gray(I);
BW = edge(I,'canny');
[H,theta,rho] = hough(BW);
imshow(H,[],'XData',T,'YData',R, 'InitialMagnification','fit');
P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');

figure, imshow(I), hold on
max_len = 0;
lines = houghlines(BW,theta,rho,P, 'FillGap', 5, 'MinLength', 7);
for k = 1:length(lines)
 xy = [lines(k).point1; lines(k).point2];
  plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
 % Plot beginnings and ends of lines
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
  plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
% Determine the endpoints of the longest line segment
  len = norm(lines(k).point1 - lines(k).point2);
    if ( len > max_len)
      max_len = len;
      xy_long = xy;
    end
end

% Highlight the longest line segment
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');

