clc, clear all, close all, format compact
%------------- INPUT -------------------
A = 10;      %Volts
f = 3400;    %Hertz
phi = 2*pi     %radians
cantper = 2;%cantidad periodos a visualizar
compfreq = 10; %componentes de freq (series Fourier)
%------------- PROCESS -------------------
%Construcciòn Señal Sinusoidal
T = 1/f;
t = linspace(0,cantper*T,1000);
xt = A*sin(2*pi*f*t + phi);
%Construcciòn Señal Cuadrada (Serie Fourier)
cuadrada = 0;
for n=1:2:(compfreq*2-1)
    cuadrada = cuadrada + ((4*A)/(n*pi))*sin(2*pi*n*f*t);
end
%Construcciòn Señal Triangular (Serie Fourier)
triangular = 0;
for n=1:2:(compfreq*2-1)
    triangular = triangular + ((8*A)/((n^2)*(pi^2)))*cos(2*pi*n*f*t);
end
%Construcciòn Señal Diente Sierra (Serie Fourier)
sierra = 0;
for n=1:(compfreq)
    sierra = sierra + ((-1)^(n+1))*((2*A)/(n*pi))*sin(2*pi*n*f*t);
end

%------------- OUTPUT -------------------
figure(1)
subplot(2,2,1), plot(t,xt), title('Señal Sinusoidal')
subplot(2,2,2), plot(t,cuadrada), title('Señal Cuadrada')
subplot(2,2,3), plot(t,triangular), title('Señal Triangular')
subplot(2,2,4), plot(t,sierra), title('Señal Diente Sierra')







