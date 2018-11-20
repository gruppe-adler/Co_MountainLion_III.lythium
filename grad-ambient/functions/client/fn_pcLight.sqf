params ["_object"];

private _position = position _object;
private _light = "#lightpoint" createvehicle _position;
_light setLightDayLight true;
_light setLightBrightness 0.5;
_light setLightAmbient [0.1, 0.1, 0.15];
_light setlightcolor [0.1, 0.1, 0.15];