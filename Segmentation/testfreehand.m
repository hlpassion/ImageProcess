clear;clc;
I = imread('38.tiff');
imshow(I);
h = imfreehand();
% pos = round(h.getPosition());  %��posλ��ȡ��
pos = round(wait(h));  %��posλ��ȡ��
c = [];
r = [];
numOfPos = length(pos);
for x = 1:numOfPos
    c(x) = pos(x,1);
    r(x) = pos(x,2);
end
BW = roipoly(I,c,r);
if numOfPos == 0
    msgbox('you do not select anything!');
else
    imshow(I), figure, imshow(BW)
end



















%-----------------------����������ʾ��ɫ��Χ�ڵ�ͼ�񣬱������ֻ��ʾĳ����ɫ����Ϣ��---------------------------------
% load clown
% BW = roicolor(X,10,10);
% imshow(X,map)
% figure,imshow(BW)


 


















