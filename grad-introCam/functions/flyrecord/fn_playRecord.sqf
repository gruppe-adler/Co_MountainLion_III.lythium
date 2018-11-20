/*
[vehicle player, 120, 30, false, 2] spawn BIS_fnc_UnitCapture;

grad_introCam_fnc_playRecord;
*/

private _introHeli = "RHS_MELB_AH6M" createVehicle [7454.85,13901.7,591.688];
createVehicleCrew _introHeli;
(group _introHeli) setBehaviour "CARELESS";
_introHeli engineOn true;
_introHeli setPilotLight true;
_introHeli setCaptive true;
(driver _introHeli) action ["CollisionLightOn", _introHeli];




private _introHeli2 = "RHS_MELB_AH6M" createVehicle [7479.66,13845.5,588.862];
createVehicleCrew _introHeli2;
(group _introHeli2) setBehaviour "CARELESS";
_introHeli2 engineOn true;
_introHeli2 setPilotLight true;
_introHeli2 setCaptive true;
(driver _introHeli2) action ["CollisionLightOn", _introHeli2];



private _introHeli3 = "RHS_MELB_MH6M" createVehicle [7444.45,13958.4,594.529];
createVehicleCrew _introHeli3;
(group _introHeli3) setBehaviour "CARELESS";
_introHeli3 engineOn true;
_introHeli3 setPilotLight true;
_introHeli3 setCaptive true;
(driver _introHeli3) action ["CollisionLightOn", _introHeli3];



[_introHeli, _introHeli2, _introHeli3] spawn {
	params ["_introHeli", "_introHeli2", "_introHeli3"];

	[ _introHeli, [] call GRAD_introCam_fnc_ah64, [], false, nil, nil, 15 ] spawn BIS_fnc_UnitPlay;
	[ _introHeli2, [] call GRAD_introCam_fnc_heli5, [], false, nil, nil, 15 ] spawn BIS_fnc_UnitPlay;
	[ _introHeli3, [] call GRAD_introCam_fnc_mh6_2, [], false, nil, nil, 15 ] spawn BIS_fnc_UnitPlay;

	sleep 110;

	_introHeli setvariable ["BIS_fnc_unitPlay_terminate",true];
	_introHeli2 setvariable ["BIS_fnc_unitPlay_terminate",true];
	_introHeli3 setvariable ["BIS_fnc_unitPlay_terminate",true];

	(group _introHeli) addWaypoint [[worldSize,0,100], 0];
	(group _introHeli2) addWaypoint [[worldSize,100,100], 0];
	(group _introHeli3) addWaypoint [[worldSize,200,100], 0];

	sleep 120;

	{_introHeli deleteVehicleCrew _x} forEach crew _introHeli;
	{_introHeli2 deleteVehicleCrew _x} forEach crew _introHeli2;
	{_introHeli3 deleteVehicleCrew _x} forEach crew _introHeli3;
	

	deleteVehicle _introHeli;
	deleteVehicle _introHeli2;
	deleteVehicle _introHeli3;

};

[_introHeli, _introHeli2, _introHeli3]