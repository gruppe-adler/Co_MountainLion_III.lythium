params ["_pos", "_distance"];

private _coughs = [
	"cough1",
	"cough2",
	"cough3",
	"cough4"
];

private _gas_breathing = [
	"gas_breathing1",
	"gas_breathing2",
	"gas_breathing3",
	"gas_breathing4"
];


private _protectingGoggles = [
	"Mask_M40",
	"Mask_M40_OD",
	"Mask_M50"
];

// delete if necessary and flicker light
[{
    params ["_args", "_handle"];
    _args params ["_coughs", "_gas_breathing", "_protectingGoggles", "_pos", "_distance"];
    

    if (!alive player || missionNamespace getVariable ["grad_gas_leakClosed", false]) exitWith {
    	[] call grad_gas_fnc_gasEffectsReset;
    	[_handle] call CBA_fnc_removePerFrameHandler;
    };

	if (player getvariable ["isSpectator", "false"] == "true") exitWith {};

	// if player wears one of the masks, nothing happens but breathing sound
	if ((goggles player) in _protectingGoggles) then {
			cutRsc ["RscGasmaskPicture","PLAIN"];

			if (player getVariable ["grad_gas_isGasEffected", false]) then {
				player setVariable ["grad_gas_isGasEffected", false];
				player setVariable ["GRAD_gas_insideCounter",0];
				[] call grad_fx_fnc_gasEffectsReset;
			};
			
		
			private _breathing = player getVariable ["GRAD_gas_breathingCounter",0];

			if (_breathing > 10) then {
				_breathing = 0;
				playsound (selectRandom gas_breathing);
			} else {
				_breathing = _breathing + 1;
				 player setVariable ["GRAD_gas_breathingCounter",_breathing];
			};


			if (!(player getVariable ["player_has_gasmask",false])) then {
				player setVariable ["player_has_gasmask",true];
				GASMASK_FOUND = true; 
				publicVariableServer "GASMASK_FOUND";
			};

	} else {
			cutRsc ["Default", "PLAIN"];

			if (player distance _pos < _distance) then {

				player setVariable ["grad_gas_isGasEffected", true];

				GAS_EFFECTED = GAS_EFFECTED + 1;
				publicVariableServer "GAS_EFFECTED";

				"filmGrain" ppEffectEnable true;
				"filmGrain" ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];  
				"filmGrain" ppEffectCommit 5; 

				"colorCorrections" ppEffectEnable true; 
				"colorCorrections" ppEffectAdjust [0.75, 1, 0, [0.8,0.9,1,-0.1], [1,0.5,0.2,1], [-0.5,0,-1,5]]; 
				"colorCorrections" ppEffectCommit 5;

				"dynamicBlur" ppEffectEnable true; // enables ppeffect
				"dynamicBlur" ppEffectAdjust [2]; // intensity of blur
				"dynamicBlur" ppEffectCommit 5; // time till vision is fully blurred
					
				enableCamShake true;	// enables camera shake
				addCamShake [1, 7, 90];	// sets shakevalues
				//player setFatigue 1; // sets the fatigue to 100%
				5 fadeSound 0.1;	// fades the sound to 10% in 5 seconds

				playSound "ACE_heartbeat_fast_3"; // plays heart beating sound

				private _coughing = player getVariable ["GRAD_gas_coughingCounter",0];
				private _inside = player getVariable ["GRAD_gas_insideCounter",0];

				// if inside > 5, volume is still only reduced by 1
				private _tfarVolume = [1 - (_inside/1), 1] select (_inside > 5);
				player setVariable ["tf_globalVolume", _tfarVolume];
				// post process emergency calls a bit
				player setVariable ["tf_sendingDistanceMultiplicator", _tfarVolume + 0.1];


				if (_inside > 5) then {
					[player, true] call ace_medical_fnc_setUnconscious;
				};

				if (_coughing > 1 && !(player getVariable ["ACE_isUnconscious", false])) then {
					player say3d [selectRandom _coughs, 20];
					_coughing = 0;

					_inside = _inside + 1;
					player setVariable ["GRAD_gas_insideCounter",_inside];
				} else {
					if (!(player getVariable ["ACE_isUnconscious", false])) then {
						_coughing = _coughing + 1;
						_inside = _inside + 1;
						player setVariable ["GRAD_gas_coughingCounter",_coughing];
						player setVariable ["GRAD_gas_insideCounter",_inside];
					};
				};
			} else {
				call grad_gas_fnc_gasEffectsReset;
				player setVariable ["GRAD_gas_insideCounter",0];
			};
	};

},1,[_coughs, _gas_breathing, _protectingGoggles, _pos, _distance]] call CBA_fnc_addPerFrameHandler;