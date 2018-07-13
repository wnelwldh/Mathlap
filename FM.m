
df=0.2 ;           
ts=1/4000;         
fs=1/ts;           
fc=300;           
kf=50  ;         

T1=0; T2=0.15;    
t=(T1:ts:T2);    
m=[ones(1,T2/(3*ts)),-2*ones(1,T2/(3*ts)),zeros(1,T2/(3*ts)+1)]; 
 
int_m(1)=0; 
for i=1:length(t)-1      
int_m(i+1)=int_m(i)+m(i)*ts;   
echo off ; 
end
echo on ;
[M,m,df1]=fftmod(m,ts,df);   
M=M/fs;                  
f=[0:df1:df1*(length(m)-1)]-fs/2;      
s_m=cos(2*pi*(fc*t + kf*int_m));   
[S_m,s_m,df1]=fft_mod(s_m,ts,df);     
S_m=S_m/fs;                    
pause 
 
subplot(2,1,1) 
plot(t,m(1:length(t)))
axis([T1 T2 -2.1 2.1]) 
xlabel('Time') 
title('Message signal') 
subplot(2,1,2) 
plot(t,s_m(1:length(t))) 
axis([T1 T2 -2.1 2.1]) 
xlabel('Time') 
title('Modulated signal') 
pause   
subplot(2,1,1) 
plot(f,abs(fftshift(M)))  
xlabel('Frequency') 
title('Magnitude spectrum of the message signal') 
subplot(2,1,2) 
plot(f,abs(fftshift(S_m)))  
title('Magnitude spectrum of the modulated signal') 
xlabel('Frequency') 
pause    
