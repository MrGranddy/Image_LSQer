function y = rotater(img, degree)
radian = (degree / 180) * pi;
[row, col] = size(img);
Nrow = ceil(sin(radian) * col + cos(radian) * row);
Ncol = ceil(cos(radian) * col + sin(radian) * row);
Nimg = ones(Nrow, Ncol) * 255;
rot_matrix = [cos(radian), -sin(radian); sin(radian), cos(radian)];
half_row = row / 2;
half_col = col / 2;
new_half_row = Nrow / 2;
new_half_col = Ncol / 2;
for n = 1:row
    for m = 1:col
        coordinates = rot_matrix * [half_row - n; m - 1 - half_col];
        coordinates = coordinates + [new_half_row; new_half_col];
        Nimg(round(Nrow - coordinates(1) + 1), round(Ncol - coordinates(2)) + 1) = img(n,m);
        Nimg(round(Nrow - coordinates(1) + 2), round(Ncol - coordinates(2)) + 1) = img(n,m);
        Nimg(round(Nrow - coordinates(1) + 1), round(Ncol - coordinates(2))) = img(n,m);
        Nimg(round(Nrow - coordinates(1) + 2), round(Ncol - coordinates(2))) = img(n,m);
    end
end
y = uint8(Nimg);
end