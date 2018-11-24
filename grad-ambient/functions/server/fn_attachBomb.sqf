params ["_vehicle"];

_vehicle addMPEventHandler ["mpkilled", {
    params ["_unit", "_killer", "_instigator", "_useeffects"];

    private _secondary = "Bo_GBU12_LGB" createVehicle position _unit;
    _secondary setDamage 1;
}];