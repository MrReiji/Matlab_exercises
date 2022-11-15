function [Dop] = create_dop_matrix(A, row_index, column_index)
Dop = A;
Dop(row_index,:) = [];          %Ta funkcja oblicza macierz dopełnienia
Dop(:,column_index) = [];
end
