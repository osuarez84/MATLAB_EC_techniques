%**********************************************************************
%                               NPV 
%**********************************************************************
% Generaci�n de la se�al para la t�cnica NPV.
% Autor: Omar Su�rez
% Revisado por: 
% Fecha: 2017.04.04

% TODO: revisar el ciclo de finalizaci�n, ya que no termina correctamente.
% Y revisar tambi�n si este tipo de se�al se puede hacer negativo.

function lut = OSgenerateNPV(start, stop, step, tPulse, scanRate)

    % n�mero samples m�nimo en el pulso
    nSamplesPulse = 10;
    
    % tiempo de disparo de cada punto (API CEMITEC)
    tTimer = tPulse/nSamplesPulse;
    
    % calculamos t interval
    tInt = step / scanRate;
    
    %n� samples en zona DC
    nSamplesDC = ceil((tInt - tPulse) / tTimer));
    
    nSteps = abs(ceil(stop - start) / step);
    contRow = 0;
    
    % Generamos la LUT en los bucles
    if (stop > start)       % Si step sube...
       for i = 1:nSteps
           for j = 1:nSamplesDC         % Generamos parte DC
                lut(j + contRow) = start;
           end
           contRow = contRow + j;
           
           for j = 1:nSamplesPulse % Generamos parte Pulse
                lut( j + contRow ) = start + ...
                    (step * (i-1));
            end
            contRow = contRow + j;
       end
    else                    % Si step baja...
        for i = 1:nSteps
           for j = 1:nSamplesDC         % Generamos parte DC
                lut(j + contRow) = start;
           end
           contRow = contRow + j;
           
           for j = 1:nSamplesPulse % Generamos parte Pulse
                lut( j + contRow ) = start - ...
                    (step * (i-1));
            end
            contRow = contRow + j;
       end
    end
        
    

end