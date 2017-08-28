% function that returns the transfer matrix of a given layer

function M = getMatrixOfLayer(lambda, thetaOut, indexn, dThick, pOrs)

	sqrte0u0 = sqrt(8.85418782e-12 * pi *4e-7);
	% get delta
	delta = ((2 *pi)/ lambda) * indexn * dThick * cos(thetaOut);

	% get y1
	if pOrs == 's'
		y1 = (indexn * sqrte0u0) * cos(thetaOut);	% s polarized
	elseif pOrs =='p'
		y1 = (indexn * sqrte0u0) / (cos(thetaOut));	% p polarized
	end

	m11 = cos(delta);
	m12 = 1i * sin(delta)/y1;
	m21 = 1i * y1 * sin(delta);
	m22 = cos(delta);

	M(1,1) = m11;
	M(1,2) = m12;
	M(2,1) = m21;
	M(2,2) = m22;
