function [prom_X,prom_Y]=promPositionCentre(rgCentroid)
% Funci�n que devuelve la posici�n media de cada letra de un texto pasado
% de entrada (imagen de una palabra, una l�nea, etc.)
% Entrada :
% rgCentroid: matriz (regionProps) del centroide de cada letra
%
% Salida :
% prom_X: posici�n promedio de las letras despu�s de x
% prom_y: posici�n media de las letras que siguen a x

for i=1:length(rgCentroid)
    x_centroid(i) = rgCentroid(i).Centroid(1);
    y_centroid(i) = rgCentroid(i).Centroid(2);
end

prom_X = mean(x_centroid);
prom_Y = mean(y_centroid);