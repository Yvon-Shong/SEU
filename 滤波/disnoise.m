RGB=imread('1.jpg');
I=rgb2gray(RGB);
J=imnoise(I,'gaussian',0,0.005);    %手动添加高斯噪声
%J=imnoise(I,'salt & pepper',0.02);    %手动添加椒盐噪声
FFT=fft2(J);%shift


IFFT_0=uint8(ifft2(FFT));


[a,b]=size(FFT);
a0=round(a/2);
b0=round(b/2);


%%%%%%%%%理想低通滤波器1
n1=10;%确定范围
disnoise_1=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance <= n1
            h=1;
        else
            h=0;
        end;
        disnoise_1(i,j)=h*disnoise_1(i,j);
    end;
end;
IFFT_1=uint8((ifft2(ifftshift(disnoise_1))));


%%%%%%%%%理想低通滤波器2
n2=100;%确定范围
disnoise_2=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance <= n2
            h=1;
        else
            h=0;
        end;
        disnoise_2(i,j)=h*disnoise_2(i,j);
    end;
end;
IFFT_2=uint8(real(ifft2(ifftshift(disnoise_2))));


%%%%%%%% Butterworth滤波器

D_3=10;%通带半径
n3=2;%滤波次数
disnoise_3=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        h=1/(1+(distance/D_3)^(2*n3));
        disnoise_3(i,j)=h*disnoise_3(i,j);
    end;
end;
IFFT_3=uint8(real(ifft2(ifftshift(disnoise_3))));


%%%%%%%% 指数滤波器

D_4=20;%通带半径
n4=2;%滤波次数
disnoise_4=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        h=expm(-(distance/D_4)^n4);
        disnoise_4(i,j)=h*disnoise_4(i,j);
    end;
end;
IFFT_4=uint8(real(ifft2(ifftshift(disnoise_4))));





%%%%%%%% 高斯滤波器

D_5=20;%通带半径
disnoise_5=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        h=expm(-(distance^2/(2*D_5^2)));
        disnoise_5(i,j)=h*disnoise_5(i,j);
    end;
end;
IFFT_5=uint8(real(ifft2(ifftshift(disnoise_5))));



%%%%%%%% 梯形低通滤波器

D_6_1=20;%通带半径
D_6_2=40;
disnoise_6=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        if distance<D_6_1
            h=1;
        else
            if distance<=D_6_2
                h=((distance-D_6_2)/(D_6_1-D_6_2));
            else
                h=0;
            end;
        end;
        disnoise_6(i,j)=h*disnoise_6(i,j);
    end;
end;
IFFT_6=uint8(real(ifft2(ifftshift(disnoise_6))));









figure(1);
subplot(4,4,1)
    imshow(I);
    title('origin');
subplot(4,4,2)
    imshow(J);
    title('origin + gaussian noise');
subplot(4,4,3)
    imshow(fftshift(log((fft2(J)))),[]);
    title('spectrum取log');
subplot(4,4,4)
    imshow(IFFT_0);
    title('直接反傅里叶变换');
subplot(4,4,5)
    imshow(disnoise_1);
    title('理想低通滤波器1频谱');
subplot(4,4,6)
    imshow(IFFT_1);
    title('理想低通滤波1');
    
subplot(4,4,7)
    imshow(disnoise_2);
    title('理想低通滤波器2频谱');
subplot(4,4,8)
    imshow(IFFT_2);
    title('理想低通滤波2');
subplot(4,4,9)
    imshow(disnoise_3);
    title('butterworth滤波器频谱');
subplot(4,4,10)
    imshow(IFFT_3);
    title('butterworth滤波');
subplot(4,4,11)
    imshow(disnoise_4);
    title('指数滤波器频谱');
subplot(4,4,12)
    imshow(IFFT_4);
    title('指数滤波');
subplot(4,4,13)
    imshow(disnoise_5);
    title('高斯滤波器频谱');
subplot(4,4,14)
    imshow(IFFT_5);
    title('高斯滤波');
subplot(4,4,15)
    imshow(disnoise_6);
    title('梯形滤波器频谱');
subplot(4,4,16)
    imshow(IFFT_6);
    title('梯形滤波');

