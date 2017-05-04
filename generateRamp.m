%**********************************************************************
%                                 generateRamp
%**********************************************************************
% Genera una tabla de datos correspondientes a una rampa con un potencial
% de comienzo, potencial final e intervalo determinado.
% Autor: Tom�s
% Revisado por: Omar Su�rez
% Fecha: 2017.03.02
% 
% INPUT ARGUMENTS
%   * eStart => punto de inicio del tramo
%   * sStop => punto final del tramo
%   * eStep => step entre cada punto
% OUTPUT
%   * rampTable => devuelve la tabla de punto del tramo
%   * rampTable_SIZE => devuelve el N� de puntos del tramo
%**********************************************************************

function [rampTable,rampTable_SIZE] = generateRamp (eStart, eStop, eStep)

% eStart=-4;
% eStop=4;
% eStep=0.3;

% Calculamos el N� de puntos del tramo y redondeamos hacia el entero
% m�s proximo por encima.
rampTable_SIZE = ceil(abs(eStop-eStart)/eStep)+1;

% Inicializamos el primer punto
rampTable (1) = eStart;

for i = 2:1:rampTable_SIZE-1
    
    
    if eStart < eStop % Rampa de subida...
        rampTable(i) = eStart + (i-1) * eStep;
    else % Rampa de bajada...
        rampTable(i) = eStart - (i-1) * eStep;
    end;
    
end;

% A�adimos el �ltimo punto
rampTable (rampTable_SIZE) = eStop;