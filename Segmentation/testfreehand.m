clear;clc;
I = imread('38.tiff');
imshow(I);
h = imfreehand();
% pos = round(h.getPosition());  %对pos位置取整
pos = round(wait(h));  %对pos位置取整
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



















%-----------------------可以用于显示颜色范围内的图像，比如可以只显示某种颜色的信息。---------------------------------
% load clown
% BW = roicolor(X,10,10);
% imshow(X,map)
% figure,imshow(BW)


 


















