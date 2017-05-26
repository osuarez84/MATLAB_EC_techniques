%**********************************************************************
%                                 DSCA 
%**********************************************************************
% Generación de la señal para la técnica DSCA.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.05.26

function OSgenerateDSCA(eStep1, tStep1, eStep2, tStep2, tInt)

    % tInt  => este parámetro se utiliza para lanzar las mediciones
    % desde el ADC.

    % fSampling = 20 * frec corte filtro
    % Filtros :     Filtro Butterworth  => 250 Hz f. corte
    %               Filtro Bessel       => 1.2 kHz f. corte
    %               Filtro Butterworth  => 20 kHZ f. corte
    

    fSampling = 10000;          % Esta frecuencia de muestreo depende del
                                % filtro seleccionado

    % LUT debe de ir refrescandose entre steps
    tSampling = 1/fSampling;   

    nSamples1 = ceil(tStep1 / tSampling);
    nSamples2 = ceil(tStep2 / tSampling);
    
    
    % Primera parte de la onda...
    for j = 1:nSamples1
        lut(j) = eStep1;
    end

    % Segunda parte de la onda...
    for j = 1:nSamples2
        lut(j + nSamples1) = eStep2;
    end


    %%
    % Ploteo final para testeo de la waveform
    stairs(tSampling*(0:length(lut)-1), lut);
    xlabel('Time [sec]');
    ylabel('Voltage [V]');
    grid on;
            



end