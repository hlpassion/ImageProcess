 %图像转换到Lab空间，根据直方图找到出现次数最多的像素值，在原图中减去，得到一个分割图，发现有大量的噪音
clear all;clc
rgb=imread('head.png');
%转到Lab色彩空间
cform = makecform('srgb2lab');lab = applycform(rgb,cform);
%取a分量
I=lab(:,:,2);
figure(5);imhist(I)
figure(1);imshow(I)
pixelNunm = zeros(1,300);
%--------------------测试代码---------------------%
for pixelValue=0:255
     pixelNunm(pixelValue+1) = length(find(I==pixelValue));
end
[x,y] = max(pixelNunm);
[m,n] = size(I);
for row = 1:m
    for col = 1:n
        if(I(row,col) == y-1)
            I(row,col) = I(row,col)-y-1;
        end
        
    end
end



figure(7),imshow(I)
% Ibw=im2bw(I);
% figure(8),imshow(Ibw)
%--------------------测试代码---------------------%


% figure(1);imshow(I)
% %二值化
% Ibw=im2bw(I);
% figure(2);imshow(Ibw)
% %清除二值图像的边界
% Ibw=imclearborder(Ibw);
% %删除二值图像中面积小于P的
% Ibw=bwareaopen(Ibw,500);
% %填补二值图像孔洞
% Ibw=imfill(Ibw,'holes');
% figure(3),imshow(Ibw)
% R=rgb(:,:,1);
% G=rgb(:,:,2);
% B=rgb(:,:,3);
% R(~Ibw)=0;
% G(~Ibw)=0;
% B(~Ibw)=0;
% rgb=cat(3,R,G,B);
% figure(4),imshow(rgb);
% 
