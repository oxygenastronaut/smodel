% this functions returns the matrix that is associated with the cost of the final program
% it does this by finding the average color values of small "chunks" within the reference image
% a matrix is made to hold those average values. In this particular case, the chunkMatrix will be
% 200x200x3. Each chunk within the reference image will be a 10x10 square of pixels.
% for this particular image, it was altered to be square for ease of calculation. 


function chunkMatrix = getCostMatrix(squareSize);

% n by n matrix. Third element represents a 'page'. 
% Page 1 is red; 2 is green, 3 is blue

starfox = imread('20001333.jpg');	 				% reference image, starfox and friends
% image size is 1333x2000 so make image a square
reference = cat(1, ones(333, 2000, 3), starfox);	% adds black strip to top
reference = cat(1, reference, ones(334, 2000, 3));	% adds black strip to bottom

% create matrix holding average color values
%squareSize = chunkSize;
cM = size(reference)(1)/ squareSize;		
chunkMatrix = ones(cM, cM, 3);

% assign average color values of reference image to chunkMatrix
% chunk size is currently 10 x 10;
for x=1:cM			% rows
	for y =1:cM 	% columns
		chunkMatrix(x, y, :) = getAverage(x, y, reference, squareSize);
	end
end

% color code for chunkMatrix is currently 255 style. to convert to matlab 0-1, divide by 255
chunkMatrix = chunkMatrix /255.;