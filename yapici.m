function y = yapici(img, sqSize)
coMatrix = zeros(sqSize^2 ,6);
for krow = 1:sqSize
    for kcol = 1:sqSize
        coMatrix((krow - 1) * sqSize + kcol, 1) = power(kcol, 3);
        coMatrix((krow - 1) * sqSize + kcol, 2) = power(kcol, 2);
        coMatrix((krow - 1) * sqSize + kcol, 3) = kcol;
        coMatrix((krow - 1) * sqSize + kcol, 4) = power(krow, 3);
        coMatrix((krow - 1) * sqSize + kcol, 5) = power(krow, 2);
        coMatrix((krow - 1) * sqSize + kcol, 6) = krow;
        coMatrix((krow - 1) * sqSize + kcol, 7) = 1;
     end
end

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

Rb = yap(coMatrix, R, sqSize);
Gb = yap(coMatrix, G, sqSize);
Bb = yap(coMatrix, B, sqSize);

nR = uint8(yap2(R, Rb, sqSize));
nG = uint8(yap2(G, Gb, sqSize));
nB = uint8(yap2(B, Bb, sqSize));

rgb = cat(3, nR, nG, nB);
y = rgb;
end
