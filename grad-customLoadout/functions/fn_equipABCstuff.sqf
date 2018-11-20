/*
    call GRAD_customLoadout_fnc_equipABCstuff;
*/

private _previousLoadout = player getVariable ["GRAD_loadoutCache", []];
private _currentLoadout = getUnitLoadout player;
private _toggle = player getVariable ["GRAD_loadoutChanged", false];
player setVariable ["GRAD_loadoutCache", _currentLoadout];

if (_toggle) then {

    player setUnitLoadout _previousLoadout;


    player setVariable ["GRAD_loadoutChanged", false];
    ["LoadoutChanged",["Piloten Equipment angelegt"]] call BIS_fnc_showNotification;

} else {

    player addGoggles "Mask_M40";
    player addVest "V_GA_OxygenTank_Rgr";


    player setVariable ["GRAD_loadoutChanged", true];
    ["LoadoutChanged",["ABC Schutzkleidung angelegt"]] call BIS_fnc_showNotification;
};