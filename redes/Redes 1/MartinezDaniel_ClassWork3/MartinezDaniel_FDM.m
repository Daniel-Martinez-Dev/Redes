clc, clear all, close all, format compact
%---------IMPUT-------------
%Datos de entradas analogas
%channel 1
A1 = 2;
F1 = 3100;
%Channel 2
A2 = 3;
F2 = 3200;
%Channel 3
A3 = 2.5;
F3 = 3400;
%---------PROCESS-------------
%Construccion channel1
T1 = 1/F1;
t1 = linspace(0,2*T1,500);
signal_ch1 = A1*sin(2*pi*F1*t1 + 0);
%Construccion channe2 
T2 = 1/F2;
t2 = linspace(0,2*T2,500);
signal_ch2 = A1*sin(2*pi*F2*t2 + pi/2);
%Construccion channe3
T3 = 1/F3;
t3 = linspace(0,2*T3,500);
signal_ch3 = A1*sin(2*pi*F3*t3 + pi);
%Construccion carriers(portadores)
Ac = 10;
%Carrier Channel1
Fc1 = 500e3;
Tc1 = 1/Fc1;
tc1 = linspace(0,15*Tc1,500);
carrier_ch1 = Ac*sin(2*pi*Fc1*tc1);
%Carrier Channel2
Fc2 = 1000e3;
Tc2 = 1/Fc2;
tc2 = linspace(0,15*Tc2,500);
carrier_ch2 = Ac*sin(2*pi*Fc2*tc2);
%Carrier Channel3
Fc3 = 1500e3;
Tc3 = 1/Fc3;
tc3 = linspace(0,15*Tc3,500);
carrier_ch3 = Ac*sin(2*pi*Fc3*tc3);
%Realizacion de las modulaciones internas del MUX FDM
m = 0.4;
%Modulacion AM channel 1
mod_ch1 = (1 + m*signal_ch1).*carrier_ch1;
mod_ch2 = (1 + m*signal_ch2).*carrier_ch2;
mod_ch3 = (1 + m*signal_ch3).*carrier_ch3;
%Multiplexacion por divicion de frecuencias (FDM)
signal_FDM = mod_ch1 + mod_ch2 + mod_ch3;
%Visualizacion en el dominio dela frecuencia (Transformada Fourier)
signal_TF_FDM = abs(fft(signal_FDM));
%---------OUTPUT-------------
figure(1)
%Graficar los datos analogos de entrda
subplot(3,3,1),plot(t1,signal_ch1), title('Channel 1: Data 1');
subplot(3,3,2),plot(t2,signal_ch2), title('Channel 2: Data 2');
subplot(3,3,3),plot(t3,signal_ch3), title('Channel 3: Data 3');
%Graficade los carrier 
subplot(3,3,4),plot(tc1,carrier_ch1), title('Channel 1: carrier'); 
subplot(3,3,5),plot(tc2,carrier_ch2), title('Channel 2: carrier ');
subplot(3,3,6),plot(tc3,carrier_ch3), title('Channel 3: carrier ');
%Graficar las modulacones internas del MTX FDM
subplot(3,3,7),plot(tc1,mod_ch1), title('Channel 1: modulacion AM'); 
subplot(3,3,8),plot(tc2,mod_ch2), title('Channel 2: modulacion AM ');
subplot(3,3,9),plot(tc3,mod_ch3), title('Channel 3: modulacion AM ');
figure(2)
subplot(2,1,1),plot(signal_FDM), title('MUX OUPUT:FDM signal');
subplot(2,1,2),plot(signal_TF_FDM(1:40)), title('MUX OUPUT:FDM signal in freq');