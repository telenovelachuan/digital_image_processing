% I = imread('test.png');
% imshow(I)

%a=imread('test.png');
%a=rgb2gray(a);
% a=[1 2 4 7 3; 2 4 7 3 1; 5 6 2 1 1;4 7 1 1 1];
% [r c] = size(a);
% a=im2double(a);
% filter=[0 1 0;1 -4 1; 0 1 0];
% result=a;
% for i=2:r-1
%     for j=2:c-1
%         sum=0;
%         row=0;
%         col=1;
%         
%         for k=i-1:i+1
%             row=row+1;
%             col=1;
%             for l=j-1:j+1
%                 sum = sum+a(k,l)*filter(row,col);               
%                 col=col+1;
%             end
%         end
%       result(i,j)=sum;      
%     end
% end
% % subplot(2,2,1)
% % imshow(a);
% % subplot(2,2,2)
% imshow(result);

a=[1 3 4 3 2];
b=fft(a);