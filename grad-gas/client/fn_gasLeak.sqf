params ["_obj", "_angle"];

private ["_gasLeak", "_gasClouds", "_radius"];

if (player call BIS_fnc_isCurator) exitWith {};

_radius = 7;

/*
_gasLeak = "#particlesource" createVehicleLocal _pos; 
_gasLeak setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 1.5],
 [-2, -2.5, -0.3], 0, 10, 7.9, 0.075, [0.2, 3], [[0.7, 0.7, 0.7, 0.01], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", "",_angle];
_gasLeak setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_gasLeak setParticleCircle [0, [0, 0, 0]];
_gasLeak setDropInterval 0.05;

_gasClouds = "#particlesource" createVehicleLocal _pos; 
_gasClouds setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 12, [0, 0, -6], [0, 0.2, -0.03], 1, 1.275, 1, 0, [4], [[1, 1, 1, 0], [1, 1, 1, 0.5], [1, 1, 1, 0]], [1000], 1, 0, "", "", "",_angle];
_gasClouds setParticleRandom [5, [_radius, _radius, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_gasClouds setParticleCircle [1, [0, 0, 0]];
_gasClouds setDropInterval 0.1;
*/

private _pos = position _obj;
private _dir = 270; // getDir _obj;
private _speed = 1;
private _vector = [(sin _dir*_speed),(cos _dir*_speed), 0];

_gasLeak = "#particlesource" createVehicleLocal [_pos select 0, _pos select 1, 0.5]; 
_gasLeak setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 2, [0, 0.2, 0.4],
 _vector, 0, 10, 7.9, 0.075, [0.01, 0.01, 0.1, 0.2], [[1, 1, 1, 0], [1, 1, 1, 0.1], [1, 1, 1, 1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", "",_angle];
_gasLeak setParticleCircle [0, [0, 0, 0]];
_gasLeak setDropInterval 0.1;

_gasClouds = "#particlesource" createVehicleLocal _pos; 
_gasClouds setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 10, [0, 0, -6], 
[0, 0.2, -0.03], 1, 1.275, 1, 0, [0, 10], [[1, 1, 1, 0], [1, 1, 1, 0.2], [1, 1, 1, 0]], [1000], 1, 0, "", "", "",_angle];
_gasClouds setParticleRandom [5, [_radius, _radius, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_gasClouds setParticleCircle [1, [0, 0, 0]];
_gasClouds setDropInterval 0.1;




[{
    params ["_args", "_handle"];
    _args params ["_obj", "_gasLeak", "_gasClouds"];

    
    if (missionNamespace getVariable ["grad_gas_leakClosed", false]) exitWith {
    	deleteVehicle _gasLeak;
    	deleteVehicle _gasClouds;
    	[_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (!isNull _obj) then {
        _obj say3D ["steam", 30];
    };

},4.05,[_obj, _gasLeak, _gasClouds]] call CBA_fnc_addPerFrameHandler;

// delete sound
[{
     params ["_args", "_handle"];
    _args params ["_obj"];

    if (missionNamespace getVariable ["grad_gas_leakClosed", false]) exitWith {
        deleteVehicle _obj;
    };

},0.5,[_obj]] call CBA_fnc_addPerFrameHandler;