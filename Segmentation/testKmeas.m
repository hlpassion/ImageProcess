%�õ����ָ�ͼ��ab�����������ͼ����ab������ͼ����kmeans��watershed����
Img = imread('head.png');
lab = makecform('srgb2lab');
Img_lab = applycform(Img,lab);
Img_a = Img_lab(:,:,2);
Img_b = Img_lab(:,:,3);
% imwrite(Img_a,'Img_a.tif');
% imwrite(Img_b,'Img_b.tif');
figure(1),imshow(Img_a);

Img_a_dou=im2double(Img_a);
X=reshape(Img_a_dou,size(Img_a_dou,1)*size(Img_a_dou,2),1);
K=2;
[IDX, C] = kmeans(X, K);
im = reshape(IDX,size(Img_a_dou));
figure(2),imagesc(im);