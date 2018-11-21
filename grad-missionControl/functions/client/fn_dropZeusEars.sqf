params ["_unit"];

hint format ["Attaching ears to %1", name _unit];

[{
    params ["_args", "_handle"];

    _args params ["_unit"];

    if (isNil (player getVariable ["TF_fnc_position", nil])) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    player setVariable ["TF_fnc_position", position _unit];

}, 0.1, [_unit]] call CBA_fnc_addPerFrameHandler;