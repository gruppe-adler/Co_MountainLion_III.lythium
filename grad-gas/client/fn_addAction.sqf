params ["_object", "_duration", ["_actionName", "Search"]];

[
	_object,											// Object the action is attached to
	_actionName,										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Progress icon shown on screen
	"_this distance _target < 3",						// Condition for the action to be shown
	"_caller distance _target < 3",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ missionNamespace setVariable ["grad_gas_leakClosed", true, true]; },				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	_duration,													// Action duration [s]
	0,													// Priority
	true,												// Remove on completion
	false												// Show in unconscious state 
] call BIS_fnc_holdActionAdd;	// MP compatible implementation