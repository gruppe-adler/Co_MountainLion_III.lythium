/*
    rewritten version of aliascartoons jdam 
*/

params ["_obj", "_destructionCenter", "_radius"];

_obj say3D ["bombix", 1000];

[_destructionCenter, 900, 40] spawn GRAD_gas_fnc_createLingerEmitter;
[_destructionCenter, 300] spawn GRAD_gas_fnc_createWashEmitter;


//lumina
private _light = "#lightpoint" createVehicle _destructionCenter;
_light setLightAttenuation [/*start*/ 0, /*constant*/0, /*linear*/ 0, /*quadratic*/ 0, /*hardlimitstart*/_radius,800];  
_light setLightIntensity 100;
_light setLightBrightness _radius;
_light setLightDayLight true;  
_light setLightFlareSize 150;
_light setLightFlareMaxDistance 2000;  
_light setLightAmbient[1,0.2,0.1];
_light setLightColor[1,0.2,0.1];


[_light] spawn {
    params ["_light"];
    private _brightness = 100;
    while {_brightness > 5} do {
        _light setLightBrightness _brightness;
        _brightness = _brightness - 5;
        sleep 0.1;
    };
};

if ((player distance _destructionCenter < 2000) and ((getPosATL player select 2) < 50)) then 
{
    enableCamShake true;
    private _power_sh = linearConversion [0,2000,player distance _destructionCenter,15,0.1,true];
    addCamShake [_power_sh,5, 50];
};

private _delay_ecko = linearConversion [0,2000,player distance _destructionCenter,1,6,true];
sleep _delay_ecko;
playsound "bombix_echo";
enableCamShake false;
sleep 20;