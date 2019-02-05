params ["_unit"];

hint format ["Attaching ears to %1", name _unit];

[{
    params ["_args", "_handle"];

    _args params ["_unit"];

    if ((player getVariable ["TF_fnc_position", objNull]) isEqualTo objNull) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    grad_zeusEearUnit = _unit;
}, 0.1, [_unit]] call CBA_fnc_addPerFrameHandler;

 player setVariable ["TF_fnc_position", {[grad_zeusEearUnit modelToWorldVisualWorld (grad_zeusEearUnit selectionPosition "pilot"), getCameraViewDirection grad_zeusEearUnit]}];
