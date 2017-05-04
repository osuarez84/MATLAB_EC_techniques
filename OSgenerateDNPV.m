%**********************************************************************
%                                 DNPV 
%**********************************************************************
% Generación de la señal para la técnica DNPV.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.05

% TODO: revisar el ciclo de finalización, ya que no termina correctamente.
% Revisar si el base potential debe de ser programable también.

function lut = OSgenerateDNPV(start, stop, step, ePulse, tPulse1, tPulse2, ...
    tInt)

    % Pulse 1 => primer pulso
    % Pulse 2 => segundo pulso (pulso añadido por encima de Pulse 1)
    % ePulse => amplitud de Pulse 2
    %             __P2___
    %             |     |
    %        __P1_|     |
    %       |           |
    %       |           |
    % ______|           |_________
    %
    %%
    % Establecemos un número de samples mínimo en pulso 1
    nSamplesPulse1 = 10;
    
    % tiempo de disparo que luego tendremos que pasarle 
    % a la API de CEMITEC
    tTimer = tPulse1 / nSamplesPulse1;

    
    % nº samples en dc
    nSamplesDC = ceil((tInt - (tPulse1 + tPulse2)) / tTimer );
    
    % nº samples en pulse1
    nSamplesP1 = ceil(tPulse1 / tTimer);
    
    % nº samples en pulse2
    nSamplesP2 = ceil(tPulse2 / tTimer);
    
    
    nSteps = abs(ceil((stop - start) / step));
    contRow = 0;
    
    % Generamos cada parte de la onda...
    for i = 1:nSteps
        
        for j = 1:nSamplesDC
            lut(j + contRow) = start;
        end
        contRow = contRow + j;
        
        for j = 1:nSamplesP1
            lut(j + contRow) = start + (step * (i-1));
        end
        contRow = contRow + j;
        
        for j = 1:nSamplesP2
            lut(j + contRow) = (start + ePulse) + (step*(i-1));
        end
        contRow = contRow + j;
    
    
    end
    
    
    %% TEST
    scatter([1:length(lut)]*tTimer, lut);
    
    

end