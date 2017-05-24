%**********************************************************************
%                                  PAD 
%**********************************************************************
% Generaci�n de la se�al para la t�cnica PAD.
% Autor: Omar Su�rez
% Revisado por: 
% Fecha: 2017.04.05


function lut = OSgeneratePAD(eDC, ePulse1, tPulse1, ePulse2, tPulse2, tInt, tRun)

    
    % A partir del t interval saco la frecuencia de la se�al y
    % a partir de aqu� el per�odo de muestreo necesario
    freq = 1 / tInt;
    
    fSampling = freq * 100;     % oversampling...
    
    % per�odo de muestreo
    tTimer = 1 / fSampling;
    
    % n� samples durante t pulse 1
    nSamplesT1 = ceil(tPulse1 / tTimer);
    
    % n� samples durante t pulse 2
    nSamplesT2 = ceil(tPulse2 / tTimer);
    
    % n� samples durante t DC
    tDC = tInt - (tPulse1 + tPulse2);
    nSamplesDC = ceil(tDC / tTimer);
    
    
    % Generaci�n de la se�al para 1 per�odo
    nSamplesTint = nSamplesT1 + nSamplesT2 + nSamplesDC;
    nRuns = ceil(tRun / tInt);
    
    % 1) Generar una onda cuadrada
    for i = 1:nSamplesT1
        lut1(i) = ePulse1;
    end
    
    for j = 1:nSamplesT2
        lut1(i + j) = -ePulse2;
    end
    
    
    % 2) Genero la se�al para el per�odo tRun completo
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
