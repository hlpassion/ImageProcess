fixed = imread('fix.tiff');
moving = imread('05.tiff');

cpselect(moving, fixed)

T = fitgeotrans(movingPoints, fixedPoints, 'affine');

Z = imwarp(moving, T);

imshow(Z,[]),figure;
imshow(fixed)