pkg load image;

# carregar a imagem de entrada
img_entrada = imread("imagem.jpg");

# pegar o tamanho da imagem de entrada
[height, width] = size(img_entrada);

# cria matriz para a imagem de saída
img_saida = zeros(height, width, "uint8");

vetor = ones (0, 255);

sk = ones (0, 255);
pr = ones (0, 255);

[counts, x] = imhist(img_entrada);

# histograma imagem inicial
figure (1);
imhist(img_entrada)

division = width*height; 
  
# valores de pr
for k=0:255
   pr(k+1) = counts(k+1) / division;
endfor

# valores de sr
for i=0:255
  sk(i+1) = 255 * pr(i+1);
  if(i != 0)
    sk(i+1) = sk(i+1) + sk(i);
  endif
endfor

# arredondamento dos valores de s
for i=0:255
  vetor(i+1) = round(sk(i+1));
endfor

# aplicar equalização de histograma na imagem
for i=1:height
  for j=1:width
    if(img_entrada(i,j) != 0)
      img_saida(i,j) = vetor(img_entrada(i,j)+1);
    endif
  endfor
endfor

# histograma imagem final
figure (2);
imhist(img_saida);

# Plotar o gráfico de T(r)
figure(3);
plot(0:255,vetor)
axis([0, 255, 0, 255])

# salvar a imagem final no disco
imwrite(img_saida, "img_saida.jpg");