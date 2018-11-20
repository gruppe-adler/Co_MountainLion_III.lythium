/*
 	0 (Object): The vehicle that was created.
    1 (Group): The group that the vehicle belongs to.
    2 (Scalar): Number of vehicles spawned and currently controlled by the script.
    3 (Scalar): Calculated maximun number of units that the script will try to spawn (depends on spwn markers
    etc.).
*/

params ["_vehicle", "_group"];

// hint format ["%1 - %2", _vehicle, _group];

{ 
	[_x, false] call GRAD_civPartisans_fnc_equip;
    [_x] call GRAD_civPartisans_fnc_addKilledEH;
    
} forEach units _group;