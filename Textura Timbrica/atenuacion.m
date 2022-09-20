% Copyright (C) Ingenieria Electronica. 2016 UdeC
%  
% -*- texinfo -*-
% @deftypefn  {Function File} {@var{Aem} @var{Aev}} = atenuacion (@var{Tw},
% @var{Ts}, @var{fs}, @var{vector})
% Calcula la atenuaci�n espectral de  @var{vector}.
% % @table @asis
% @item @var{Tw}:
% Tiempo de duraci�n de los marcos.
% 
% @item @var{Ts}:
% Tiempo de superposici�n de los marcos.
% 
% @item @var{fs}:
% Muestras por segundo a la cual se muestre� @var{vector}.
% 
% @item @var{vector}:
% Se�al de audio a analizar.
% @end table
%  
% La salida es:
% 
% @table @asis
% @item @var{Aem}:
% Valor medio de la atenuaci�n espectral.
% 
% @item @var{Aev}:
% Varianza de la atenuaci�n espectral.
% @end table
% 
% Ver: "Musical Genre Clasification of Audio Signals". Tzanetakis, 
% Cook. 2002
% 
% @seealso{centroide, flujo, cruce, low_e}
% @end deftypefn
% 
% Author: Sebasti�n Mu�oz <sebastianmg.info@gmail.com>
% Created: 2016

%function[Aem Aev]=atenuacion(Tw,Ts,fs,vector)
function[Ae]=atenuacion(Tw,Ts,fs,vector)

Nw=round(1E-3*Tw*fs);    % duraci�n del marco en muestras
Ns=round(1E-3*Ts*fs);    % duraci�n del cambio de marco en muestras

nfft=2^nextpow2(Nw);     % Longitud del an�lisis FFT

% Enmarcado y ventanamiento (marcos como columnas)
frames=vec2frames(vector,Nw,Ns);

% C�lculo del espectro de magnitud (como vectores columna)
MAG=abs(fft(frames,nfft,1)); 

Ae=0.85.*(sum(MAG));     % Atenuaci�n Espectral

%Aem=mean(Ae);
%Aev=var(Ae);

end
