clc, clear all, close all, format compact
%----------------- INPUT -------------------
%Datos del carrier
Ac = 10;      %Volts
fc = 1000e3;    %Hertz
phi_c = 0;     %radians
%datos de entrada DATOS (bits)
bits = '00110100010';
tb = 50;
%----------------- PROCESS -------------------
%Construcción Carrier
cantper_c = length(bits)*2;
Tc = 1/fc;
tc = linspace(0,cantper_c*Tc,length(bits)*tb);
carrier = Ac*sin(2*pi*fc*tc + phi_c);
%construir cadena bits
uno = ones(1,tb);
cero = zeros(1,tb);
cadena = [];
for n=1:length(bits)
    if(bits(n)=='1')
        cadena = [cadena uno];
    else
        cadena = [cadena cero];
    end
end
bitstream = 5*cadena;

%modulación ASK (desplazamiento de Amplitud)
xask = bitstream.*carrier;

%----------------- OUTPUT -------------------
figure(1)
subplot(3,1,1),
plot(tc,carrier),title('Carrier/Portadora')
%axis([ xi xf yi yf ])
axis([ 0 cantper_c*Tc -Ac*5  Ac*5 ])

subplot(3,1,2),
plot(bitstream),title('DATOS (bits)')
%axis([ xi xf yi yf ])
axis([ 0 length(bitstream) -Ac*5  Ac*5 ])

subplot(3,1,3),
plot(xask),title('Señal ASK')
%axis([ xi xf yi yf ])
axis([ 0 length(xask) -Ac*5  Ac*5 ])


