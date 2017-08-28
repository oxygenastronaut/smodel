function [t,y]=DiffGaus(Tw,Fs,t0,sig)
% Function call to create a pulse that is the second
% differential of a Gaussian
% Tw is the size of the time window in seconds
% Fs is the sampling frequency
% t0 is the location in time of the maximum of the pulse
% sig is the pulse width (the half-witdh of the Gaussian
% To start try [t,y]=DiffGaus(1,20000,0.5,0.02)
% which produces a 1 second pulse, sampled at 20000 samples per second
% with the pulse peak located at t0=0.5 i.e. half-way through the 
% time window. Use plot(t,y) to see the result.
t=0:1/Fs:Tw;
y=exp((-1/sig^2)*((t-t0).^2)).*(((4/sig^2)*(t-t0).^2)-2)*(-1/sig^2);
y=y/max(y);
end
