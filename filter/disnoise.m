RGB=imread('1.jpg');
I=rgb2gray(RGB);
J=imnoise(I,'gaussian',0,0.005);    %�ֶ���Ӹ�˹����
%J=imnoise(I,'salt & pepper',0.02);    %�ֶ���ӽ�������
FFT=fft2(J);%shift


IFFT_0=uint8(ifft2(FFT));


[a,b]=size(FFT);
a0=round(a/2);
b0=round(b/2);


%%%%%%%%%�����ͨ�˲���1
n1=10;%ȷ����Χ
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


%%%%%%%%%�����ͨ�˲���2
n2=100;%ȷ����Χ
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
IFFT_2=uint8((ifft2(ifftshift(disnoise_2))));


%%%%%%%% Butterworth�˲���

D_3=10;%ͨ���뾶
n3=2;%�˲�����
disnoise_3=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        h=1/(1+(distance/D_3)^(2*n3));
        disnoise_3(i,j)=h*disnoise_3(i,j);
    end;
end;
IFFT_3=uint8((ifft2(ifftshift(disnoise_3))));


%%%%%%%% ָ���˲���

D_4=20;%ͨ���뾶
n4=2;%�˲�����
disnoise_4=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        h=expm(-(distance/D_4)^n4);
        disnoise_4(i,j)=h*disnoise_4(i,j);
    end;
end;
IFFT_4=uint8((ifft2(ifftshift(disnoise_4))));





%%%%%%%% ��˹�˲���

D_5=20;%ͨ���뾶
disnoise_5=fftshift(FFT);
for i=1:a
    for j=1:b
        distance=sqrt((i-a0)^2+(j-b0)^2);
        h=expm(-(distance^2/(2*D_5^2)));
        disnoise_5(i,j)=h*disnoise_5(i,j);
    end;
end;
IFFT_5=uint8(ifft2(ifftshift(disnoise_5)));



%%%%%%%% ���ε�ͨ�˲���

D_6_1=20;%ͨ���뾶
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
IFFT_6=uint8(ifft2(ifftshift(disnoise_6)));









figure(1);
subplot(4,4,1)
    imshow(I);
    title('origin');
subplot(4,4,2)
    imshow(J);
    title('origin + gaussian noise');
subplot(4,4,3)
    imshow(fftshift(log((fft2(J)))),[]);
    title('spectrumȡlog');
subplot(4,4,4)
    imshow(IFFT_0);
    title('ֱ�ӷ�����Ҷ�任');
subplot(4,4,5)
    imshow(disnoise_1);
    title('�����ͨ�˲���1Ƶ��');
subplot(4,4,6)
    imshow(IFFT_1);
    title('�����ͨ�˲�1');
    
subplot(4,4,7)
    imshow(disnoise_2);
    title('�����ͨ�˲���2Ƶ��');
subplot(4,4,8)
    imshow(IFFT_2);
    title('�����ͨ�˲�2');
subplot(4,4,9)
    imshow(disnoise_3);
    title('butterworth�˲���Ƶ��');
subplot(4,4,10)
    imshow(IFFT_3);
    title('butterworth�˲�');
subplot(4,4,11)
    imshow(disnoise_4);
    title('ָ���˲���Ƶ��');
subplot(4,4,12)
    imshow(IFFT_4);
    title('ָ���˲�');
subplot(4,4,13)
    imshow(disnoise_5);
    title('��˹�˲���Ƶ��');
subplot(4,4,14)
    imshow(IFFT_5);
    title('��˹�˲�');
subplot(4,4,15)
    imshow(disnoise_6);
    title('�����˲���Ƶ��');
subplot(4,4,16)
    imshow(IFFT_6);
    title('�����˲�');

