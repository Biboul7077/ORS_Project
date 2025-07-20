for (var i = 0; i <= springCount; i++)
{
	var _a = -k * springs[i] - d * springVelocity[i];
	springVelocity[i] += _a;
	springs[i] += springVelocity[i];
}

for (var i = 0; i <= springCount; i++)
{
	if i > 0
	{
		sringDeltaL[i] = spread *(springs[i] - springs[i-1]);
		springVelocity[i-1] += springDeltaL[i]
	}
	if i < springCount
	{
		sringDeltaR[i] = spread *(springs[i] - springs[i+1]);
		springVelocity[i+1] += springDeltaR[i]
	}
}

for (var i = 0; i <= springCount; i++)
{
	if i > 0			springs[i-1] += springDeltaL[i];
	if i < springCount	springs[i+1] += springDeltaR[i];
}