RGB=imread('1.jpg');
I=rgb2gray(RGB);
J=imnoise(I,'gaussian',0,0.005);    %手动添加高斯噪声
%J=imnoise(I,'salt & pepper',0.02);    %手动添加椒盐噪声
FFT=fft2(J);%shift


IFFT_0=uint8(ifft2(FFT));


[a,b]=size(FFT);
a0=round(a/2);
b0=round(b/2);
X=1:1:a;
Y=1:1:b;

h=zeros(a,b);
%%%%%%%%%理想高通滤波器1
n1=10;%确定范围
disnoise_1=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance <= n1
            h(i,j) = 0; 
        else
            h(i,j)=1;
        end;
        disnoise_1(i,j)=h(i,j)*disnoise_1(i,j);
    end;
end;
IFFT_1=uint8((ifft2(ifftshift(disnoise_1))));
H1=h;


% surf(X, Y, h,'Facecolor','interp','Edgecolor','none','Facelighting','phong'); 


%%%%%%%%%理想高通滤波器2
n2=100;%确定范围
disnoise_2=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance <= n2
            h(i,j)=0;
        else
            h(i,j)=1;
        end;
        disnoise_2(i,j)=h(i,j)*disnoise_2(i,j);
    end;
end;
IFFT_2=uint8((ifft2(ifftshift(disnoise_2))));
H2=h;

%%%%%%%% Butterworth滤波器

D_3=10;%通带半径
n3=2;%滤波次数
disnoise_3=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        h(i,j)=1-1/(1+(distance/D_3)^(2*n3));
        disnoise_3(i,j)=h(i,j)*disnoise_3(i,j);
    end;
end;
IFFT_3=uint8((ifft2(ifftshift(disnoise_3))));
H3=h;

%%%%%%%% 指数滤波器

D_4=20;%通带半径
n4=2;%滤波次数
disnoise_4=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        h(i,j)=1-expm(-(distance/D_4)^n4);
        disnoise_4(i,j)=h(i,j)*disnoise_4(i,j);
    end;
end;
IFFT_4=uint8((ifft2(ifftshift(disnoise_4))));
H4=h;




%%%%%%%% 高斯滤波器

D_5=20;%通带半径
disnoise_5=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        h(i,j)=1-expm(-(distance^2/(2*D_5^2)));
        disnoise_5(i,j)=h(i,j)*disnoise_5(i,j);
    end;
end;
IFFT_5=uint8(ifft2(ifftshift(disnoise_5)));
H5=h;


%%%%%%%% 梯形高通滤波器

D_6_1=20;%通带半径
D_6_2=40;
disnoise_6=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance<D_6_1
            h(i,j)=0;
        else
            if distance<=D_6_2
                h(i,j)=1-((distance-D_6_2)/(D_6_1-D_6_2));
            else
                h(i,j)=1;
            end;
        end;
        disnoise_6(i,j)=h(i,j)*disnoise_6(i,j);
    end;
end;
IFFT_6=uint8(ifft2(ifftshift(disnoise_6)));
H6=h;




% surf(X, Y, h,'Facecolor','interp','Edgecolor','none','Facelighting','phong'); 

figure(1);
subplot(4,6,1)
    imshow(I);
    title('origin');
subplot(4,6,2)
    imshow(J);
    title('origin + gaussian noise');
subplot(4,6,3)
    imshow(fftshift(log((fft2(J)))),[]);
    title('spectrum取log');
subplot(4,6,4)
    imshow(IFFT_0);
    title('直接反傅里叶变换');
subplot(4,6,7)
    imshow(disnoise_1);
    title('理想高通滤波器1频谱');
subplot(4,6,8)
    surf(X, Y, H1,'Facecolor','interp','Edgecolor','none','Facelighting','phong');
    title('理想高通滤波器1函数三维曲面图');    
subplot(4,6,9)
    imshow(IFFT_1);
    title('理想高通滤波1');
subplot(4,6,10)
    imshow(disnoise_2);
    title('理想高通滤波器2频谱');
subplot(4,6,11)
    surf(X, Y, H2,'Facecolor','interp','Edgecolor','none','Facelighting','phong');
    title('理想高通滤波器2函数三维曲面图');  
subplot(4,6,12)
    imshow(IFFT_2);
    title('理想高通滤波2');
subplot(4,6,13)
    imshow(disnoise_3);
    title('butterworth滤波器频谱');
subplot(4,6,14)
    surf(X, Y, H3,'Facecolor','interp','Edgecolor','none','Facelighting','phong');
    title('butterworth函数三维曲面图');      
subplot(4,6,15)
    imshow(IFFT_3);
    title('butterworth滤波');
subplot(4,6,16)
    imshow(disnoise_4);
    title('指数滤波器频谱');
subplot(4,6,17)
    surf(X, Y, H4,'Facecolor','interp','Edgecolor','none','Facelighting','phong');
    title('指数函数三维曲面图');      
subplot(4,6,18)
    imshow(IFFT_4);
    title('指数滤波');
subplot(4,6,19)
    imshow(disnoise_5);
    title('高斯滤波器频谱');
subplot(4,6,20)
    surf(X, Y, H5,'Facecolor','interp','Edgecolor','none','Facelighting','phong');
    title('高斯函数三维曲面图');      
subplot(4,6,21)
    imshow(IFFT_5);
    title('高斯滤波');
subplot(4,6,22)
    imshow(disnoise_6);
    title('梯形滤波器频谱');
subplot(4,6,23)
    surf(X, Y, H6,'Facecolor','interp','Edgecolor','none','Facelighting','phong');
    title('梯形函数三维曲面图');      
subplot(4,6,24)
    imshow(IFFT_6);
    title('梯形滤波');

