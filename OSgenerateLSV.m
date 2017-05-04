%**********************************************************************
%                     Linear Sweep Voltammetry (LSV)
%**********************************************************************
% Generación de la rampa necesaria para la ténica LSV según parámetros
% introducidos en el programa.
% Autor: Tomás
% Revisado por: Omar Suárez
% Fecha: 2017.03.02
%
%
% !!!!!!!!!!!
% IMPORTANTE:
% !!!!!!!!!!!
% Esta técnica requiere realmente un parámetro adicional: Scan Rate.
% Este valor nos indica la cantidad de steps que vamos a tener por segundo.
% Es un valor que se utilizará en el micro para configurar un timer
% asociado a esta prueba. Este timer creo que se utiliza para realizar y
% controlar las mediciones y además para ir sacando los diferentes puntos
% de la tabla por el DAC. ES DECIR, ESTAS FUNCIONES DE MATLAB SOLAMENTE
% CALCULA LA TABLA DE PUNTOS QUE HAY QUE SACAR POR EL DAC. EL TEMPORIZADOR
% NOS AYUDARÁ A IR SACANDO POR DAC TODA LA TABLA DE PUNTOS.
% INPUT ARGUMENTS
%   * eStart => punto de inicio del LSV
%   * eStop => punto final del LSV
%   * eStep => paso entre cada punto
% OUTPUT
%   * rampTable => tabla con los ptos de la LSV
%   * rampTable_SIZE => tamaño de la tabla
%  (Este código es heredado de la función generateRamp por eso saca también
%   el tamaño de la tabla de datos).
%**********************************************************************

function [rampTable,rampTable_SIZE] = generateLSV (eStart, eStop, eStep)

% eStart=-4;
% eStop=4;
% eStep=0.3;

% Calculamos el Nº de puntos del tramo y redondeamos hacia el entero
% más proximo por encima.
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

% Añadimos el último punto
rampTable (rampTable_SIZE) = eStop;