clc, clear all, close all, format compact
%----------------- INPUT -------------------
%Datos del carrier
Ac = 10;      %Volts
fc = 1000e3;    %Hertz
phi_c = 0;     %radians
cantper_c = 18;%cantidad periodos a visualizar
%Datos del DATOS Analógicos
Ax = 2;      %Volts
fx = 3400;    %Hertz
phi_x = 0;     %radians
cantper_x = 2;%cantidad periodos a visualizar
%índice de modulación AM:   0 < m <=1
m = 0.4;
%índice de modulación FM/PM:  n >= 2
n = 2;

%----------------- PROCESS -------------------
%Construcción Carrier
Tc = 1/fc;
tc = linspace(0,cantper_c*Tc,1000);
carrier = Ac*sin(2*pi*fc*tc + phi_c);
%Construcción DATOS Analógicos
Tx = 1/fx;
tx = linspace(0,cantper_x*Tx,1000);
xt = Ax*sin(2*pi*fx*tx + phi_x);
%modulación AM
xam = (1 + m*xt).*carrier;
%modulación FM
xfm = Ac*sin(2*pi*fc*tc + n*xt);
%modulación PM
xt_diff = Ax*sin(2*pi*fx*tx + (phi_x + pi/2));
xpm = Ac*sin(2*pi*fc*tc + n*xt_diff);



%----------------- OUTPUT -------------------
figure(1)
subplot(5,1,1), plot(tc,carrier),title('Carrier/Portadora')
subplot(5,1,2), plot(tx,xt),title('Datos Analógicos')
subplot(5,1,3), plot(tc, xam),title('Señal AM')
subplot(5,1,4), plot(tc, xfm),title('Señal FM')
subplot(5,1,5), plot(tc, xpm),title('Señal PM')