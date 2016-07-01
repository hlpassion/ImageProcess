clear;
I = imread('meta.png');
cform = makecform('srgb2lab');
I_lab = applycform(I,cform);
I_a = I_lab(:,:,2);
figure,imhist(I_a);
I_b = I_lab(:,:,3);
figure(),imshow(I_b)
levela = graythresh(I_a);
levelb = graythresh(I_b);
BWa = im2bw(I_a, levela);
BWb = im2bw(I_b, levelb);
figure(),imshow(BWa,[]);
figure(),imshow(BWb,[]);
figure,imshow(BWa+BWb,[])
