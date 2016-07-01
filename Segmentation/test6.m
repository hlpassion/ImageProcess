
%kmeans 分割
clear all;
clc;
I_rgb=imread('head.png');
figure();imshow(I_rgb);title('原始图像');
%去噪
filter=ones(5,5);
filter=filter/sum(filter(:));
denoised_r=conv2(I_rgb(:,:,1),filter,'same');
denoised_g=conv2(I_rgb(:,:,2),filter,'same');
denoised_b=conv2(I_rgb(:,:,3),filter,'same');
denoised_rgb=cat(3, denoised_r, denoised_g, denoised_b);
D_rgb=uint8(denoised_rgb);
figure();imshow(D_rgb);title('去噪后图像');%去噪后的结果
%将彩色图像从RGB转化到lab彩色空间
C =makecform('srgb2lab'); %设置转换格式
I_lab= applycform(D_rgb, C);
%进行K-mean聚类将图像分割成2个区域
ab =double(I_lab(:,:,2:3)); %取出lab空间的a分量和b分量
nrows= size(ab,1);
ncols= size(ab,2);
ab =reshape(ab,nrows*ncols,2);
nColors= 2; %分割的区域个数为2
[cluster_idx,cluster_center] =kmeans(ab,nColors,'distance','sqEuclidean','Replicates',2); %重复聚类2次
pixel_labels= reshape(cluster_idx,nrows,ncols);
%显示分割后的各个区域
segmented_images= cell(1,3);
rgb_label= repmat(pixel_labels,[1 1 3]);
for k= 1:nColors
color = I_rgb;
color(rgb_label ~= k) = 0;
segmented_images{k} = color;
end
figure(),imshow(segmented_images{1}),title('分割结果——区域1');
figure(),imshow(segmented_images{2}),title('分割结果——区域2');
%计算分割后图像的rgb特征值
val_d_red=mean2(segmented_images{1}(:,:,1));
val_d_green=mean2(segmented_images{1}(:,:,2));
val_d_blue=mean2(segmented_images{1}(:,:,3));
disp(sprintf('[%0.3f,%0.3f,%0.3f]',val_d_red,val_d_green,val_d_blue));
