pkg load image;

img_sem_correcao = imread("tungsten_filament_shaded.tif");
img_padrao_sombreamento = imread("tungsten_sensor_shading.tif");

img_sem_correcao = im2double(img_sem_correcao);
img_padrao_sombreamento = im2double(img_padrao_sombreamento);

img_com_correcao = img_sem_correcao ./ img_padrao_sombreamento;

imshow(img_com_correcao);


