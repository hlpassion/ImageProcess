 %ͼ��ת����Lab�ռ䣬����ֱ��ͼ�ҵ����ִ�����������ֵ����ԭͼ�м�ȥ���õ�һ���ָ�ͼ�������д���������
clear all;clc
rgb=imread('head.png');
%ת��Labɫ�ʿռ�
cform = makecform('srgb2lab');lab = applycform(rgb,cform);
%ȡa����
I=lab(:,:,2);
figure(5);imhist(I)
figure(1);imshow(I)
pixelNunm = zeros(1,300);
%--------------------���Դ���---------------------%
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
%--------------------���Դ���---------------------%


% figure(1);imshow(I)
% %��ֵ��
% Ibw=im2bw(I);
% figure(2);imshow(Ibw)
% %�����ֵͼ��ı߽�
% Ibw=imclearborder(Ibw);
% %ɾ����ֵͼ�������С��P��
% Ibw=bwareaopen(Ibw,500);
% %���ֵͼ��׶�
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
