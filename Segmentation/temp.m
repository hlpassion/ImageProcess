clear;clc;
I = imread('07.tiff');
imshow(I);

h = imfreehand();
h.setColor('red')
pos = round(h.getPosition());
numOfPos = length(pos);
for x = 1:numOfPos
    I(pos(x,1),pos(x,2)) = 255;
    
end

% imshow(I)

% I = imread('eight.tif');
% c = [222 272 300 270 221 194];
% r = [21 21 75 121 121 75];

imshow(I), 
