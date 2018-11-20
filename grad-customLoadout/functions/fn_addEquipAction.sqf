/*
    [this] call GRAD_customLoadout_fnc_addEquipAction;
*/

params ["_obj"];

private _type = typeOf _obj;

private _switchEquipment = ["switchEquipment", "Spezial-Equipment austauschen", "", {
    [] call GRAD_customLoadout_fnc_equipABCstuff;
},
{true}] call ace_interact_menu_fnc_createAction;

[_type, 0, ["ACE_MainActions"], _switchEquipment, true] call ace_interact_menu_fnc_addActionToClass;