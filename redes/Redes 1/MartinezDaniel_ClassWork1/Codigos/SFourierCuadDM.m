clc, clear all, close all, format compact
%--------------- INPUT ----------------------
A = 10;
f = 3400;
cp = 1;
%--------------- PROCESS ----------------------
T = 1/f;
t = linspace(0,cp*T,1000);
cf1 = (A/1)*sin(2*pi*1*f*t);
cf2 = (A/3)*sin(2*pi*3*f*t);
cf3 = (A/5)*sin(2*pi*5*f*t);
cf4 = (A/7)*sin(2*pi*7*f*t);
cuadrada_1cf = cf1;
cuadrada_2cf = cf1 + cf2;
cuadrada_3cf = cf1 + cf2 + cf3;
cuadrada_4cf = cf1 + cf2 + cf3 + cf4;
% transformada de Fourier
tf_1cf = abs(fft(cuadrada_1cf));
tf_2cf = abs(fft(cuadrada_2cf));
tf_3cf = abs(fft(cuadrada_3cf));
tf_4cf = abs(fft(cuadrada_4cf));

%--------------- OUTPUT ----------------------
figure(1)
subplot(2,2,1),plot(t,cuadrada_1cf)
subplot(2,2,2),plot(t,cuadrada_2cf)
subplot(2,2,3),plot(t,cuadrada_3cf)
subplot(2,2,4),plot(t,cuadrada_4cf)

figure(2)
subplot(2,2,1),stem(tf_1cf(1:20))
subplot(2,2,2),stem(tf_2cf(1:20))
subplot(2,2,3),plot(tf_3cf(1:20))
subplot(2,2,4),plot(tf_4cf(1:20))


