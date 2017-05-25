%**********************************************************************
%                               DPV 
%**********************************************************************
% Generación de la señal para la técnica DPV.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.04


function lut = OSgenerateDPV(start, stop, step, ePulse, tPulse, scanRate)
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
    
    nSamples1 = ceil((tInt - tPulse) / tSampling);
    nSamples2 = ceil(tPulse / tSampling);
    
    % Calculamos el número de steps 
    nSteps = ceil(abs((stop - start) / step));
    figure;
    
    if (stop > start)               % steps suben...       
            for i = 1:nSteps
                % Estos dos bucles deberían computarse en menos de 2 ms para
                % refrescar la LUT.

                % Primera parte de la onda...
                for j = 1:nSamples1
                    lut(j) = start + (step * (i-1));
                end

                % Segunda parte de la onda...
                for j = 1:nSamples2
                    lut(j + nSamples1) = (start + ePulse) + (step * (i-1));
                end

                % Lut final que quedaría al ver toda la serie completa
                lutDAC((1:(nSamples1+nSamples2))+(length(lut)*(i-1))) = lut;

                % Sacamos al DAC y refrescamos...        
            end
            
    else                            % steps bajan...
           for i = 1:nSteps
                % Estos dos bucles deberían computarse en menos de 2 ms para
                % refrescar la LUT.
                for j = 1:nSamples1
                    lut(j) = start - (step * (i-1));
                end

                for j = 1:nSamples2
                    lut(j + nSamples1) = (start + ePulse) - (step * (i-1));
                end

                % Lut final que quedaría al ver toda la serie completa
                lutDAC((1:(nSamples1+nSamples2))+(length(lut)*(i-1))) = lut;

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
    


