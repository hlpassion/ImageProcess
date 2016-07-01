clear;
I = imread('Img_a.tif');
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I), hy, 'replicate');
Ix = imfilter(double(I), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
figure
imshow(gradmag,[]), title('Gradient magnitude (gradmag)')

Level = graythresh(gradmag);
img = im2bw(gradmag,Level);
figure,imshow(img,[])
