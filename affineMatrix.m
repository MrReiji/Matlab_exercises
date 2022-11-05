function affine_matrix = affineMatrix(a, b, c, d, e, f, g, h, i, j, k, l)

    affine_matrix = [a  b   c   d
                     e  f   g   h
                     i  j   k   l
                     0  0   0   1];
end