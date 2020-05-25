clc;
close all;
clear all;
fc = 3000;
fs = 10000;
fdev = 50;
t = (0:1/fs:0.2); 
a = audiorecorder;
disp("Start speaking")
recordblocking(a,10);
disp("End of recording")
p = play(a);
b = getaudiodata(a);
filename = 'reordedAudio.wav';
audiowrite(filename,b,fs);
clear b fs
[b,fs]=audioread(filename);
subplot(4,1,1),plot(b);
title('Message Signal');
xlabel('time(t)');
ylabel('Amplitude');


yc = sin(2*pi*fc*t);
subplot(4,1,2),plot(yc);
title('Carrier Signal');
xlabel('time(t)');
ylabel('Amplitude');

m = fmmod(b,fc,fs,fdev);

subplot(4,1,3),plot(m);
title('Modulated Signal');
xlabel('time(t)');
ylabel('Amplitude');

d = fmdemod(m,fc,fs,fdev);
subplot(4,1,4),plot(d);
title('Demodulated Signal');
xlabel('time(t)');
ylabel('Amplitude');
pause(5);
sound(d);





