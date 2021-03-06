I = imread('ku.jpeg');
%imshow(I);
grey = rgb2gray(I);
%imshow(grey);
%BW = edge(grey,'canny', [0.2 0.5]);
%imshow(BW);

% i = 0;
% for a=[0.1, 0.3, 0.4, 0.6]
%     bw = edge(grey,'canny', [a a+0.3]);
%     i = i + 1;
%     subplot(2,2,i),imshow(bw); title(strcat('thresholds=[', num2str(a), ', ', num2str(a+0.3), ']'));
% end

% [H,theta,rho] = hough(BW);
% figure
% imshow(imadjust(rescale(H)), [], 'XData',theta, 'YData',rho, 'InitialMagnification','fit');
% xlabel('\theta (degrees)')
% ylabel('\rho')
% axis on
% axis normal 
% hold on
% colormap(gca,hot)

P = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
lines = houghlines(BW,theta,rho,P, 'FillGap', 5, 'MinLength', 7);
% figure, imshow(grey), hold on
% max_len = 0;
% for k = 1:length(lines)
%     
%         xy = [lines(k).point1; lines(k).point2];
%     if k == 1
%         plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
% 
%        % Plot beginnings and ends of lines
%        plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
%        plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
%     end
% 
%    % Determine the endpoints of the longest line segment
%    len = norm(lines(k).point1 - lines(k).point2);
%    if ( len > max_len)
%       max_len = len;
%       xy_long = xy;
%    end
% end
% % highlight the longest line segment
% plot(xy_long(1,1),xy_long(1,2),'x','LineWidth',2,'Color','yellow');
% plot(xy_long(2,1),xy_long(2,2),'x','LineWidth',2,'Color','red');
% plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

% y = [1 1.5 1 2 2.5]';
% A = [1 1; 2 1; 3 1; 4 1; 5 1 ];
% c = inv(A'*A)*A'*y

% lab=[0 1 0;1 -4 1; 0 1 0];
% rez=uint8(filter2(lab,grey,'same'));
% imshow(rez);
% title('laplacian');

% E2 = edge(grey,'sobel');
% figure; imshow(E2); title('sobel');

PSF = fspecial('gaussian',7,10);
Blurred = imfilter(grey,PSF,'symmetric','conv');
% imshow(Blurred)
% title('Blurred Image')

UNDERPSF = ones(size(PSF)-4);
[J1,P1] = deconvblind(Blurred,UNDERPSF);
% imshow(J1)

OVERPSF = padarray(UNDERPSF,[4 4],'replicate','both');
[J2,P2] = deconvblind(Blurred,OVERPSF);
%imshow(J2)

INITPSF = padarray(UNDERPSF,[2 2],'replicate','both');
[J3,P3] = deconvblind(Blurred,INITPSF);
%imshow(J3)


% figure;
% subplot(2,2,1)
% imshow(PSF,[],'InitialMagnification','fit')
% title('True PSF')
% subplot(222)
% imshow(P1,[],'InitialMagnification','fit')
% title('Reconstructed Undersized PSF')
% subplot(2,2,3)
% imshow(P2,[],'InitialMagnification','fit')
% title('Reconstructed Oversized PSF')
% subplot(2,2,4)
% imshow(P3,[],'InitialMagnification','fit')
% title('Reconstructed true PSF')

WEIGHT = edge(Blurred,'sobel', .08);
se = strel('disk',2);
WEIGHT = 1-double(imdilate(WEIGHT,se));
WEIGHT([1:3 end-(0:2)],:) = 0;
WEIGHT(:,[1:3 end-(0:2)]) = 0;
%figure; imshow(WEIGHT);

[J,P] = deconvblind(Blurred,INITPSF,30,[],WEIGHT);
%imshow(P)

% P1 = 2;
% P2 = 2;
% FUN = @(PSF) padarray(PSF(P1+1:end-P1,P2+1:end-P2),[P1 P2]);
% [JF,PF] = deconvblind(Blurred,OVERPSF,30,[],WEIGHT,FUN);
% imshow(JF)

vg{1} = imread('vg1.jpg');
vg{2} = imread('vg2.jpg');
vg{3} = imread('vg3.jpg');
vg{4} = imread('vg4.jpg');
vg{5} = imread('vg5.jpg');
vg{6} = imread('vg6.jpg');
%imshow(grey);
% 
% for idx=1:6
%     grey = rgb2gray(vg{idx});
%     
%     %bw = edge(grey,'canny', [0.1 0.3]);
%     %bw = edge(grey,'sobel');
%     %bw = edge(grey,'Prewitt');
%     
%     [r, c]=size(grey);
%     grey=im2double(grey);
%     filter=[-1 -1 -1;-1 8 -1; -1 -1 -1];
%     result=grey;
%     for i=2:r-1
%         for j=2:c-1
%             sum=0;
%             row=0;
%             col=1;
% 
%             for k=i-1:i+1
%                 row=row+1;
%                 col=1;
%                 for l=j-1:j+1
%                     sum = sum+grey(k,l)*filter(row,col);               
%                     col=col+1;
%                 end
%             end
%           result(i,j)=sum;      
%         end
%     end
%     
%     
%     subplot(2,3,idx),imshow(result);
% end



[r, c] = size(grey);
grey=im2double(grey);
filter=[-1 -1 -1;-1 8 -1; -1 -1 -1];
result=grey;
for i=2:r-1
    for j=2:c-1
        sum=0;
        row=0;
        col=1;
        
        for k=i-1:i+1
            row=row+1;
            col=1;
            for l=j-1:j+1
                sum = sum+grey(k,l)*filter(row,col);               
                col=col+1;
            end
        end
      result(i,j)=sum;      
    end
end
imshow(result);

