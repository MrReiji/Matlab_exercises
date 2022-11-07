% matrix_obiekt3D.m
clear all; close all;


load('babia_gora.dat');

x = babia_gora(:,1); y = babia_gora(:,2); z = babia_gora(:,3);


plot3( x, y, z, 'b-' );


ax = -45/180*pi; ay = -90/180*pi; az = 135/180*pi;
Rx = [ 1, 0, 0; 0, cos(ax), -sin(ax); 0, sin(ax), cos(ax) ]; % macierz rotacji wzg. x
Ry = [ cos(ay), 0, -sin(ay); 0, 1, 0; sin(ay), 0, cos(ay) ]; % macierz rotacji wzg. y
Rz = [ cos(az), -sin(az), 0; sin(az), cos(az), 0; 0, 0, 1 ]; % macierz rotacji wzg. z
XR = Rz * Ry * Rx * babia_gora', % 3 rotacje po kolei
hold on;

figure; grid; plot3( XR(1,:), XR(2,:), XR(3,:), 'g-' ); % wynik obrotu

hold off;


