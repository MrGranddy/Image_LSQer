function y = bicubic_interpolation_resize(img)
[n, m] = size(img);
resized = zeros(floor(n * 1.5), floor(m * 1.5));
% 2x2 will become 3x3
n = floor(n / 2);
m = floor(m / 2);
grid = zeros(2, 2, n, m);

for row = 2:n
    for col = 2:m
        grid(1,1, row, col) = img((row-1)*2 + 1, (col-1)*2 + 1);
        grid(2,1, row ,col) = img((row-1)*2 + 2, (col-1)*2 + 1);
        grid(1,2, row, col) = img((row-1)*2 + 1, (col-1)*2 + 2);
        grid(2,2, row, col) = img((row-1)*2 + 2, (col-1)*2 + 2);
    end
end % Breaking image into pieces

for row = 2:n-1
    for col = 2:m-1
        resized((row-1) * 3 + 1, (col-1) * 3 + 1) = grid(1,1,row,col);
        resized((row-1) * 3 + 3, (col-1) * 3 + 1) = grid(2,1,row,col);
        resized((row-1) * 3 + 1, (col-1) * 3 + 3) = grid(1,2,row,col);
        resized((row-1) * 3 + 3, (col-1) * 3 + 3) = grid(2,2,row,col);
        resized((row-1) * 3 + 2, (col-1) * 3 + 1) =...
            (3*grid(2,1,row,col) + 5*grid(1,1,row,col) +...
            grid(2,1,row-1,col) - grid(1,1,row+1,col))/8;
        resized((row-1) * 3 + 2, (col-1) * 3 + 3) =...
            (3*grid(2,2,row,col) + 5*grid(1,2,row,col) +...
            grid(2,2,row-1,col) - grid(1,2,row+1,col))/8;
        resized((row-1) * 3 + 1, (col-1) * 3 + 2) =...
            (3*grid(1,2,row,col) + 5*grid(1,1,row,col) +...
            grid(1,2,row,col-1) - grid(1,1,row,col+1))/8;
        resized((row-1) * 3 + 3, (col-1) * 3 + 2) =...
            (3*grid(2,2,row,col) + 5*grid(2,1,row,col) +...
            grid(2,2,row,col-1) - grid(2,1,row,col+1))/8;
        resized((row-1) * 3 + 2, (col-1) * 3 + 2) = 0;
        for krow = 1:3
            for kcol = 1:3
                if krow ~= 2 || kcol ~= 2
                    resized((row-1) * 3 + 2, (col-1) * 3 + 2) =...
                        resized((row-1) * 3 + 2, (col-1) * 3 + 2) +...
                        resized((row-1) * 3 + krow, (col-1) * 3 + kcol) / 8;
                end
            end
        end 
    end
end
% Here happens the bicubic interpolation, all coefficients calculated on
% paper soo definetely a bad way to do it but it happened, hope I'll fix
% someday
            
y = uint8(resized);
end
        