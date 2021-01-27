function [palabras]=cortePalabra(lineImg,avgLetterSize)
% Funci�n que devuelve cada palabra de la imagen de una l�nea de texto
% Entrada :
% lineImg: imagen de una l�nea de texto en formato binario
% averageLetterSize: tama�o medio de una letra 
%
% Salida :
% palabra: matriz que contiene todas las palabras de la l�nea pasada como entrada




binaryImage = imdilate(lineImg, true(round(avgLetterSize/3.5)));
% Elimina las manchas ej el punto de la i

% Encuentra las �reas y los cuadros delimitadores.
measurements = regionprops(binaryImage, 'Area', 'BoundingBox');
allAreas = [measurements.Area];
numBlobs = length(allAreas); %num de palabras en una linea de todas las lineas mediante boundingboxes

%corta cada palabra
for blob = 1 : numBlobs
	% se corta cada palabra de bounding box
	thisBoundingBox = measurements(blob).BoundingBox;
    %corta la palabra directo de la imagen bw
	thisWord = imcrop(lineImg, thisBoundingBox);
    palabras{blob}=thisWord;
end