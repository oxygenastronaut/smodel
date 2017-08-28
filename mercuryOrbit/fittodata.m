N = 20;
%x = zeros((N));
%y = zeros((N));

% y = 5x+7

for k = 1:20
	x(k) = k; %k-1;
	y(k) = 3*k %5*x(k) + 7 +5*(rand-0.5);
end

b1 = (N*sum(x.*y) - sum(y)*sum(x))/(N*sum(x.*x) - sum(x)*sum(x))
b2 = (1/N) * (sum(y) - b1*sum(x))
a = b1*x +b2;
%a = sum(x);