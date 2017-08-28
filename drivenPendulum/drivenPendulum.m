% Driven Pendulum and Chaos
% Program calculates angle as a function of time for driven Pendulum
% Assume that l = 9.81m so that the natural period of osciallation is w = 1 rad/s
% Driving frequency wD = 2/3. 
% Variables for input form user are driving force, Fd, initial release angle th1, and 
% damping parameter
% time step is dt = 0.04 s


% ask user for input for Fd, th1, and q, the damping parameter

% set all other known variables: wD, l, w, dt

t = 0:0.04:200;
amount = 200/0.04 +1;
dt = 0.04;
th = zeros(amount);
w = zeros(amount);
g = -9.81;
L = 9.81;
wD = 2/3;

Fd = input('Input Fd: ');
th(1) = input('Input th(1): ');
q = input('Input q: ');
%Fd = 0;
%th(1) = 0.5;
%q = 0.75;

for k = 1:amount
	w(k+1) = w(k) + ((g/L)*sin(th(k))- q*w(k)+Fd*sin(wD*t(k)))*dt;
	th(k+1) = th(k) +w(k+1)*dt;
 end


%plot(t, th, 'g')