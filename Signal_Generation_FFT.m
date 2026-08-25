clc;
clear;
close all;

% Sampling parameters
Fs = 1000;              % Sampling frequency (Hz)
T = 1/Fs;               % Sampling period
L = 1000;               % Number of samples
t = (0:L-1)*T;          % Time vector

% Signal parameters
f1 = 50;                % First frequency (Hz)
f2 = 120;               % Second frequency (Hz)

% Generate composite signal
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t);

% Plot time-domain signal
figure;
plot(t, x);
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Composite Signal - Time Domain');
grid on;

% Compute FFT
Y = fft(x);

% Two-sided spectrum
P2 = abs(Y/L);

% Single-sided spectrum
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% Frequency axis
f = Fs*(0:(L/2))/L;

% Plot frequency spectrum
figure;
plot(f, P1);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT - Frequency Domain');
grid on;
xlim([0 200]);
