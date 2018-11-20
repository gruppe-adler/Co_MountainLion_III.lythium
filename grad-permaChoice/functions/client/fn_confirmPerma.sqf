private _confirmed = [
"Sterben und in 5min als Verstärkung nachgezogen werden?", 
"Sterben?", 
"Bestätigen", 
"Abbrechen"
] call BIS_fnc_guiMessage;

if (_confirmed) then {
    closeDialog 0; player setDamage 1; // [] call grad_permaChoice_fnc_setPlayerSpectator;
} else {
    
};