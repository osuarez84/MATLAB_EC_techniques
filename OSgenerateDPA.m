%**********************************************************************
%                                  PAD 
%**********************************************************************
% Generaci�n de la se�al para la t�cnica PAD.
% Autor: Omar Su�rez
% Revisado por: 
% Fecha: 2017.04.05

function OSgenerateDPA(eDC, ePulse, tPulse, tInt, tRun, mode)

    % A partir del t interval saco la frecuencia de la se�al y
    % a partir de aqu� el per�odo de muestreo necesario
    freq = 1 / tInt;

    fSampling = freq * 100;     % oversampling...
    
    % per�odo de muestreo
    tTimer = 1 / fSampling;
    
    % n� samples durante t pulse 1
    nSamplesPulse = ceil(tPulse / tTimer);
    
    % n� samples durante DC
    tDC = tInt - tPulse;
    nSamplesDC = ceil(tDC / tTimer);
    
    
    % n� de runs
    nRuns = ceil(tRun / tInt);
    
    % 1) Generar se�al de un per�odo
    for i = 1:nSamplesDC
        lut1(i) = eDC;
    end
    
    for j = 1:nSamplesPulse
        lut1(i + j) = ePulse + eDC;
    end
    
    
    % 2) Genero la se�al para el per�odo tRun completo
    contRow = 0;
    for i = 1:nRuns
        for j = 1:(nSamplesDC + nSamplesPulse)
            lut(j + contRow) =  lut1(j);
        end
        contRow = contRow + j;
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    

end