pkg load image;

img_entrada = imread("pratica4.jpg");

img_entrada = im2double(img_entrada);

filtro_media = ones(9, 9, "uint");

qtde_pixels_mascara = 81;

filtro_media = kron(1/qtde_pixels_mascara,filtro_media);


img_filtro_media = filter2(filtro_media, img_entrada);

# A Figura 1 (img_filtro_media) é apresentada com uma borda preta. Isso se dá por conta que para resolver o problema da borda(problema quando o centro da máscara se aproxima da borda da imagem), estamos utilizando a expansão da imagem com uma borda preta, que impacta no cálculo dos valores da média.  
imwrite(img_filtro_media, 'media_com_borda.jpg');


# adicionar bordas da imagem
img_filtro_media_sem_borda = padarray(img_entrada, [4,4], 'replicate');

# retirar bordas da imagem
img_filtro_media_sem_borda = filter2(filtro_media, img_filtro_media_sem_borda, 'valid');
imwrite(img_filtro_media_sem_borda, 'media_sem_borda.jpg');


filtro_sobel_01 = [-1,-2,-1; 
                    0, 0, 0; 
                    1, 2, 1];
                    
filtro_sobel_02 = [-1, 0, 1; 
                   -2, 0, 2; 
                   -1, 0, 1];

# adicionar bordas da imagem
img_sobel_01 = padarray(img_entrada, [1,1], 'replicate');
img_sobel_01 = filter2(filtro_sobel_01, img_sobel_01, 'valid');

# adicionar bordas da imagem
img_sobel_02 = padarray(img_entrada, [1,1], 'replicate');
img_sobel_02 = filter2(filtro_sobel_02, img_sobel_02, 'valid');

[width, height] = size(img_entrada);

for i=1:width
  for j=1:height
    img_final_sobel(i,j) = abs(img_sobel_01(i,j)) + abs(img_sobel_02(i,j));
  endfor
endfor

imwrite(img_final_sobel, 'sobel.jpg');

