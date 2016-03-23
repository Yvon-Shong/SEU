rgb3=imread('pic.jpg');
I=rgb2gray(rgb3);

FFT=fft2(I);
IFFT=ifft2(FFT);
M1=double(I)-IFFT;
M2=I-uint8(IFFT);

% figure(1);
% subplot(2,2,1)
%     imshow(I);
%     title('the original gray picture');
% subplot(2,2,2)
%     imshow(FFT); 
%      title('the spectrum after FFT');
% subplot(2,2,3)
%     imshow(fftshift(log(1+abs(FFT))),[]);
%      title('shift -> (log(1+abs(the spectrum))');
% subplot(2,2,4)
%     imshow(uint8(IFFT));
%      title('ifft');

M_abs=abs(M1);
sum1=sum(M_abs(:))
%sum2=sum(M2(:))

     
% figure(2);
% subplot(1,2,1)
%     imshow(M1);
%     title('double(origin) - ifft');
% subplot(1,2,2)
%     imshow(M2); 
%      title('origin - uint8(ifft)');
     
% focus on the sum1 double(origin-iftt)
ans=0;
for i=1:1:232
    for j=1:1:300
        ans=ans+M_abs(i,j);
    end
end
ans


