%**********************************************************************
%                                 ACV 
%**********************************************************************
% Generación de la señal para la técnica ACV.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.05

function lut = OSgenerateACV(start, stop, step, amplitude, scanRate, freq)
     
    % fSampling = 20 * frec corte filtro
    % Filtros :     Filtro Butterworth  => 250 Hz f. corte
    %               Filtro Bessel       => 1.2 kHz f. corte
    %               Filtro Butterworth  => 20 kHZ f. corte
    

    fSampling = 10000;          % Esta frecuencia de muestreo depende del
                                % filtro seleccionado


    % LUT debe de ir refrescandose entre steps
    tSampling = 1/fSampling;
    tInt = step / scanRate;
    
    nSamples1 = ceil(tInt / tSampling);

    
    % Calculamos el número de steps 
    nSteps = ceil(abs((stop - start) / step));
    figure;
    
    % Calculamos nº de períodos (este valor debe de ser un entero)
    nPer = tInt / (1/freq);
    nSamplesPer = nSamples1 / nPer;
    
    if (stop > start)                   % steps suben...
        
        for i = 1:nSteps
            for p = 1:nPer  
                for j = 1:nSamplesPer
                    lut(j + nSamplesPer*(p-1)) = start +...
                        amplitude * sin((2*pi/nSamplesPer)*(j-1)) + ...
                        (step * (i-1));
                end
            end

            % Lut final que quedaría al ver toda la serie completa
            lutDAC((1:(nSamples1))+(length(lut)*(i-1))) = lut;

            % Sacamos al DAC y refrescamos... 

        end
    
    else                                % steps bajan...
        for i = 1:nSteps
            for p = 1:nPer  
                for j = 1:nSamplesPer
                    lut(j + nSamplesPer*(p-1)) = start +...
                        amplitude * sin((2*pi/nSamplesPer)*(j-1)) - ...
                        (step * (i-1));
                end
            end

            % Lut final que quedaría al ver toda la serie completa
            lutDAC((1:(nSamples1))+(length(lut)*(i-1))) = lut;

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