
clc;
clear;
 
df=0.2;
ts=1/2000;
fs=1/ts;
fc=200;
kf=50;
%-------------------------------------- settings
 
T1=0; T2=0.15;
t=(T1:ts:T2);
m=[ones(1,T2/(3*ts)),-2*ones(1,T2/(3*ts)),zeros(1,T2/(3*ts)+1)]; %message signal
 
m_intg=kf*ts*cumsum(m);
s_fm=cos(2*pi*200*t+m_intg);
lfft=length(t);lfft=2^ceil(log2(lfft)+1);
s_fm=fftshift(fft(s_fm,lfft));
freqs=(-lfft/2:Llfft/2-1)/(lfft*ts);


 
subplot(2,1,1)
plot(t,m(1:length(t)))
axis([T1 T2 -2.1 2.1])
xlabel('Time')
title('Message Signal')
subplot(2,1,2)
plot(t,s_m(1:length(t)))
axis([T1 T2 -2.1 2.1])
xlabel('Time')
title('Modulated Signal')
pause % spectrum
 
subplot(2,1,1)
plot(f,abs(fftshift(M)))
xlabel('Frejquency')
title('Magnitude Spectrum Of The Message Signal')
subplot(2,1,2)
plot(f,abs(fftshift(S_m)))
title('Magnitude Spectrum Of The Modulated Signal')
xlabel('Frequency')