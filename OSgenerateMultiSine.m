%**********************************************************************
%                                 EIS Multisine 
%**********************************************************************
% Generaci�n de la se�al para la t�cnica EIS multisine.
% Autor: Omar Su�rez
% Revisado por: 
% Fecha: 2017.04.11
%
% TODO: esto es una primera aproximaci�n a la generaci�n de se�ales
% multisenoidales.
% La aproximaci�n que se hace:
% => Introducimos una tabla de frecuencias.
% => Introducimos una tabla de fases.
% => Generamos un per�odo de se�al de cada frec y fase
% => Sumamos todas las se�ales para obtener se�al final
% => Generamos si necesario la se�al para toda la prueba
%
%
% @brief
% @param nSignals   N� de senoides 
% @param freqArr    Array con la frecuencia de cada senoide
% @param phaseArr   Array con la fase de cada senoide
% @param amplitude  Nos marca la amplitud de las se�ales (igual para todas)
% @retval
%
% nPtos => puede ser necesario ajustarlo a la se�al de mayor 
% frecuencia que tengamos que generar, para que no se produzca aliasing.
%
function lut = OSgenerateMultiSine(nSignals, freqArr, phaseArr, amplitude)

    % La relaci�n entre las frecuencias de las se�ales multiseno
    % debe de ser entera. Esto se debe a que en el DDS debemos de 
    % guardar per�odos completos de se�al. Al ser multiseno hay que
    % asegurarse de que todas entran con un n�mero de per�odos completo
    % en el DDS.
    nPtos = 4096;  % el DDS dispone de una LUT de 4K
    
   
    % inicializamos la lut con zeros
    for i = 1:nPtos
        lut(i) = 0;
    end
    
    % Conversi�n de grados a radianes
    for i = 1:nSignals
        phaseArr(i) = pi*phaseArr(i)/180;
    end
    
    
    %% Este tramo es para poder meter un per�odo completa de la frecuencia 
    % m�s peque�a en los 4096 puntos de a LUT del DDS
    minFreq = freqArr(1);
    
    % Sacamos frecuencia m�s peque�a...
    for i = 2:nSignals
        if(freqArr(i) < minFreq)
            minFreq = freqArr(i);
        end
    end
    
   % Y las relaciones entre las frecuencias...
   for i = 1:nSignals
     r(i) = freqArr(i) / minFreq;
   end
    
   
    % Generamos la se�al suma de todas las senoides pero teniendo en cuenta
    % la relaci�n entre frecuencias. De esta manera siempre vamos a meter
    % un per�odo completo de la onda de menor frecuencia, y esta ser� la
    % que nos marque el per�odo y la frecuencia de salida del DDS.
    % Esto se hace para no meter m�s de un per�odo de la se�al de menor
    % frecuencia, ya que si por ejemplo la se�al de menor frecuencia es de
    % 0.1 Hz, si no hallamos la relaci�n con las dem�s se�ales, estaremos
    % metiendo un per�odo no completo en la LUT (estaremos metiendo 0.1 per�odos)
    for i = 1:nSignals
        for j = 1:nPtos
            lut(j) = lut(j) + amplitude * sin ((((2*pi*r(i))/nPtos) * (j - 1)) + ...
                                                    phaseArr(i));
        end
    end
%%
    
%     % Generamos la se�al suma de todas las senoides
%     for i = 1:nSignals
%         for j = 1:nPtos
%             lut(j) = lut(j) + amplitude * sin ((((2*pi*freqArr(i))/nPtos) * (j - 1)) + ...
%                                                     phaseArr(i));
%         end
%     end
    
    
   scatter([1:length(lut)], lut);
















