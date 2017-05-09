%**********************************************************************
%                                 ACV 
%**********************************************************************
% Generaci�n de la se�al para la t�cnica ACV.
% Autor: Omar Su�rez
% Revisado por: 
% Fecha: 2017.04.05

function lut = OSgenerateACV(start, stop, step, amplitude, scanRate, freq)
    
    % Periodo de muestreo
    fSampling = freq * 100;     % oversampling...
    tTimer = 1 / fSampling;
    nSamplesAC = ceil((1/freq) / tTimer);  % Samples de la se�al AC
    
    % Calculamos t interval
    tInt = step / scanRate;
    
    
    
    %% 1) Generaci�n la senoide para todo el t interval
          
     % �cuantos periodos de AC caben en t interval?
     nPerAC = tInt / (1/freq);  
     
    % que nos da el numero de ptos totales del t interval...
    nSamplesTint = ceil(nPerAC * nSamplesAC);
       
    % Genero la senoidal para todo el t int
    % IMPORTANTE 
    % En caso de que el n� de per�odos AC que caben en el t interval no sea
    % un n�mero entero, debemos de poder sacar los puntos del
    % per�odo incompleto. 
    % Esto se hace en la segunda parte del "if".
    contj = 0;
    for i = 1:ceil(nPerAC)
        
        if (i < nPerAC)          % Si no es ultimo per�odo...
            for j = 1:nSamplesAC
                lutACtInt(j + contj) = amplitude * sin((2*pi/nSamplesAC)*(j-1));
            end
            contj = contj + j;              
        else                     % Si �ltimo per�odo...
            % Aqu� sacamos los samples del per�odo incompleto...(si lo hay)
           nSamplesRest = nSamplesTint - contj;
           for j = 1:nSamplesRest       %
               lutACtInt(j + contj) = amplitude * sin((2*pi/nSamplesAC)*(j-1));
           end
            
        end
    end
         

    %% 2) Generaci�n del offset + AC para toda la prueba
    nSteps = ceil(abs((start - stop) / step));
    contRow = 0;
    
    if(start < stop)
        for i = 1:nSteps
            for j = 1:nSamplesTint
                lut(j + contRow) = (start + (step*(i-1))) + lutACtInt(j);
            end
            contRow = contRow + j;
        end
        
    else
        for i = 1:nSteps
            for j = 1:nSamplesTint
                lut(j + contRow) = (start - (step*(i-1))) + lutACtInt(j);
            end
            contRow = contRow + j;
        end
        
        
    end
    
        
        
    


end