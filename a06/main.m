pkg load image;

img_entrada = imread('pratica6.png');

img_entrada = im2double(img_entrada);

[height, width] = size(img_entrada);

# Para evitar o erro de wraparound temos que fazer o zero padding. 
# Passamos o dobro de height e width, o valor de PxQ. A dimensão da transformada é de 512x512, como pode ser visto pelo resultado da função size.
x = fft2(img_entrada, height*2, width*2);
size(x)

transformada_fourier_centralizada = fftshift(x);

transformada_fourier = uint8(abs(transformada_fourier_centralizada));

figure(1);
# imwrite(transformada_fourier, "espectro_de_fourier.jpg");
imshow(transformada_fourier);

P = height * 2;
Q = width * 2;

filtro_passa_baixa_gaussiano = zeros(P, Q, "double");

D0 = 20;

for u=0:P-1
  for v=0:Q-1
    filtro_passa_baixa_gaussiano(u+1,v+1) = e^((-(sqrt(((u-P/2)^2) + ((v-Q/2)^2)))^2) / (2*D0^2));
  endfor
endfor

figure(2);
# imwrite(filtro_passa_baixa_gaussiano, "filtro_passa_baixa_gaussiano.jpg");
imshow(filtro_passa_baixa_gaussiano);

x = transformada_fourier_centralizada .* filtro_passa_baixa_gaussiano;

A = ifftshift(x);

z = real(ifft2(A));

img_saida = im2uint8(z);

figure(3);
# imwrite(img_saida(1:height, 1:width),"img_final.jpg");
imshow(img_saida(1:height, 1:width));
