%*****************************************************************************************%
%*************** Final Project - Simulated Annealing Image Processing ********************%
% Jonathan Shipley
% Scientific Modeling
% 4/28/17
% Description: This program creates an image of random static. Each "pixel" will have a 
%		RGB color value that ranges from 0 to 1. So many colors are possible. This 
%		program will then sort that random image using simulated annealing.
%		There will be a sort of "potential energy" that will be associated with the cost.
%		A "temperature" will also be present. 
%				
%*****************************************************************************************%
%*****************************************************************************************%

% clear all previous variables
clear;

% % n by n matrix. Third element represents a 'page'. 
% % Page 1 is red; 2 is green, 3 is blue

chunkSize = 50;

costMatrix = getCostMatrix(chunkSize);

Msize = 2000/chunkSize;

image(costMatrix);
title('Reference');

% now that average values have been calculated, simulatd annealing can begin
% M will represent the randomized set of pixels
M = rand(Msize, Msize, 3);
T = 100;
% image(M);
% initialize costs that are associated with each R, G, and B value from 0 to 1 of the randomized image set;
MRcost = [0 0 0];

% while T > 0.1 * T
figure;
% iterate through entire M matrix
for k = 1:50
	for a = 1:Msize
		for b = 1:Msize
			% create a new randomized pixel to possibly swap with pixel of M depending upon cost
			newPixel = rand(1, 3);
			% calculate "cost" of M - costMatrix
			MRcost = M(a, b, :) - costMatrix(a, b, :);
			newPixelCost = newPixel - costMatrix(a, b, :);
			MRcostMag = sqrt(sum(MRcost.*MRcost));
			newPixelCostMag = sqrt(sum(newPixelCost.*newPixelCost));
			if abs(newPixelCostMag) < abs(MRcostMag)
				% keep new pixel
				M(a, b, :) = newPixel;
				image(M);
				drawnow();
			end
		end
	end
end


