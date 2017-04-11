function y = yap2(img, katsayilar, sqSize)
[m, n] = size(img);
new = zeros(m,n);
for row = 1:floor(m/sqSize)
    for col = 1:floor(n/sqSize)
        for krow = 1:sqSize
            for kcol = 1:sqSize
                new((row-1)*sqSize + krow, (col-1)*sqSize + kcol) = katsayilar(1,(row-1)*floor(n/sqSize) + col)*kcol^5 + katsayilar(2,(row-1)*floor(n/sqSize) + col)*kcol^4 + katsayilar(3,(row-1)*floor(n/sqSize)+col) * kcol^3 + katsayilar(4,(row-1)*floor(n/sqSize) + col)*kcol^2 + katsayilar(5, (row-1)*floor(n/sqSize) + col)*kcol + katsayilar(6, (row-1)*floor(n/sqSize) + col) * krow^5 + katsayilar(7, (row-1)*floor(n/sqSize) + col) * krow^4 + katsayilar(8, (row-1)*floor(n/sqSize) + col) * krow^3 + katsayilar(9, (row-1)*floor(n/sqSize) + col) * krow^2 + katsayilar(10, (row-1)*floor(n/sqSize) + col) * krow + katsayilar(11, (row-1)*floor(n/sqSize) + col);
            end
        end
    end
end
y = new;
end
                
        