pkg load image;

img_entrada = imread('pratica7.png');

img_entrada = im2double(img_entrada);

[height, width] = size(img_entrada);

x = fft2(img_entrada, height*2, width*2);

transformada_fourier_centralizada = fftshift(x);

espectro = uint8(abs(transformada_fourier_centralizada));

imwrite(espectro, "espectro.png");

P = height * 2;
Q = width * 2;

filtro = ones(P, Q, "double");

for i=1:P
   for j=1:Q
       if (j > ((Q/2) - 8) 
         && j < ((Q/2) + 8))   
          filtro(i,j) = 0;
       endif
       if (j > ((Q/2) - 40) 
         && j < ((Q/2) + 40)
         (i > ((P/2) - 40) 
         && i < ((P/2) + 40)))
         filtro(i,j) = 1;
       endif
   endfor
endfor

imwrite(filtro,"filtro.png");

resultado = transformada_fourier_centralizada .* filtro;

A = ifftshift(resultado);

z = real(ifft2(A));

img_saida = im2uint8(z);

imwrite(img_saida(1:height, 1:width),"resultado.png");



