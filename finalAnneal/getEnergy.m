% returns the average "energy" of an image
% energy will be defined as the "noise" of the image

% for example, the energy of two pixels will be the sum of the absolute value 
% of the difference between the pixels' colors. 

% then find the average for the image

function energy = getEnergy(Msize, M)

totalE = 0;

for a=1:Msize
	for b=1:Msize
		if b ~=Msize && a~=Msize
			energyR = abs(M(a,b,:)-M(a+1,b,:));
			totalE += energyR;
		end
		if a~=1
			energyU = abs(M(a,b,:) - M(a-1, b, :));
			totalE += energyU;
		end
	end
end

energy = sqrt(sum(totalE.*totalE));