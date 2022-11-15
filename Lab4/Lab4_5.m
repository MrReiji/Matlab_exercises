close all; clear all;

disp("Czesc pierwsza");

A = [1 2; ...
    3 4],
A_odwr = odwrot_rzad2(A),
if A_odwr == 0
   disp("Zacznij od początku")
else
   A_corr = odwrot_rzad2(A_odwr),
   if(A == A_corr)
       disp("Odwrócenie prawidłowe");
   end
end
 
%-----------------------------

disp("Czesc druga");

B = [1 21 3; ...
    4 51 6;
    7 8 9];
    
disp(det(B));
U = odwrot_rzad3(B),
if U == 0
   disp(" ");
else
   disp(det(U));
   B_corr = odwrot_rzad3(U),
   if B_corr == 0
       disp(" ")
   else
       if B_corr == B
           disp("Wszystko zadziałało poprawnie")
       end
   end
end
err = max(abs(B - B_corr)),

%-----------------------------

disp("Czesc trzecia");

C = [1 2 3 4; ...
    3 4 6 8;
    9 10 2 12
    9 11 15 3];
N = size(C);
Z = zeros(N(1), N(1));
C_inv = odwrot_recursive(C, N(1), N(1), N(1), Z);
N = size(C_inv);
C_corr = odwrot_recursive(C_inv, N(1), N(1), N(1), Z),


