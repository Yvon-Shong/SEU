p= imread('2.jpg');
figure;  
subplot(2,3,1);
imshow(p);  
title('Ô­Í¼Ïñ');

subplot(2,3,2);
I = rgb2gray(p); 
imshow(I);  
title('»Ò¶ÈÍ¼Ïñ');

[m,n]=size(I);
F=fftshift(fft2(I)); 
k=0.0025; 
for u=1:m      
  for  v=1:n        
  H(u,v)=exp((-k)*(((u-m/2)^2+(v-n/2)^2)^(5/6)));    
  end
end	 
G=F.*H; 

I0=real(ifft2(fftshift(G))); 
I1=imnoise(uint8(I0),'gaussian',0,0.001); 

subplot(2,3,3);
imshow(uint8(I1));
title('ÍË»¯Í¼Ïñ'); 

F0=fftshift(fft2(I1)); 
F1=F0./H; 
I2=ifft2(fftshift(F1)); 

subplot(2,3,4);
imshow(uint8(I2));
title('ÄæÂË²¨¸´Ô­Í¼'); 

K=0.1;                  
for u=1:m    
   for  v=1:n      
   H(u,v)=exp(-k*(((u-m/2)^2+(v-n/2)^2)^(5/6)));        
   H0(u,v)=(abs(H(u,v)))^2;      
   H1(u,v)=H0(u,v)/(H(u,v)*(H0(u,v)+K));    
   end 
end 

F2=H1.*F0; 
I3=ifft2(fftshift(F2)); 

subplot(2,3,5);
imshow(uint8(I3));
title('Î¬ÄÉÂË²¨¸´Ô­Í¼');
