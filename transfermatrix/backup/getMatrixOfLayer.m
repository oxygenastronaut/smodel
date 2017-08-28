function M = getMatrixOfLayer(lambda, thetaOut, indexn, dThick)

	sqrte0u0 = sqrt(8.85418782e-12 * pi *4e-7);
	% get delta
	delta = ((2 *pi)/ lambda) * indexn * dThick * cos(thetaOut);

	% get y1
	y1 = (indexn * sqrte0u0) / cos(thetaOut);

	m11 = cos(delta);
	m12 = 1i * sin(delta)/y1;
	m21 = 1i * y1 * sin(delta);
	m22 = cos(delta);

	M(1,1) = m11;
	M(1,2) = m12;
	M(2,1) = m21;
	M(2,2) = m22;