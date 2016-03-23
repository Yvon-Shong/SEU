%x=[1 5 8 ; 6 3 1]
%y=[5 6 8; 7 3 1]
%矩阵 以列为主
%global <-> �?��变量

%%函数
% funtion mean(x);
% [m,n]= size(x);
% if m==1
%    m=n;
% end
% y=sum(x)/m;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%循环
% r=1;
% while r<10
%     r=r+1;
%     if r>7
%         r
%         break;
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %switch语句
% var=-1
% 
% switch var
%     case -1
%         disp('var is -1')
%     case 0
%          disp('var is 0')
%     case 1
%          disp('var is 1')
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %图片读取
% img = imread('123.png');
% %I = rgb2gray(img);
% imshow(img);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %subplotͬ同屏显示多图
% figure(1);
% subplot(2,2,1)
% imshow('1.jpg');
% 
% subplot(2,2,2)
% imshow('2.jpg');
% 
% subplot(2,2,3)
% imshow('3.jpg');
% 
% subplot(2,2,4)
% imshow('4.jpg');
% 
% figure(2);
% subplot(2,2,1)
% rgb1=imread('1.jpg');
% I1=rgb2gray(rgb1);
% imshow(I1);
% 
% subplot(2,2,2)
% rgb2=imread('2.jpg');
% I2=rgb2gray(rgb2);
% imshow(I2);
% 
% subplot(2,2,3)
% rgb3=imread('3.jpg');
% I3=rgb2gray(rgb3);
% imshow(I3);
% 
% subplot(2,2,4)
% rgb4=imread('4.jpg');
% I4=rgb2gray(rgb4);
% imshow(I4);


%fopen()
%fid=fopen('E:\3.jpg')

%%size()
% I=imread('E:\3.jpg');
% [x,y]=size(I);
% [x,y]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%画图
% I=zeros(100,100);
% for i=1:1:100
%     for j=1:100
%         if(i>10&&i<90)&&(j>10&&j<90)
%             I(i,j)=255;
%         end
%     end
% end

% 
rgb3=imread('3.jpg');
I=rgb2gray(rgb3);
%%%%快�?傅里叶变�?% FFT=fft2(I);

%%%反傅里叶变换
IFFT=ifft2(FFT);
IFFT_1=fftshift(IFFT);

figure(1);
subplot(2,2,1)
    imshow(I);
    title('灰度�?);
subplot(2,2,2)
    imshow(FFT); 
     title('FFT');
subplot(2,2,3)
    imshow(fftshift(log(1+abs(FFT))),[]);
     title('Abs+log&shift');
subplot(2,2,4)
    imshow(uint8(IFFT));
     title('ifft');
%uint8()汉字编码格式问题


%%彩色m*n*3矩阵 RGB


%ͼ图片直方图imhist() 直方图均衡化 histeq()
% 
%I0=imread('3.jpg');
%I1=rgb2gray(I0);
%I3=imhist(I1)
%%%%plot(I3)
%histeq(I1);

% %%%图片旋转imrotate(I,angle,method) %%采样方式'nearest'  'bilinear'  'bicubic'
% 
% I0=imread('3.jpg');
% I1=rgb2gray(I0);
% I2=imrotate(I1,30,'bilinear');
% imshow(I2);




%%%%%%边缘�?�� edge detection
% %Roberts算子
% I0=imread('3.jpg');
% Ibw=im2bw(I0);
% I1=rgb2gray(I0);
% subplot(2,2,1)
% imshow(Ibw);
% subplot(2,2,2)
% imshow(I1);
% subplot(2,2,3)
% J1=edge(I1,'Roberts');
% imshow(J1);
% subplot(2,2,4)
% J2=edge(Ibw,'Roberts');
% imshow(J2);


%%%%title()  xlable()  ylable()




% %%图片取反
% I0=imread('3.jpg');
% I1=rgb2gray(I0);
% subplot(2,2,1);
%     imshow(I0);
%     title('原图');
% subplot(2,2,2);
%     Ineg=I0;
%     Ineg(:,:,1)=255-I0(:,:,1);
%     Ineg(:,:,2)=255-I0(:,:,2);
%     Ineg(:,:,3)=255-I0(:,:,3);
%     imshow(Ineg);
%     title('彩色取反');
% subplot(2,2,3);
%     Igray=I1;
%     Igray(:)=255-I1(:);
%     imshow(Igray);
%     title(灰度取反');
%  subplot(2,2,4);
%     Ibw=im2bw(I1);
%     Ibw(:)=1-I1(:);
%     imshow(Ibw);
%     title('黑白取反');


%%%%%%%%%%%%直方图修�?线�?变换 灰度变换  g(x,y)=c+k[f(x,y)-a]

%%%%%%分段线�?变换
%%%%%%%%%%对数变换g(x,y)=lamnbda log[1+f(x,y)]
%%%%%%可对图像的低灰度区较大的拉伸而对高灰度区压缩�?%%%%%%%采用这种变换,使图像灰度分布与人的视觉特�?相匹�?
%%%%%%%%%%指数变换g(x,y)=lamnbda log[epsilon+f(x,y)]^gama
%%%%%%%%%能对图像的高灰度区给予较大的拉伸�?


%%%%%%%%%%%直方图均衡化
%%%列出图像灰度�?%%%统计原图像各灰度级像素个数ni
%%%计算原始直方�?%%%计算累计直方�?%%%计算变换后的灰度�?%%%确认灰度变换关系
%%%统计变换后各灰度级的像素个数n_j
%%%计算变换后图像的直方�?

%%%%%%%%%%%%%%%%%%%%%
%%GLG
%%扩展-压缩




