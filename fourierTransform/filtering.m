%*****************************************************************************************%
%**************************** Fourier Transfrom and Filtering  ***************************%
% Jonathan Shipley
% Scientific Modeling
% 3/2/17
% Description: 
% Important Parameters: 
% Input: 	
% Output: 	
%*****************************************************************************************%
%*****************************************************************************************%

% clear variables from previous runs
clear;

t = 0.1:0.0001:1;
dt = [0.1 0.07525 0.0505 0.02575 0.001]

hold;
for k=1:5
	y = sin(2*pi*200*t);	% Max frequency is 5000 Hz
	env = exp(-(t-0.5).^2/(dt(k))^2);
	pulse = env.*y;
	ftpulse = fft(pulse);
	df(k) = (max(abs(ftpulse)));
	plot(abs(ftpulse))
	title('ftpulse')
end

figure
plot(t, pulse)
title('t vs pulse')

figure
plot(df, dt)
title('df vs dt')

%sound(pulse, 10000);

[y, fs] = audioread('SignalNoise.wav'); % audioread for use in octave
%sound(y, fs)
fmessage = fft(y);
plot(abs(fmessage))

filt = ones(size(fmessage), 1);
filt(1000:1400) = 0;
filt(3600:4400) = 0;
filt(169000:170400) = 0;
filt(172600: 173200) = 0;

filtered = fmessage .*filt;
message = ifft(filtered);
sound(message, fs)