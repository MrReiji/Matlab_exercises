close all;
babiaGora = load('babia_gora.dat');
M = [
   1 0 0;
   0 1 0;
   0 0 1;
];
b = [0 0 0];
surfl( afn(babiaGora, rotationMatrixDeg(45, 0, 0)*M, b));
babiaGora(:, 1)
figure; myPlot(babiaGora);
function [Y] = afn(P, A, b)
   Y = P*A + b;
end
function myPlot(P)
   plot3(P(:, 1), P(:, 2), P(:, 3), '-');
end
function [A] = rotationMatrix(yaw, pitch, roll)
   % (yaw, pitch, roll) are rotations about: (z, y, x)
   A = [
       [cos(yaw)*cos(pitch)    cos(yaw)*sin(pitch)*sin(roll)-sin(yaw)*cos(roll)    cos(yaw)*sin(pitch)*cos(roll)+sin(yaw)*sin(roll)    ];
       [sin(yaw)*cos(pitch)    sin(yaw)*sin(pitch)*sin(roll)+cos(yaw)*cos(roll)    sin(yaw)*sin(pitch)*cos(roll)-cos(yaw)*sin(roll)    ];
       [-sin(pitch)            cos(pitch)*sin(pitch)                               cos(pitch)*cos(yaw)                                 ];
   ];
end
function [A] = rotationMatrixDeg(yaw, pitch, roll)
   A = rotationMatrix(yaw/360*2*pi, pitch/360*2*pi, roll/360*2*pi);
end

