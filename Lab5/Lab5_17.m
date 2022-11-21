% interp_image.m
clear all; close all;

img = imread('Lena256.bmp');
scale = 1;
[M,N]=size(img);
[X,Y]=meshgrid(1:M,1:N);
imgRes = imresize(img,scale);
[MRes,NRes] = size(imgRes);
[XRes, YRes] = meshgrid(1:MRes,1:NRes);
imgResN = imresize(img,scale,"nearest"); %Zeskalowane obrazy 1:1 z interpolacja
imgResL = imresize(img,scale,"bilinear");
imgResB = imresize(img,scale,"box");
imgResC = imresize(img,scale,"cubic");
figure; imshow(img); pause
% [Xi,Yi]=meshgrid( M/2-20 : 0.025 : M/2+20, N/2-20 : 0.025 : N/2+20 );
% img1 = uint8( interp2( X,Y,double(img),Xi,Yi,'nearest') );
% img2 = uint8( interp2( X,Y,double(img),Xi,Yi,'linear') );
% img3 = uint8( interp2( X,Y,double(img),Xi,Yi,'spline') );
% img4 = uint8( interp2( X,Y,double(img),Xi,Yi,'cubic') );

% figure;
% subplot(221); imshow( img1 ); title('Nearest');
% subplot(222); imshow( img2 ); title('Linear');
% subplot(223); imshow( img3 ); title('Spline');
% subplot(224); imshow( img4 ); title('Cubic'); pause

figure;
subplot(231); imshow( imgRes ); title('ImResize');
subplot(232); imshow( imgResN ); title('Nearest');
subplot(233); imshow( imgResL ); title('Linear');
subplot(234); imshow( imgResB ); title('Box');
subplot(235); imshow( imgResC ); title('Cubic'); pause


a = pi/6;                                % kat rotacji
R = [ cos(a) -sin(a); sin(a) cos(a) ];   % macierz rotacji
for m=1:MRes
    for n=1:NRes
        work = R*[XRes(m,n); YRes(m,n)];       % rotacja wsp. (x,y)
        XR(m,n) = work(1,1);             % podstawienie nowego x
        YR(m,n) = work(2,1);             % podstawienie nowego y
    end
end
imgRR  = interp2( XRes,YRes,double(imgRes),XR,YR);
imgRN = interp2( XRes,YRes,double(imgRes),XR,YR,'nearest');   % interpolacja obroconego RESIZE
imgRL = interp2( XRes,YRes,double(imgRes),XR,YR,'linear');
imgRS = interp2( XRes,YRes,double(imgRes),XR,YR,'spline');
imgRC = interp2( XRes,YRes,double(imgRes),XR,YR,'cubic');


for m=1:M
    for n=1:N
        work = R*[X(m,n); Y(m,n)];       % rotacja wsp. (x,y)
        XR(m,n) = work(1,1);             % podstawienie nowego x
        YR(m,n) = work(2,1);             % podstawienie nowego y
    end
end
imgRRO  = interp2(X,Y,double(img),XR,YR);
imgRNO = interp2( X,Y,double(img),XR,YR,'nearest');   % interpolacja obroconego ORYGINAL
imgRLO = interp2( X,Y,double(img),XR,YR,'linear');
imgRSO = interp2( X,Y,double(img),XR,YR,'spline');
imgRCO = interp2( X,Y,double(img),XR,YR,'cubic');



[Xi,Yi]=meshgrid( 1 : 0.2 : M, 1 : 0.2 : N );      % zageszczenie punktow RESIZE
imgRi = interp2( XRes,YRes,imgRR,Xi,Yi);
imgRiN = interp2( XRes,YRes,imgRN,Xi,Yi,'nearest');
imgRiL = interp2( XRes,YRes,imgRL,Xi,Yi,'linear');
imgRiS = interp2( XRes,YRes,imgRS,Xi,Yi,'spline');
imgRiC = interp2( XRes,YRes,imgRC,Xi,Yi,'cubic');


imgRiO = interp2( X,Y,imgRRO,Xi,Yi);                % zageszczenie punktow ORIGINAL
imgRiNO = interp2( X,Y,imgRNO,Xi,Yi,'nearest');
imgRiLO = interp2( X,Y,imgRLO,Xi,Yi,'linear');
imgRiSO = interp2( X,Y,imgRSO,Xi,Yi,'spline');
imgRiCO = interp2( X,Y,imgRCO,Xi,Yi,'cubic');




figure;
subplot(231); imshow( uint8(imgRi) ); title('ImResize');
subplot(232); imshow( uint8(imgRiN) ); title('Nearest'); % wynik RESIZE
subplot(233); imshow( uint8(imgRiL) ); title('Linear');
subplot(234); imshow( uint8(imgRiS) ); title('Spline');
subplot(235); imshow( uint8(imgRiC) ); title('Cubic'); pause


figure;
subplot(231); imshow( uint8(imgRiO) ); title('ImResize Original');
subplot(232); imshow( uint8(imgRiNO) ); title('Nearest Original'); % wynik ORIGINAL
subplot(233); imshow( uint8(imgRiLO) ); title('Linear Original');
subplot(234); imshow( uint8(imgRiSO) ); title('Spline Original');
subplot(235); imshow( uint8(imgRiCO) ); title('Cubic Original'); pause

l_err_abs_sum = 0;
for i = 1:M
   x_var_index = find(imgRiO(i,1) == imgRi(i,1));
   y_var_index = find(imgRiO(1,i) == imgRi(2,i));
   l_err_abs_sum = l_err_abs_sum + abs(imgRes(y_var_index,x_var_index)-img(y_var_index,x_var_index));
end

l_err_abs_sum,






