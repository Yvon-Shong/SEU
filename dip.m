%x=[1 5 8 ; 6 3 1]
%y=[5 6 8; 7 3 1]
%函数定义行 
%global <-> 局部变量

%%函数
% funtion mean(x);
% [m,n]= size(x);
% if m==1
%    m=n;
% end
% y=sum(x)/m;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%循环语句
% r=1;
% while r<10
%     r=r+1;
%     if r>7
%         r
%         break;
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %switch表达式
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
% %图像处理
% img = imread('123.png');
% %I = rgb2gray(img);
% imshow(img);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %subplot同屏显示与灰度化
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
%%作图
% I=zeros(100,100);
% for i=1:1:100
%     for j=1:100
%         if(i>10&&i<90)&&(j>10&&j<90)
%             I(i,j)=255;
%         end
%     end
% end


rgb3=imread('3.jpg');
I=rgb2gray(rgb3);
%傅里叶变换
FFT=fft2(I);

%反傅里叶变换
IFFT=ifft2(FFT);

figure(1);
subplot(2,2,1)
imshow('3.jpg');
subplot(2,2,2)
imshow(I);
subplot(2,2,3)
imshow(FFT);
subplot(2,2,4)
imshow(IFFT);








