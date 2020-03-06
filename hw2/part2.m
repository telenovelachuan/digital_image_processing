image = imread('alaska.jpg');
% h1=figure;imshow(image); title('original image');
% 
% T = maketform('affine', [1 0 0; 0.3 1 0; 0 0 1] );
% color = [5 127 56]';
% R = makeresampler({'cubic','nearest'}, 'fill');
% B = imtransform(image, T, R, 'FillValues', color);
% h2=figure;imshow(B); title('sheared image');

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


% [U,V] = meshgrid(0:20:800,0:20:400);
% gray = 0.65 * [1 1 1];
%  
% figure(h1);
% hold on;
% line(U, V, 'Color', gray);
% line(U', V', 'Color', gray);
% 
%  
% figure(h2);
% hold on;
% line(X, Y, 'Color',gray);
% line(X',Y','Color',gray);

% gray = 1 * [1 1 1];
% for u = 0:100:800
%     for v = 0:100:400
%         theta = (0 : 32)' * (2 * pi / 32);
%         uc = u + 20*cos(theta);
%         vc = v + 20*sin(theta);
%         [xc,yc] = tformfwd(T,uc,vc);
%         figure(h1); line(uc,vc,'Color',gray);
%         figure(h2); line(xc,yc,'Color',gray);
%     end
% end


% R = makeresampler({'cubic','nearest'},'fill');
% color = [5 127 56]';
% Bf = imtransform(image, T, R,'XData',[-49 1000],'YData',[-49 500], 'FillValues',color);
% figure, imshow(Bf);
% title('Pad Method = ''fill''');

% R = makeresampler({'cubic','nearest'},'replicate');
% Br = imtransform(image,T,R,'XData',[-49 1000],'YData', [-49 500]);
% figure, imshow(Br);
% title('Pad Method = ''replicate''');

% R = makeresampler({'cubic','nearest'}, 'bound');
% Bb = imtransform(image,T,R,'XData',[-49 1000],'YData',[-49 500], 'FillValues',[5 127 56]');
% figure, imshow(Bb);
% title('Pad Method = ''bound''');


R = makeresampler({'cubic','nearest'},'fill');
Cf = imtransform(image,T,R,'XData',[870 930],'YData',[300 420],...
                 'FillValues',[5 127 56]');

R = makeresampler({'cubic','nearest'},'bound');
Cb = imtransform(image,T,R,'XData',[870 930],'YData',[300 420],...
                 'FillValues',[5 127 56]');

Cf = imresize(Cf,12,'nearest');
Cb = imresize(Cb,12,'nearest');

figure;
subplot(1,2,1); imshow(Cf); title('Pad Method = ''fill''');
subplot(1,2,2); imshow(Cb); title('Pad Method = ''bound''');