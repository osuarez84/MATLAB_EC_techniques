%**********************************************************************
%                                  MSP 
%**********************************************************************
% Generación de la señal para la técnica MSA.
% Autor: Omar Suárez
% Revisado por: 
% Fecha: 2017.05.26

function OSgenerateMSP(tInt, cycles, levels)

    % levels : es un array donde se encuentran definidos el E
    % y el t de cada escalón. Para realizar el ciclo completo
    % hay que recorrer esta matriz para sacar todos los valores.
    % levels[] = [E1, t1, E2, t2, ...., En, tn];

    % fSampling = 20 * frec corte filtro
    % Filtros :     Filtro Butterworth  => 250 Hz f. corte
    %               Filtro Bessel       => 1.2 kHz f. corte
    %               Filtro Butterworth  => 20 kHZ f. corte
    

    fSampling = 10000;          % Esta frecuencia de muestreo depende del
                                % filtro seleccionado
                                
    tSampling = 1/fSampling;
    l = 0;
                               
    for i = 1:cycles

        
        for j = 1:2:length(levels / 2)  % En cada step los samples cambian...
            nSamples1 = ceil(levels(j+1) / tSampling);
            
            % Generamos los ptos para el step j
            for p = 1:nSamples1
                lut(p) = levels(j);
            
            end

        end
        
    end
    



































end