params ["_position", "_lifetime", ["_intensity",5], ["_uplift", 0.001], ["_rgb", [0.1,0.05,0.025]], ["_transparency",1]];
_rgb params ["_colorR", "_colorG", "_colorB"];

private _grad_dust = "#particlesource" createVehicleLocal _position; 

private _interval = 0.5;
private _duration = 1;

/* _grad_dust setParticleCircle [10, [0, 0, 0]]; */

_grad_dust setParticleParams [
		["\A3\data_f\cl_basic", 1, 0, 1],
		 "", "Billboard", 1, _lifetime, 
		 [0, 0, 0], 
		 [0, 0, _uplift], 0.3, 
		 10,
		 8,
		 0.001,
		 [7, 7, 8, 9, 11], 
		 [
		 	[0, 0, 0, 1],
		 	[_colorR, _colorG, _colorB, _transparency/2],
		 	[_colorR, _colorG, _colorB, _transparency/4],
		 	[_colorR, _colorG, _colorB, _transparency/8],
		 	[_colorR, _colorG, _colorB, 0]
		 ], 
		 [0.08], 0, 0, "", "", _grad_dust, 0, true, 1];


_grad_dust setDropInterval _interval;

/* _grad_dust setParticleRandom [10, [0.25, 0.25, 0], [1, 1, 0], 1, 1, [0, 0, 0, 0.1], 0, 0];*/	

sleep _duration;

deleteVehicle _grad_dust;