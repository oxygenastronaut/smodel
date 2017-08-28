t = 0:0.001:1;
t0 = 0.5;
sig = 0.02;
y = sin(2*pi*200*t);
env = exp(-((t - t0).^2)/(sig^2));
pulse1 = env .* y;
fpulse1 = fft(pulse1);

%plot(t,y)
%plot(t, env)
%plot(t, pulse1)
plot(abs(fpulse1))