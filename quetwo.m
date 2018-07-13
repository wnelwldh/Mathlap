clear;
t0=0.1; fc=250; kf=100; fs=1000;
t=-t0:0.001:t0;

f_min=0.3;
n=2^(max(nextpow2(length(t)),nextpow2(1000/0.3)));
f_act=fs/n;
f=(0:f_act:f_act*(n-1))-fs/2;

m=sinc(100*t);
c=cos(2*pi*fc*t);
M_f=fft(m,n)/fs;

m_DSB=m.*t;
M_DSB=fft(m_DSB,n)/fs;
subplot(211);
plot(f,fftshift(abs(M_f)));
axis([-60 60 0 1 0.1]);
xlabel('Frequency');
title('Message signal in frequency domain');
subplot(212);
plot(f,fftshift(abs(M_DSB)));
axis([-60 60 0 1 0.6]);
xlabel('Frequency');
title('Modulated signal in frequency domain');