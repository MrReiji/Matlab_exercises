clear; close all;

referencePoint1 = [1;
                   1;
                   1;
                   1];

plotOrigin([-5,5],[-5,5],[-5,5], [0,0,0]);
axis off;
plot3(referencePoint1(1),referencePoint1(2),referencePoint1(3), 'ok');


newPoint1 = affineMatrix(1,1,0,1,1,0,1,1,1,1,0,1) * referencePoint1;


plot3(newPoint1(1),newPoint1(2),newPoint1(3), 'ok');