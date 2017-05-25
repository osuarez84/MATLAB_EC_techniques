%**********************************************************************
%                                 DNPV 
%**********************************************************************
% Generación de la señal para la técnica DNPV.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.05

function lut = OSgenerateDNPV(start, stop, step, ePulse, tPulse1, tPulse2, ...
    scanRate)

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
    % fSampling = 20 * frec corte filtro
    % Filtros :     Filtro Butterworth  => 250 Hz f. corte
    %               Filtro Bessel       => 1.2 kHz f. corte
    %               Filtro Butterworth  => 20 kHZ f. corte
    

    fSampling = 10000;          % Esta frecuencia de muestreo depende del
                                % filtro seleccionado


    % LUT debe de ir refrescandose entre steps
    tSampling = 1/fSampling;
    tInt = step / scanRate;
    
    nSamples1 = ceil((tInt - (tPulse1 +  tPulse2)) / tSampling);
    nSamples2 = ceil(tPulse1 / tSampling);
    nSamples3 = ceil(tPulse2 / tSampling);
    
    % Calculamos el número de steps 
    nSteps = ceil(abs((stop - start) / step));
    figure;
    
    if (stop > start)               % steps suben...
        for i = 1:nSteps
            % Estos dos bucles deberían computarse en menos de 3 ms para
            % refrescar la LUT.
            
            % Primera parte de la onda
            for j = 1:nSamples1
                lut(j) = start;
            end
            
            % Segunda parte de la onda...
            for j = 1:nSamples2
                lut(j + nSamples1) = (start) + (step * (i));
            end
            
            % Tercera parte de la onda...
            for(j = 1:nSamples3)
                lut(j + nSamples1 + nSamples2) = (start + ePulse) + ...
                    (step * (i));
            end
            

            % Lut final que quedaría al ver toda la serie completa
            lutDAC((1:(nSamples1+nSamples2+nSamples3))+...
                (length(lut)*(i-1))) = lut;

            % Sacamos al DAC y refrescamos...        
        end
    else                            % steps bajan...
        for i = 1:nSteps
            % Estos dos bucles deberían computarse en menos de 3 ms para
            % refrescar la LUT.
            for j = 1:nSamples1
                lut(j) = start;
            end

            for j = 1:nSamples2
                lut(j + nSamples1) = (start) - (step * (i));
            end
            
            for(j = 1:nSamples3)
                lut(j + nSamples1 + nSamples2) = (start + ePulse) - ...
                    (step * (i));
            end
            

            % Lut final que quedaría al ver toda la serie completa
            lutDAC((1:(nSamples1+nSamples2+nSamples3))+...
                (length(lut)*(i-1))) = lut;

            % Sacamos al DAC y refrescamos... 
        end
    end
    
    
    %%
    % Ploteo final para testeo de la waveform
    stairs(tSampling*(0:length(lutDAC)-1), lutDAC);
    xlabel('Time [sec]');
    ylabel('Voltage [V]');
    grid on;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

end