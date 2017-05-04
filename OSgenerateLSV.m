%**********************************************************************
%                     Linear Sweep Voltammetry (LSV)
%**********************************************************************
% Generaci�n de la rampa necesaria para la t�nica LSV seg�n par�metros
% introducidos en el programa.
% Autor: Tom�s
% Revisado por: Omar Su�rez
% Fecha: 2017.03.02
%
%
% !!!!!!!!!!!
% IMPORTANTE:
% !!!!!!!!!!!
% Esta t�cnica requiere realmente un par�metro adicional: Scan Rate.
% Este valor nos indica la cantidad de steps que vamos a tener por segundo.
% Es un valor que se utilizar� en el micro para configurar un timer
% asociado a esta prueba. Este timer creo que se utiliza para realizar y
% controlar las mediciones y adem�s para ir sacando los diferentes puntos
% de la tabla por el DAC. ES DECIR, ESTAS FUNCIONES DE MATLAB SOLAMENTE
% CALCULA LA TABLA DE PUNTOS QUE HAY QUE SACAR POR EL DAC. EL TEMPORIZADOR
% NOS AYUDAR� A IR SACANDO POR DAC TODA LA TABLA DE PUNTOS.
% INPUT ARGUMENTS
%   * eStart => punto de inicio del LSV
%   * eStop => punto final del LSV
%   * eStep => paso entre cada punto
% OUTPUT
%   * rampTable => tabla con los ptos de la LSV
%   * rampTable_SIZE => tama�o de la tabla
%  (Este c�digo es heredado de la funci�n generateRamp por eso saca tambi�n
%   el tama�o de la tabla de datos).
%**********************************************************************

function [rampTable,rampTable_SIZE] = generateLSV (eStart, eStop, eStep)

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