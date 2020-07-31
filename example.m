clc; clear;close all;
Fs=44100;

% Generate 1 second of white noise
rand('state',sum(100 * clock));
noise = randn(1, Fs);
noise = noise / max(abs(noise));

% BAND PASS FILTER
fc=1000;                % Central Frequency
f1=fc/2^0.5;
f2=fc*2^0.5;
w1=2*pi*f1/Fs;
w2=2*pi*f2/Fs;
wc=2*pi*fc/Fs;

ncof=200;               % number of coeficients,
if rem(ncof, 2)         % must be even 
    ncof=ncof+1;
end
n=0:ncof;
M=length(n)-1;          % filter order
% Filter
h=sin(w2*(n-(M/2)))./((n-(M/2))*pi)-sin(w1*(n-(M/2)))./((n-(M/2))*pi);
h(M/2+1)=(w2-w1)/pi;

% Filter white noise
filternoise = fftconv(noise,h);
% Extract IR from filtered noise
hnew = fftdec(filternoise,noise);

% White noise spectrum
nf=4096; %number of point in DTFT
Yw = fft(noise,nf);
fw = Fs/2*linspace(0,1,nf/2+1);
% Filtered white noise spectrum
Yf = fft(filternoise,nf);

subplot(221)
semilogx(fw,abs(Yw(1:nf/2+1))); title('White noise spectrum');
xlabel('Frequency (Hz)'); ylabel('Magnitude')
xlim([500 10000]);
subplot(222)
semilogx(fw,abs(Yf(1:nf/2+1))); title('Filtered white noise spectrum');
xlim([100 10000]);
xlabel('Frequency (Hz)'); ylabel('Magnitude')
subplot(223)
plot(h); title('Original IR - BandPass Fitler');
xlim([0 length(h)]);
xlabel('Samples'); ylabel('Amplitude')
subplot(224)
plot(hnew); title('Extracted IR');
xlim([0 length(h)]);
xlabel('Samples'); ylabel('Amplitude')

