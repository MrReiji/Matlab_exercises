clear all; close all;

%m = 3;
%A = rand(m,m),

%A = [1,2,3,4,5;4,2,3,4,1;5,6,3,2,4;5,3,4,5,6;2,3,4,5,2],
A = [1,2,3;4,2,1;2,3,5];

B = [1,2,3;2,8,10;3,10,22];


[L1,U1] = myLu(A,0),
[L2,U2] = myLu(A,1),
[L3,U3] = myLu(A,3),
[L4,U4] = lu(A),

[L_ch1,U_ch1] = myLu(B,2),
[U_ch2] = chol(B),



if(A == L1*U1)
    disp("Prosciej, wolniej: A == L*U");
else
    disp("Prosciej, wolniej: A != L*U");
end 


if(A == L2*U2)
    disp("Wg wzoru: A == L*U");
else
    disp("Wg wzoru: A != L*U");
end


if(A == L3*U3)
    disp("Trudniej, szybciej: A == L*U");
else
    disp("Trudniej, szybciej: A != L*U");
end    


if(A == L4*U4)
    disp("Funkcja matlaba: A == L*U");
else
    disp("Funkcja matlaba: A != L*U");
end 


if(B == L_ch1*U_ch2)
    disp("Dekompozycja Choleskiego: B == U*U.'");
else
    disp("Dekompozycja Choleskiego: B != U*U.'");
end 


if(B == U_ch2.'*U_ch2)
    disp("Dekompozycja Choleskiego z matlaba: B == U*U.'");
else
    disp("Dekompozycja Choleskiego z matlaba: B != U*U.'");
end 