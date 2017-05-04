%**********************************************************************
%                      Cyclic Voltammetry (CV)
%**********************************************************************
% Generaci�n de la rampa necesaria para la t�nica CV seg�n par�metros
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
%**********************************************************************
% INPUT ARGUMENTS
%   * eStart => punto de inicio de la CV
%   * eVtx1 => primer v�rtice del escan�o
%   * eVtx2 => segundo v�rtice del escan�o
%   * eStep => paso entre puntos
%   * NumberScans => N� de escaneos necesario
% OUTPUT
%   * cvTable => tabla completa con todos los puntos para la CV
%**********************************************************************

function [cvTable] = generateCV (eStart, eVtx1, eVtx2, eStep, NumberScans)
% eStart= -2;
% eVtx1 = -4;
% eVtx2 = 4;
% eStep = 0.3;
% NumberScans = 2;

%% Generamos las rampas por tramos
[a,a_SIZE] = generateRamp(eStart,eVtx1,eStep);
[b,b_SIZE] = generateRamp(eVtx1,eVtx2,eStep);
[c,c_SIZE] = generateRamp(eVtx2,eVtx1,eStep);

%% Calculo de 1 escaneo
% Calculamos el total del tama�o 1 escaneo completo:
% * N� muestras de eVtx1 a eVtx2 + N� muestras de eVtx2 a eVtx1 - 1
% Quitamos una ya que hay un punto com�n  a los dos tramos (donde se
% unen).
scan_SIZE=b_SIZE+c_SIZE-1;

% Como el prop�sito es trasladar estas funciones a C para utilizar en el
% microcontrolador se simplifican al m�ximo y se utilizan bucles for en
% lugar de funciones de MATLAB.

% C�lculo de 1 Scan completo.
for i = 1:1:b_SIZE-1
    scanTable(i)=b(i);
end;

for i = 1:1:c_SIZE
    scanTable(i+b_SIZE-1)=c(i);
end;

%scan_SIZE=b_SIZE-1+c_SIZE;
  
%% C�lculo de la tabla completa.
% Calculamos la tabla del primer tramo: desde eStart => eVtx1    
for i = 1:1:a_SIZE-1
    cvTable(i)=a(i);
end;

% Generamos finalmente la tabla completa incluyendo todos los tramos. 
for j= 1:1:NumberScans
    
    for i = 1:1:scan_SIZE
        cvTable(i+a_SIZE-1+(j-1)*(scan_SIZE-1))=scanTable(i);
    end;
    
end;