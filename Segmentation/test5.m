 %通过二值化，分割，效果不好
clear all;clc
rgb=imread('head.png');
%转到Lab色彩空间
cform = makecform('srgb2lab');
lab = applycform(rgb,cform);
%取a分量
I=lab(:,:,2);
figure(5);imhist(I)
figure(1);imshow(I)
pixelNunm = zeros(1,300);

%二值化
Ibw=im2bw(I);
figure(2);imshow(Ibw)
%清除二值图像的边界
Ibw=imclearborder(Ibw);
%删除二值图像中面积小于P的
Ibw=bwareaopen(Ibw,500);
%填补二值图像孔洞
Ibw=imfill(Ibw,'holes');
figure(3),imshow(Ibw)
R=rgb(:,:,1);
G=rgb(:,:,2);
B=rgb(:,:,3);
R(~Ibw)=0;
G(~Ibw)=0;
B(~Ibw)=0;
rgb=cat(3,R,G,B);
figure(4),imshow(rgb);

