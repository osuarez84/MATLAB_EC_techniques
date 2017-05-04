%**********************************************************************
%                                 EIS Multisine 
%**********************************************************************
% Generación de la señal para la técnica EIS multisine.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.11
%
% TODO: esto es una primera aproximación a la generación de señales
% multisenoidales.
% La aproximación que se hace:
% => Introducimos una tabla de frecuencias.
% => Introducimos una tabla de fases.
% => Generamos un período de señal de cada frec y fase
% => Sumamos todas las señales para obtener señal final
% => Generamos si necesario la señal para toda la prueba
%
%
% @brief
% @param nSignals   Nº de senoides 
% @param freqArr    Array con la frecuencia de cada senoide
% @param phaseArr   Array con la fase de cada senoide
% @param amplitude  Nos marca la amplitud de las señales (igual para todas)
% @retval
%
% nPtos => puede ser necesario ajustarlo a la señal de mayor 
% frecuencia que tengamos que generar, para que no se produzca aliasing.
%
function lut = OSgenerateMultiSine(nSignals, freqArr, phaseArr, amplitude)

    % La relación entre las frecuencias de las señales multiseno
    % debe de ser entera. Esto se debe a que en el DDS debemos de 
    % guardar períodos completos de señal. Al ser multiseno hay que
    % asegurarse de que todas entran con un número de períodos completo
    % en el DDS.
    nPtos = 4096;  % el DDS dispone de una LUT de 4K
    
   
    % inicializamos la lut con zeros
    for i = 1:nPtos
        lut(i) = 0;
    end
    
    % Conversión de grados a radianes
    for i = 1:nSignals
        phaseArr(i) = pi*phaseArr(i)/180;
    end
    
    
    %% Este tramo es para poder meter un período completa de la frecuencia 
    % más pequeña en los 4096 puntos de a LUT del DDS
    minFreq = freqArr(1);
    
    % Sacamos frecuencia más pequeña...
    for i = 2:nSignals
        if(freqArr(i) < minFreq)
            minFreq = freqArr(i);
        end
    end
    
   % Y las relaciones entre las frecuencias...
   for i = 1:nSignals
     r(i) = freqArr(i) / minFreq;
   end
    
   
    % Generamos la señal suma de todas las senoides pero teniendo en cuenta
    % la relación entre frecuencias. De esta manera siempre vamos a meter
    % un período completo de la onda de menor frecuencia, y esta será la
    % que nos marque el período y la frecuencia de salida del DDS.
    % Esto se hace para no meter más de un período de la señal de menor
    % frecuencia, ya que si por ejemplo la señal de menor frecuencia es de
    % 0.1 Hz, si no hallamos la relación con las demás señales, estaremos
    % metiendo un período no completo en la LUT (estaremos metiendo 0.1 períodos)
    for i = 1:nSignals
        for j = 1:nPtos
            lut(j) = lut(j) + amplitude * sin ((((2*pi*r(i))/nPtos) * (j - 1)) + ...
                                                    phaseArr(i));
        end
    end
%%
    
%     % Generamos la señal suma de todas las senoides
%     for i = 1:nSignals
%         for j = 1:nPtos
%             lut(j) = lut(j) + amplitude * sin ((((2*pi*freqArr(i))/nPtos) * (j - 1)) + ...
%                                                     phaseArr(i));
%         end
%     end
    
    
   scatter([1:length(lut)], lut);
















