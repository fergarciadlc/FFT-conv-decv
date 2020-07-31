# FFT-conv-decv

Matlab - GNU/Octave functions for Fast convolution and deconvolution using Fast Fourier Transform (FFT).

![fft](https://user-images.githubusercontent.com/29163881/89087730-d73f7900-d35a-11ea-9620-f84fa21761a6.png)

Run the `example.m` script to see an example of the usage of the functions by filtering a white noise signal with an impulse response of a bandpass filter through FFT Convolution, and then by using the FFT deconvolution, extract the original IR using the original and filtered signals.

## FFT Convolution
The `fftconv.m` takes two parameters: an `x` row vector of a signal to be processed, and an `h` row vector of an Impulse Response signal, and returns a `y` vector with the fast convolution of the two signals.

### Usage:
    FFTCONV FFT convolution
    y = fftconv(x,h)

    x and h must be row vectors
    x = Data
    h = Impulse Response
    y = Output

## FFT Deconvolution
The `fftdec.m` takes two parameters: a row vector `out` of an affected/processed signal, and a row vector `in`: the original signal before being affected/processed, and returns a `y` vector with the Impulse Response of the system or Device Under Test.

### Usage:
    h = fftdec(out,in)
    
    IN and OUT must be row vectors
    out = System Output, filtered/affected signal.
    in  = System Input, original signal.
    y = Impulse response -> h(n)


## License:
Copyright (c) 2020 Fernando García de la Cruz

Licensed under the [MIT License](LICENSE).
