
%kmeans �ָ�
clear all;
clc;
I_rgb=imread('head.png');
figure();imshow(I_rgb);title('ԭʼͼ��');
%ȥ��
filter=ones(5,5);
filter=filter/sum(filter(:));
denoised_r=conv2(I_rgb(:,:,1),filter,'same');
denoised_g=conv2(I_rgb(:,:,2),filter,'same');
denoised_b=conv2(I_rgb(:,:,3),filter,'same');
denoised_rgb=cat(3, denoised_r, denoised_g, denoised_b);
D_rgb=uint8(denoised_rgb);
figure();imshow(D_rgb);title('ȥ���ͼ��');%ȥ���Ľ��
%����ɫͼ���RGBת����lab��ɫ�ռ�
C =makecform('srgb2lab'); %����ת����ʽ
I_lab= applycform(D_rgb, C);
%����K-mean���ཫͼ��ָ��2������
ab =double(I_lab(:,:,2:3)); %ȡ��lab�ռ��a������b����
nrows= size(ab,1);
ncols= size(ab,2);
ab =reshape(ab,nrows*ncols,2);
nColors= 2; %�ָ���������Ϊ2
[cluster_idx,cluster_center] =kmeans(ab,nColors,'distance','sqEuclidean','Replicates',2); %�ظ�����2��
pixel_labels= reshape(cluster_idx,nrows,ncols);
%��ʾ�ָ��ĸ�������
segmented_images= cell(1,3);
rgb_label= repmat(pixel_labels,[1 1 3]);
for k= 1:nColors
color = I_rgb;
color(rgb_label ~= k) = 0;
segmented_images{k} = color;
end
figure(),imshow(segmented_images{1}),title('�ָ�����������1');
figure(),imshow(segmented_images{2}),title('�ָ�����������2');
%����ָ��ͼ���rgb����ֵ
val_d_red=mean2(segmented_images{1}(:,:,1));
val_d_green=mean2(segmented_images{1}(:,:,2));
val_d_blue=mean2(segmented_images{1}(:,:,3));
disp(sprintf('[%0.3f,%0.3f,%0.3f]',val_d_red,val_d_green,val_d_blue));
