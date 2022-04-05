pkg load image;

img_baixo_contraste = imread("pollen.jpg");

[height, width] = size(img_baixo_contraste);

img_final = zeros(width, height, "uint8");

# Valores para (r1,s1) (r2,s2)
# teste 1
# r1 = 90; r2 = 190; s1 = 20; s2 = 220;

# teste 2
# r1 = 100; r2 = 200; s1 = 20; s2 = 160;

# teste 3
# r1 = 100; r2 = 180; s1 = 20; s2 = 200;

# teste 4
# r1 = 100; r2 = 160; s1 = 20; s2 = 200;

# teste 5
# r1 = 90; r2 = 130; s1 = 20; s2 = 210;

# teste 6
r1 = 90; r2 = 130; s1 = 16; s2 = 190;

# -------------------------------------------------------
# A melhor configuração de valores foi dada no teste 6, 
# que comparado aos outros casos de testes, está muito mais visível e próxima do resultado esperado apresentado na atividade. 
# -------------------------------------------------------

vetor = ones (0, 255);

# primeiro segmento de reta A:[xa: 0, ya: 0] até B:[xb: r1, yb: s1] 
m = (s1 - 0)/(r1-0);
for i = 0:r1
  vetor(i+1) = 0 + m * (i - 0);
endfor 
 
# segundo segmento de reta A:[xa: r1, ya: s1] até B:[xb: r2, yb: s2]
m = (s2 - s1)/(r2 - r1);
for i = r1:r2
  vetor(i+1) = s1 + m * (i - r1);
endfor 
   
# terceiro segmento de reta A:[xa: r2, ya: s2] até B:[xb: 255, yb: 255]
m =  (255 - s2)/(255-r2);
for i = r2:255
  vetor(i+1) = s2 + m * (i - r2);
endfor 

plot(0:255,vetor)

for i=1:height
  for j=1:width
    if(img_baixo_contraste(i,j) != 0)
      img_final(i,j) = vetor(img_baixo_contraste(i,j));
    endif
  endfor
endfor

imwrite(img_final, "pollen_corrigido.jpg");