/*
 [this] call GRAD_civPartisans_fnc_addLeafletAction;
*/

params ["_vehicle"];

_vehicle addAction ["
	['fired', 
		[position (_this select 0), position (_this select 0) select 2]
	] remoteExec ['grad_civPartisans_fnc_leafLets', [0,-2] select isDedicated];"
];

// ["fired",[position this,getPos this select 2]] spawn GRAD_civPartisans_fnc_leafLets;