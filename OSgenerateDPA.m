%**********************************************************************
%                                  DPA 
%**********************************************************************
% Generación de la señal para la técnica DPA.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.05

function OSgenerateDPA(eDC, ePulse, tPulse, tInt, tRun)
    
    % fSampling = 20 * frec corte filtro
    % Filtros :     Filtro Butterworth  => 250 Hz f. corte
    %               Filtro Bessel       => 1.2 kHz f. corte
    %               Filtro Butterworth  => 20 kHZ f. corte
    

    fSampling = 10000;          % Esta frecuencia de muestreo depende del
                                % filtro seleccionado

    % LUT debe de ir refrescandose entre steps
    tSampling = 1/fSampling;   

    nSamples1 = ceil((tInt - tPulse) / tSampling);
    nSamples2 = ceil(tPulse / tSampling);
    
    
    
    % Primera parte de la señal...
    for i = 1:nSamples1
        lut(i) = eDC;
    end
    
    % Segunda parte de la señal...
    for i = 1:nSamples2
        lut(i + nSamples1) = ePulse;
    end
    
    %% Generamos la señal de prueba que tendríamos con t Run
    tDC = (tInt - tPulse);

    n = ceil(tRun / (tDC + tPulse));
    for i = 1:n
        lutDAC((1:length(lut)) + (length(lut)*(i-1))) = lut;
    end
    
    %%
    % Ploteo final para testeo de la waveform
    stairs(tSampling*(0:length(lutDAC)-1), lutDAC);
    xlabel('Time [sec]');
    ylabel('Voltage [V]');
    grid on;
    
    
    
    
    
    
    

end