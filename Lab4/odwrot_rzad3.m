function [U] = odwrot_rzad3(A)
if det(A) == 0
   U = 0;
   disp("Wyznacznik nie może być równy 0!!!")
else
 N = size(A);
 Z = zeros(N(1),N(1));
 for i=1:N
    for j=1:N
       Matrix_dop = A;
       Matrix_dop(i,:) = [];
       Matrix_dop(:,j) = [];
       Z(i,j) = (-1).^(i+j) * det(Matrix_dop);
    end
  end
U = (1/(det(A))) * Z.';
end
