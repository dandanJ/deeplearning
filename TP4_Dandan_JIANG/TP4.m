%Part1 Image restoration(gaussian noise)
%proximal operators
%Q1:
u0=imread('cameraman.tif');
%u0=rgb2gray(imread('panda.jpg'));
imagesc(u0)
colormap gray
u=double(u0);
z=projection_PB(u);
%f1=add_gaussion_noise(u,10);
f=add_gaussion_noise(u,10);%
figure()
imagesc(f)
colormap gray
lambda=0.00001;h=150;K=127;k=30;tau=0.1;%lambda=0.00001,Kopt=127
%lambda=0.005;h=15;K=150;k=30;tau=0.1;
% %lambda=0.00001;h=150;K=100;k=30;tau=0.01;%
 [FB,J]=Forward_Backward(lambda,h,f,K,k,tau);%much more better than before
figure()
imagesc(FB)
colormap gray;
figure()
plot(J);
R=FB-f;%resduial map
figure()
imagesc(R)
colormap gray;
R2=f-u;
figure()
imagesc(R2)
colormap gray;

%Q2:FISTA
lambda=0.00001;h=150;K=37;k=30;tau=0.1;%lambda=0.0001,Kopt=39
%lambda=0.005;h=15;K=100;k=30;tau=0.1;
[FI,J1]=FISTA(f,lambda,h,K,k,tau);
figure()
plot(J1)
figure
imagesc(FI)
colormap gray;
figure()
subplot(2,3,1);imagesc(u0);colormap gray;title('u');
subplot(2,3,2);imagesc(f);colormap gray;title('noise map 10');
subplot(2,3,3);imagesc(FB);colormap gray;title('FB image');
subplot(2,3,5);imagesc(R);colormap gray;title('Residual image of FB');
subplot(2,3,4);imagesc(R2);colormap gray;title('Residual image of u');
subplot(2,3,6);imagesc(FI);colormap gray;title('FISTA image');
figure()
subplot(1,2,1);plot(J);title('Energy value of FB');
subplot(1,2,2);plot(J1);title('Energy value of FISTA');

%Part2 Image restoration(salt and peper noise)
f2=double(imnoise(u0,'salt & pepper', 0.02));%the noise density is 0.02
% figure()
% imagesc(f2)
% colormap gray;
% lambda=1;
% lambda2=15;
% tau=15;
% sigma=15;
% 
% %tau=1;
% %tau=0.99/sqrt(8*lambda^2);
% %sigma=0.99/sqrt(8*lambda^2);
% CP=Chambolle_Pock(f2,0.00001,150,100,0.01,lambda2);
% figure()
% imagesc(CP)
% colormap gray;
% res=f2-u;
% res1=f2-CP;
% figure()
% imagesc(res)
% colormap gray;
% figure()
% imagesc(res1)%
% colormap gray;
% res2=res-res1;
% figure()
% imagesc(res2)
% colormap gray;
% subplot(2,2,1);imagesc(f2);title('salt & pepper');
% subplot(2,2,2);imagesc(CP);title('Chambolle_Pock');
% subplot(2,2,3);imagesc(res);title('Residual image of u');
% subplot(2,2,4);imagesc(res1);title('Residual image of CP');

%part3 Image deconvolution
% lambda=0.001;
% tau=0.99/sqrt(8*lambda^2);
% K=180;k=30;h=150;
% [D,J3]=Deconv(lambda,h,f,K,k,tau);
% figure()
% imagesc(D)
% colormap gray;
% figure()
% plot(J3)
% 
% K=160;k=30;h=15;
% [D_fista,J4]=Deconv_fista(f,lambda,h,K,k,tau);
% figure()
% imagesc(D_fista)
% colormap gray;
% figure()
% plot(J4)
% figure()
% subplot(1,3,2);imagesc(D);colormap gray;title('Denconvolution image');
% subplot(1,3,3);imagesc(D_fista);colormap gray;title('Denconvolution_Fista image');
% subplot(1,3,1);imagesc(f);colormap gray;title('noised image');
% figure()
% subplot(1,2,1);plot(J3);title('Denconvolution Energy');
% subplot(1,2,2);plot(J4);title('Denconvolution_Fista Energy');

%part4 Image deconvolution (salt and peper noise)




%Part5 Inpainting
% lambda=0.005;
% tau=0.01;
% K=15;k=6;h=10;
% f1=im2double(imread('Im2.png'));
% figure()
% imagesc(f1)
% colormap gray;
% Mask= im2double(imread('Im2_mask.png'));
% figure()
% imagesc(Mask)
% colormap gray;
% [Inpainting,J5]=Inpaint_1(f1,K,lambda,h,k,tau,Mask);
% figure()
% imagesc(Inpainting)
% colormap gray; 
% figure()
% plot(J5)
% subplot(2,2,1);imagesc(f1);colormap gray;title('Original Image');
% subplot(2,2,2);imagesc(Mask);colormap gray;title('Mask');
% subplot(2,2,4);plot(J5);title('Inapinting Energy');
% subplot(2,2,3);imagesc(Inpainting);colormap gray;title('Solution');

