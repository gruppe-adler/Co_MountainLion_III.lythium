params ["_obj"];

_obj removeAllEventHandlers "Explosion";


_light1 = "#lightpoint" createVehicleLocal [0,0,0];
_light1 setLightBrightness 1;
_light1 setLightColor [1,0.2,0.1];
_light1 setLightAmbient [1,0.2,0.1];
_light1 setLightUseFlare false;
_light1 setLightAttenuation [0.2,4,4,0,9,10];

_light1 lightAttachObject  [_obj,[0,0,0]];


// SMOKE
//--- variables set by user
private _colorRed = 0.5;
private _colorGreen = 0.5;
private _colorBlue = 0.5;
private _colorAlpha = 0.5;
private _particleLifeTime = 1; //50, 5 is HUGE amount of smoke, so lower is more
private _particleDensity = 10; //10
private _particleSize = 2; //1
private _particleSpeed = 2; //1
private _particleLifting = 1;
private _windEffect = 1;
private _effectSize = .5; //1
private _expansion = 1;
private _emitterSmoke = "#particlesource" createVehicleLocal [0,0,0];

//--- particle effect creation
_emitterSmoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02",8,0,40,1],"","billboard",1,_particleLifeTime,[0,0,0],[0,0,2*_particleSpeed],0,0.05,0.04*_particleLifting,0.05*_windEffect,[1 *_particleSize + 1,1.8 * _particleSize + 15],
        [[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.7*_colorAlpha],[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.6*_colorAlpha],[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.45*_colorAlpha],
        [0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.28*_colorAlpha],[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.16*_colorAlpha],[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.09*_colorAlpha],
        [0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.06*_colorAlpha],[1*_colorRed,1*_colorGreen,1*_colorBlue,0.02*_colorAlpha],[1*_colorRed,1*_colorGreen,1*_colorBlue,0*_colorAlpha]],
        [1,0.55,0.35], 0.1, 0.08*_expansion, "", "", ""];
_emitterSmoke setParticleRandom [_particleLifeTime/2, [0.5*_effectSize,0.5*_effectSize,0.2*_effectSize], [0.3,0.3,0.5], 1, 0, [0,0,0,0.06], 0, 0];
                        //[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity] 
_emitterSmoke setDropInterval (1/_particleDensity);
_emitterSmoke attachTo [_obj, [0,0,0]];

sleep 10;

deleteVehicle _emitterSmoke;