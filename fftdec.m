function [ h ] = fftdec( out,in )
%FFTCONV FFT Deconvolution
%  [ h ] = fftdec(out,in)
% IN and OUT must be row vectors
% out = System Output, filtered/affected signal.
% in  = System Input, original signal.
% h = Impulse response - h(n)
% Script modified from:
% https://ccrma.stanford.edu/~jos/ReviewFourier/Example_FFT_Convolution.html
% By: Fernando Garcia de la Cruz, 20/06/2019
no = length(out);
ni = length(in);
nfft = 2^nextpow2(no+ni-1);
ozp = [out, zeros(1,nfft-no)];
izp = [in, zeros(1,nfft-ni)];
O = fft(ozp);
I = fft(izp);

Y = O ./ I;
h = real(ifft(Y));
end

