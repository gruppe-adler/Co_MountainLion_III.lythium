params ["_unit"];

hint format ["Attaching ears to %1", name _unit];

grad_zeusEarUnit = _unit;

player setVariable ["TF_fnc_position", {[grad_zeusEarUnit modelToWorldVisualWorld (grad_zeusEarUnit selectionPosition "pilot"), getCameraViewDirection grad_zeusEarUnit]}];
