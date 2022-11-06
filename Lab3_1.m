clear all; close all;

u = [1;2;3];
v = [4;5;6];
A = [1,2,3;4,5,6;7,8,9];
B = eye(3);

(u')*v,
u*(v.'),
A+B,
A*B,
(u.')*A,
A*u,
10*A,
(A+B)*u,
inv(A),
poly(A),
det(A),
rank(A),
(u.')*A*u,



