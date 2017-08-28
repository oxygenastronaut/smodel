%*****************************************************************************************%
%**************************** Transfer Matrix ********************************************%
% Jonathan Shipley
% Scientific Modeling
% 4/28/17
% Description: This is the first program that runs through relfection and transmission with
%				changing angle.
%*****************************************************************************************%
%*****************************************************************************************%

% clear all previous variables
clear;

n = [1 1.5];
d = [0 0];
%n = [1 1.225 1.5];
%d = [0 123e-9 0];
lambda = 600e-9; % 600 nm
degrees = 0:1:90;
sqrte0u0 = sqrt(8.85418782e-12 * pi *4e-7);
numberOflayers = length(n) - 1;
% ask if p or s polarized
choice = input('Input p or so for polarization of light: ', 's')

% convert theta to radians
for k =1:length(degrees)
	theta(k) = degrees(k) * (pi / 180);
end


for k = 1:length(theta)
	
	M = cell(numberOflayers-1, 1);
	transferMatrix = [1 0; 0 1];
	% find all angles from reflection within layers
	phi(1) = theta(k);
	for noL = 1:numberOflayers
		phi(noL + 1) = acos(sqrt(1 - ((n(noL)/n(noL+1))^2) * sin(phi(noL))^2));
	end

	for q = 1:numberOflayers
		M{q} = getMatrixOfLayer(lambda, phi(q + 1), n(q + 1), d(q+1), choice);
		transferMatrix *= M{q};
	end
	m11 = transferMatrix(1,1);
	m12 = transferMatrix(1,2);
	m21 = transferMatrix(2,1);
	m22 = transferMatrix(2,2);

	% get y0 and ys
	if choice =='s'
		y0 = n(1) * sqrte0u0 * cos(phi(1));
		ys = n(end) * sqrte0u0 * cos(phi(end));
	elseif choice =='p'
		y0 = n(1) * sqrte0u0 / cos(phi(1));
		ys = n(end) * sqrte0u0 / cos(phi(end));
	end

	r(k) = (y0 * m11 + y0*ys*m12 - m21 - ys*m22)/(y0*m11 + y0*ys*m12 + m21 + ys*m22);
	R(k) = abs(r(k))^2;
end

if choice == 'p'
	plot(degrees, R, 'r')
	hold;
elseif choice =='s' 
	plot(degrees, R, 'b')
	hold;
end
title('Red is p-polarized, Blue is s-polarized')
xlabel('Degrees')
ylabel('Relectivity')
xlim([0 90])
ylim([0 1])