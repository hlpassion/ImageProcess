 %�����������
clc; clear all; close all;
srcDir=uigetdir('Choose source directory.'); %���ѡ����ļ���
cd(srcDir);
allnames=struct2cell(dir('*.png'));
[k,len]=size(allnames);
temp = 1;
t = 0.1;
for ii=1:len
%���ȡ���ļ�
  name=allnames{1,ii};
  I=imread(name); %��ȡ�ļ�
  %��ͼ��Ĵ���
  cform = makecform('srgb2lab');
  I_lab = applycform(I,cform);
  I_a = I_lab(:,:,2);
  
 % subplot('position',[left bottom width height]);
  
  
  subplot(10,2,temp),imshow(I);
  set(gca, 'Units', 'normalized', 'Position', [0 t 0.5 0.5]);
  
  temp = temp+1;
  subplot(10,2,temp),imshow(I_a);
  set(gca, 'Units', 'normalized', 'Position', [0.5 t 0.5 0.5]);
  temp = temp+1;
  t= t+0.01;
%Ȼ���ڴ˴�������ͼ������򼴿�
end

% frame=getframe(gcf);
% im=frame2im(frame);
% imwrite(im,'123.jpg','jpg');




% f = imread('head.png');
% cform = makecform('srgb2lab');
% f_lab = applycform(f,cform);
% f_a = f_lab(:,:,2);
% f_b = f_lab(:,:,3);
% subplot(1,3,1),imshow(f);
% subplot(1,3,2),imshow(f_a,[]);
% subplot(1,3,3),imshow(f_b,[]);