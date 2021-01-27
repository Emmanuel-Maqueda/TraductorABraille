function [imgBraille]=reconstructBraille(lineas)
% Funci�n que devuelve la imagen del texto braille reconstruido a partir de
% cada fila
% Entrada :
% lineas: tabla de im�genes de l�neas braille
%
% Salida :
% imgBrailleSalida : Imagen unificada

sizeX=0;
max=0;
length(lineas)
for i=1:length(lineas)
    [x y z]=size(lineas{i}); %tama�o de cada linea 
    if (y>max) 
        max=y; %ancho de las lineas en suma
    end
    sizeX=sizeX+x; %largo de la linea
    
end

imgBraille=[];

for i=1:length(lineas)
    imgbin=im2bw(lineas{i}); %imagenes binarizadas de cada linea
    [x y]=size(imgbin); %plano por ello ya no hay z
    
    if (y<max)
       imgbin=[imgbin ones(x,max-y)]; % ones matriz de unos del tama�o x y maximo - y
    end
    
    imgBraille=[imgBraille;imgbin];
    
    
end