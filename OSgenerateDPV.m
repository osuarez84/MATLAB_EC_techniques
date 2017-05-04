%**********************************************************************
%                               DPV 
%**********************************************************************
% Generación de la señal para la técnica DPV.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.04

% TODO: revisar el ciclo de finalización, ya que no termina correctamente.

function lut = OSgenerateDPV(start, stop, step, ePulse, tPulse, scanRate)
    
    % DATOS PARA PROBAR LA FUNCION
    % start = 0
    % start = 10 (-10)
    % step = 0.1
    % ePulse = 0.54
    % tPulse = 0.01     OJO que tPulse debe de ser más pequeño que t
    %                   interval
    % scanRate = 4
    
    %%
    % Establecemos un número de samples mínimo en el pulso
    nSamplesPulse = 10;
    
    % tiempo de disparo que luego tendremos que pasarle 
    % a la API de CEMITEC (este tiempo es el tiempo de sampleo de la señal)
    tTimer = tPulse / nSamplesPulse;
    
    % calculamos t interval (t dc + t pulse)
    tInt = step / scanRate;
    
    % Calculamos el nº de samples en la zona DC
    nSamplesDC = ceil((tInt - tPulse) / tTimer);
    
    % Calculamos el número de steps 
    nSteps = abs(ceil((stop - start) / step));
    contRow = 0;        % lleva el seguimiento de la posición de la LUT
                        % donde vamos guardando cada dato
                        
                        
    
    % La señal es periódica, ya que en cada t interval se repite el mismo
    % patrón, pero sumandole el offset del step. Con lo que nos
    % aprovechamos de eso en la generación de la LUT.
                        
    if (stop > start)             % Si step sube...
        for i = 1:nSteps   % En cada uno de los steps...
            for j = 1:nSamplesDC  % Generamos parte DC...
                lut(j + contRow) = start + (step * (i-1));
            end
            contRow = contRow + j;

            for j = 1:nSamplesPulse % Generamos parte Pulse
                lut( j + contRow ) = (start + ePulse) + ...
                    (step * (i-1));
            end
            contRow = contRow + j;
        end
        
    else                        % Si step baja...
        for i = 1:nSteps
            for j = 1:nSamplesDC  % Generamos parte DC...
                lut(j + contRow) = start - (step * (i-1));
            end
            contRow = contRow + j;

            for j = 1:nSamplesPulse % Generamos parte Pulse...
                lut( j + contRow ) = (start + ePulse) - ...
                    (step * (i-1));
            end
            contRow = contRow + j;
        end
    end
    
    
    %% ESTA PARTE ES PARA TESTEAR QUE TODO ESTA OK
    % Generación del vector con los tiempos de lanzamiento
    % de cada pto de la LUT
    %vTimer = [0:tTimer:tPulse, tPulse:tTimer:(tInt-tPulse)];
%    vecTimer = [0:tTimer:(tInt*(nSteps-1))];
%    plot(vecTimer, lut);
    
   
    
end
    


