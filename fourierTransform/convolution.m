% Convolutiing a square plot with itself
x = [0 0 0 0 0 1 1 1 1 1 0 0 0 0 0];
xx = conv(x, x);

% Convoluting a triangle plot with itself
p = [0 0 0 0 1 2 3 4 5 4 3 2 1 0 0 0 0];
pp = conv(p, p);

% Smoothing a noisy signal
t = 0:0.001:1;
w = 2*pi*3;
y = sin(w*t);	% sin wave is "clean"
% creating a noisy signal
for k=1:max(size(t))
	noise(k) = rand*0.2;
end
% adding noise to the signal
yn = y + noise;
% smoothing
binom = (1/64)*[1 6 15 20 15 6 1];
yfilt = conv(binom, yn);
yfilt1 = conv(binom, yfilt);
yfilt2 = conv(binom, yfilt1);
for i =1:100;
	yfilt2 = conv(binom, yfilt2);
end

% Excersize 3
H = zeros(1, 22051);
H(1:500) = 1;
H(22052-499, 22051) =1;
filt = ifft(H);
filt(fftshift(filt));
