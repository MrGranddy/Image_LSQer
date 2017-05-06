function y = RGB_bicubic(RGB_img)
R = RGB_img(:,:,1);
G = RGB_img(:,:,2);
B = RGB_img(:,:,3);

Rn = bicubic_interpolation_resize(R);
Gn = bicubic_interpolation_resize(G);
Bn = bicubic_interpolation_resize(B);

img = cat(3, Rn, Gn, Bn);
y = img;
end