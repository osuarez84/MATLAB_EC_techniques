%**********************************************************************
%                                 SWV 
%**********************************************************************
% Generaci�n de la se�al para la t�cnica SWV.
% Autor: Omar Su�rez
% Revisado por: 
% Fecha: 2017.04.05

function lut = OSgenerateSWV(start, stop, step, amplitude, freq)
    
    % con la freq sacamos los samples totales (aplicamos adem�s Shannon)
    fSampling = 500 * freq;   % oversampling...
    
    tTimer = 1 / fSampling;   % tiempo entre muestras (per�odo muestreo)
    
    %nSamples = ceil(1/freq) / tTimer; % per�odo se�al / per�odo muestreo
    
    nSteps = ceil(abs((start - stop) / step));
    
    % Vamos a hacerlo en dos pasos
    % 1) Generar una onda cuadrada
    nSamples1 = ((1/freq)/2) / tTimer;
    nSamples2 = ((1/freq)/2) / tTimer;
    
    for i = 1:nSamples1
        lut1(i) = amplitude;
    end
    
    for i = 1:nSamples2
        lut2(i) = -amplitude;
    end
    
    
    % 2) Generar DC + SW
    contRow = 0;
    if (start < stop)       % subida....
        for i = 1:nSteps
            % Sumamos el offset DC + la SW del primer semiperiodo...
            for j = 1:nSamples1
                lut(j +  contRow) = (start + step*(i-1)) + lut1(j);
            end
            contRow = contRow + j;
            
            % Sumamos el offset Dc + la SW del segundo semiperiodo...
            for j = 1:nSamples2
                lut(j + contRow) = (start +  step*(i-1) + lut2(j));
            end
            contRow = contRow + j;
        end
        
    else                    % bajada...
        for i = 1:nSteps
            for j = 1:nSamples1
                lut(j +  contRow) = (start - step*(i-1)) + lut1(j);
            end
            contRow = contRow + j;
            
            for j = 1:nSamples2
                lut(j + contRow) = (start -  step*(i-1) + lut2(j));
            end
            contRow = contRow + j;
        end
            
    end
    
    




end