function [ y ] = fftconv( x,h )
%FFTCONV FFT convolution
%  [ y ] = fftconv(x,h)
% x and h must be row vectors
% x = Data
% h = Impulse Response
% y = Output
% Source:
% https://ccrma.stanford.edu/~jos/ReviewFourier/Example_FFT_Convolution.html

nx = length(x);
nh = length(h);
nfft = 2^nextpow2(nx+nh-1);
xzp = [x, zeros(1,nfft-nx)];
hzp = [h, zeros(1,nfft-nh)];
X = fft(xzp);
H = fft(hzp);

Y = H .* X;
y = real(ifft(Y));
end

