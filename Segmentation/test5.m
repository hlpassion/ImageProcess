 %ͨ����ֵ�����ָЧ������
clear all;clc
rgb=imread('head.png');
%ת��Labɫ�ʿռ�
cform = makecform('srgb2lab');
lab = applycform(rgb,cform);
%ȡa����
I=lab(:,:,2);
figure(5);imhist(I)
figure(1);imshow(I)
pixelNunm = zeros(1,300);

%��ֵ��
Ibw=im2bw(I);
figure(2);imshow(Ibw)
%�����ֵͼ��ı߽�
Ibw=imclearborder(Ibw);
%ɾ����ֵͼ�������С��P��
Ibw=bwareaopen(Ibw,500);
%���ֵͼ��׶�
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

