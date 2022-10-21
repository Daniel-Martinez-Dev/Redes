clc, clear all, close all, format compact
%---------IMPUT-------------
%datos de canales (1-3)
ch1 ='a';
ch2 ='b';
ch3 ='c';
%---------PROCESS-------------
%conversion de texto -> ascii
ascii_ch1 = double(ch1);
ascii_ch2 = double(ch2);
ascii_ch3 = double(ch3);
%conversion de texto -> bits
bits_ch1_7b = dec2bin(ch1);
bits_ch2_7b = dec2bin(ch2);
bits_ch3_7b = dec2bin(ch3);
%conversion de 7bits -> bits
bits_ch1_8b = ['0' bits_ch1_7b];
bits_ch2_8b = ['0' bits_ch2_7b];
bits_ch3_8b = ['0' bits_ch3_7b];
%particionamiento
ch1_par_A1 = bits_ch1_8b(1:4);
ch1_par_A2 = bits_ch1_8b(5:8);
ch2_par_B1 = bits_ch2_8b(1:4);
ch2_par_B2 = bits_ch2_8b(5:8);
ch3_par_C1 = bits_ch3_8b(1:4);
ch3_par_C2 = bits_ch3_8b(5:8);
%construccion del frame
frame_1 = [ ch1_par_A1 ch2_par_B1 ch3_par_C1];
frame_2 = [ ch1_par_A2 ch2_par_B2 ch3_par_C2];
%trasmicion de datos
tx_datos = [frame_1 frame_2];
%---------OUTPUT-------------
tb = 50;
regla_bit_alto = 1;
bitstream_ch1 = newBitStream(bits_ch1_8b,tb,regla_bit_alto)
bitstream_ch2 = newBitStream(bits_ch2_8b,tb,regla_bit_alto)
bitstream_ch3 = newBitStream(bits_ch3_8b,tb,regla_bit_alto)
bitstream_TDM = newBitStream(tx_datos,tb,regla_bit_alto)
figure(1)
subplot(2,3,1),plot(bitstream_ch1)
titulo = cat(2,'CH1:',bits_ch1_8b),title(titulo)
axis([ 0 length(bitstream_ch1) -1 6 ])
xticks([ linspace(0,length(bitstream_ch1),length(bits_ch1_8b)+1) ])
xticklabels([]), grid on
subplot(2,3,2),plot(bitstream_ch2)
titulo = cat(2,'CH2:',bits_ch2_8b),title(titulo)
axis([ 0 length(bitstream_ch2) -1 6 ])
xticks([ linspace(0,length(bitstream_ch2),length(bits_ch2_8b)+1) ])
xticklabels([]), grid on
subplot(2,3,3),plot(bitstream_ch3)
titulo = cat(2,'CH3:',bits_ch3_8b),title(titulo)
axis([ 0 length(bitstream_ch3) -1 6 ])
xticks([ linspace(0,length(bitstream_ch3),length(bits_ch3_8b)+1) ])
xticklabels([]), grid on
subplot(2,3,[4:6]),plot(bitstream_TDM)
titulo = cat(2,'CH3:',tx_datos),title(titulo)
axis([ 0 length(bitstream_TDM) -1 6 ])
xticks([ linspace(0,length(bitstream_TDM),length(tx_datos)+1) ])
xticklabels([]), grid on