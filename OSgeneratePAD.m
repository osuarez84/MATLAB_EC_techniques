%**********************************************************************
%                                  PAD 
%**********************************************************************
% Generación de la señal para la técnica PAD.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.04.05


function lut = OSgeneratePAD(eDC, ePulse1, tPulse1, ePulse2, tPulse2, tInt, tRun)
    
    % fSampling = 20 * frec corte filtro
    % Filtros :     Filtro Butterworth  => 250 Hz f. corte
    %               Filtro Bessel       => 1.2 kHz f. corte
    %               Filtro Butterworth  => 20 kHZ f. corte
    

    fSampling = 10000;          % Esta frecuencia de muestreo depende del
                                % filtro seleccionado

    % LUT debe de ir refrescandose entre steps
    tSampling = 1/fSampling;   

    nSamples1 = ceil((tInt - (tPulse1 + tPulse2)) / tSampling);
    nSamples2 = ceil(tPulse1 / tSampling);
    nSamples3 = ceil(tPulse2 / tSampling);
    
    
    % Primera parte de la señal...
    for i = 1:nSamples1
        lut(i) = eDC;
    end
    
    % Segunda parte de la señal...
    for i = 1:nSamples2
        lut(i + nSamples1) = ePulse1;
    end
    
    % Tercera parte de la señal
    
    for i = 1:nSamples3
        lut(i + nSamples1 + nSamples2) = ePulse2;
    end
    
    
    %% Generamos la señal de prueba que tendríamos con t Run
    tDC = (tInt - (tPulse1 + tPulse2));

    n = ceil(tRun / (tDC + tPulse1 + tPulse2));
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
