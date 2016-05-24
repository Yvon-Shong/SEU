RGB=imread('1.jpg');
I=rgb2gray(RGB);

J=deconvwnr(I,PSF,estimated_nsr);
%J=imnoise(I,'gaussian',0,0.005)         %手动添加高斯噪声
PSF=fspecial('motion',LEN,THETA)


=---------------------------------------------------------------------------------------
% FFT=fft2(J);%shift
% 
% 
% IFFT_0=uint8(ifft2(FFT));
% 
% 
% [a,b]=size(FFT);
% a0=round(a/2);
% b0=round(b/2);
% 
% 
% %%%%%%%%%理想低通滤波器1
% n1=10;%确定范围
% disnoise_1=fftshift(FFT);
% for i=1:a
%     for j=1:b
%         distance=sqrt((i-a0)^2+(j-b0)^2);
%         if distance <= n1
%             h=1;
%         else
%             h=0;
%         end;
%         disnoise_1(i,j)=h*disnoise_1(i,j);
%     end;
% end;
% IFFT_1=uint8((ifft2(ifftshift(disnoise_1))));


% 
% 
% figure(1);
% subplot(4,4,1)
%     imshow(I);
%     title('origin');
% subplot(4,4,2)
%     imshow(J);
%     title('origin + gaussian noise');
% subplot(4,4,3)
%     imshow(fftshift(log((fft2(J)))),[]);
%     title('spectrum取log');
% subplot(4,4,4)
%     imshow(IFFT_0);
%     title('直接反傅里叶变换');
