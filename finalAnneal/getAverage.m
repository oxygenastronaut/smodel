% function that returns a 3d vector that holds the average of the RGB values for a given image chunk

function Av = getAverage(x, y, imageMatrix, chunkSize)

	sumR = 0;
	sumG = 0;
	sumB = 0;
	maxX = x * chunkSize;
	maxY = y * chunkSize;
	bottomX = maxX - (chunkSize - 1);
	bottomY = maxY - (chunkSize - 1);

	tempImg = imageMatrix(bottomX:maxX, bottomY:maxY, :);

	Av = mean(reshape(tempImg, size(tempImg, 1) * size(tempImg, 2), size(tempImg, 3)));