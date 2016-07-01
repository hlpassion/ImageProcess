f = imread('head.png');
cform = makecform('srgb2lab');
f_lab = applycform(f,cform);
f_a = f_lab(:,:,2);
f_b = f_lab(:,:,3);
% f_l = f_lab(:,:,1);
% subplot(1,3,1),imshow(f);
% subplot(1,3,2),imshow(f_a,[]);
% subplot(1,3,3),imshow(f_b,[]);
% figure(),imshow(f_l,[]);
% figure(),imshow(f_l-f_a);
% I = imread('head.png');
level = graythresh(f_a);
BW = im2bw(f_a,level);
imshow(BW);
figure(),imshow(f_lab-BW)