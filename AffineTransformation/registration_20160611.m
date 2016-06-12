fixed = rgb2gray(imread('fix.tiff'));
% moving = imrotate(fixed, 5, 'bilinear', 'crop');

moving = rgb2gray(imread('05.tiff'));
%test the other option
% moving = rgb2gray(imread('fix_test.tiff'));
imshowpair(fixed, moving,'montage');
[optimizer, metric] = imregconfig('multimodal');
tform = imregtform(moving, fixed, 'similarity', optimizer, metric);%Translation, %, Scale

Rfixed = imref2d(size(fixed));
[registered,~] = imwarp(moving,tform,'OutputView',Rfixed);
% imshowpair(registered)
figure,imshowpair(fixed, registered,'montage');