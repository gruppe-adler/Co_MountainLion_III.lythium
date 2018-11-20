params ["_vehicle"];

_vehicle addEventHandler ["Killed", {
    params ["_unit", "_source", "_damage", "_instigator"];

    private _secondary = "ammo_Missile_Cruise_01" createVehicle position _unit;
    _secondary setDamage 1;
}];