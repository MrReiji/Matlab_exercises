% matrix_obiekt3D.m
clear all; close all;

load('X.mat');
size(X);
figure; grid; plot3( X(:,1), X(:,2), X(:,3), 'b.' ); pause

x = X(:,1); y = X(:,2); z = X(:,3);
vmin = min( min(x), min(y) ); % min
vmax = max( max(x), max(y) ); % max
[xi,yi] = meshgrid( vmin : (vmax-vmin)/200 : vmax ); % dopasowanie zakresu
zi = griddata( x, y, z, xi, yi,  'linear' ); % interp: nearest, linear, spline, cubic
figure; surf( xi,yi,zi ); pause % rysunek

XR = [1,1,1,1;1,1,1,1;1,1,1,1;0,0,0,1] * X;
figure; grid; plot3( XR(1,:), XR(2,:), XR(3,:), 'b.' ); % wynik transformacji afinicznej
