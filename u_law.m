close all;
x=0:0.01:100;
data=x.*sin(x); 
%a sinusoidal function with inc. amplitude
V=max(data);
%maximum value of input function
u=255; 
%companding factor, 255 for 8bit op resolution
manualcomp=V*log(1+u*abs(data)/V).*sign(data)/log(1+u)
%Compaunding data through mu law 
autocmpd1=compand(data,255,max(data),'mu/compressor');
%u law companding using inbuilt function
%replace mu with a and 255 with 87.6 for A law companding 


subplot(3,1,1);
plot(data); title('Original signal'); 
subplot(3,1,2);
plot(autocmpd1); title('Inbuilt function');ylabel('Amplitude');
subplot(3,1,3);
plot(manualcomp); title('Using U law definition');xlabel('0<=x=<100');
