%**********************************************************************
%                                  PAD 
%**********************************************************************
% Generación de la señal para la técnica PAD.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.05


function lut = OSgeneratePAD(eDC, ePulse1, tPulse1, ePulse2, tPulse2, tInt, tRun)

    
    % A partir del t interval saco la frecuencia de la señal y
    % a partir de aquí el período de muestreo necesario
    freq = 1 / tInt;
    
    fSampling = freq * 100;     % oversampling...
    
    % período de muestreo
    tTimer = 1 / fSampling;
    
    % nº samples durante t pulse 1
    nSamplesT1 = ceil(tPulse1 / tTimer);
    
    % nº samples durante t pulse 2
    nSamplesT2 = ceil(tPulse2 / tTimer);
    
    % nº samples durante t DC
    tDC = tInt - (tPulse1 + tPulse2);
    nSamplesDC = ceil(tDC / tTimer);
    
    
    % Generación de la señal para 1 período
    nSamplesTint = nSamplesT1 + nSamplesT2 + nSamplesDC;
    nRuns = ceil(tRun / tInt);
    
    % 1) Generar una onda cuadrada
    for i = 1:nSamplesT1
        lut1(i) = ePulse1;
    end
    
    for j = 1:nSamplesT2
        lut1(i + j) = -ePulse2;
    end
    
    
    % 2) Genero la señal para el período tRun completo
    contRow = 0;
    for i = 1:nRuns
        for j = 1:nSamplesDC
            lut(j + contRow) = eDC;
        end
        contRow = contRow + j;
        
        for j = 1:(nSamplesT1+nSamplesT2)
            lut(j + contRow) = eDC + lut1(j);
        end
        contRow = contRow + j;

    end


    
    


end
