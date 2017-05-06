function y = rgb_rotater(img, degree)
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
R = rotater(R,degree);
G = rotater(G,degree);
B = rotater(B,degree);
y = cat(3, R, G, B);