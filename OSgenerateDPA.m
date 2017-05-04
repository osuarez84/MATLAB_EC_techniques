%**********************************************************************
%                                  PAD 
%**********************************************************************
% Generación de la señal para la técnica PAD.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.05

function OSgenerateDPA(eDC, ePulse, tPulse, tInt, tRun, mode)

    % A partir del t interval saco la frecuencia de la señal y
    % a partir de aquí el período de muestreo necesario
    freq = 1 / tInt;

    fSampling = freq * 100;     % oversampling...
    
    % período de muestreo
    tTimer = 1 / fSampling;
    
    % nº samples durante t pulse 1
    nSamplesPulse = ceil(tPulse / tTimer);
    
    % nº samples durante DC
    tDC = tInt - tPulse;
    nSamplesDC = ceil(tDC / tTimer);
    
    
    % nº de runs
    nRuns = ceil(tRun / tInt);
    
    % 1) Generar señal de un período
    for i = 1:nSamplesDC
        lut1(i) = eDC;
    end
    
    for j = 1:nSamplesPulse
        lut1(i + j) = ePulse + eDC;
    end
    
    
    % 2) Genero la señal para el período tRun completo
    contRow = 0;
    for i = 1:nRuns
        for j = 1:(nSamplesDC + nSamplesPulse)
            lut(j + contRow) =  lut1(j);
        end
        contRow = contRow + j;
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    

end