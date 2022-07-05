pkg load image;

function img_saida = ruido_aditivo_gaussiano(img_entrada)
  img_saida = imnoise(img_entrada, "gaussian", 0, 0.25);
endfunction

function img_final = ruido_aditivo_randomico_gaussiano(img_entrada, n)  
  for i=1:n
    array_final{i} = ruido_aditivo_gaussiano(img_entrada);
  endfor  
  
  img_final = media_imagens(array_final, n);
endfunction

function img_final = media_imagens(array_img, n)  
  [height,width] = size(array_img{1}); 
  
  img_final = zeros(height, width, "double");
  
  for i=1:n
    img_final = img_final + array_img{i} * 1/n;
  endfor
endfunction

# A imagem com o menor valor de n foi a que obteve o pior resultado. Enquanto a com o maior valor de n obteve o melhor resultado.
# Ou seja, com a realização da média aritmética entre uma quantidade maior de imagens ruidosas, o resultado se assemelha mais a imagem original.

img_entrada = imread('pratica5.png');
img_final = ruido_aditivo_randomico_gaussiano(img_entrada, 8);
imwrite(img_final, "imagem8.jpg");

img_entrada = imread('pratica5.png');
img_final = ruido_aditivo_randomico_gaussiano(img_entrada, 16);
imwrite(img_final, "imagem16.jpg");

img_entrada = imread('pratica5.png');
img_final = ruido_aditivo_randomico_gaussiano(img_entrada, 64);
imwrite(img_final, "imagem64.jpg");