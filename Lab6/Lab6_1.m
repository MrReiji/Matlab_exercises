clear all, close all;

% A * x = b
% a = inv(A.'*A)*A.'*b

A = [1,1;2,1;3,1;4,1;5,1;6,1];
b = [3;5;7;9;11;13];
a = inv(A.'*A)*A.'*b;

disp(a);

