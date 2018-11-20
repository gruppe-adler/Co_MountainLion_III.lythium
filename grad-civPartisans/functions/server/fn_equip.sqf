/* 

hint str (civmodule_1 getVariable ["#active",false]);
 civmodule_1 setVariable ["#active",false];

 [this, true] call GRAD_civPartisans_fnc_equip;

*/

params ["_unit", ["_armed", false]];

private _uniform = selectRandom [
	"LOP_U_TAK_Civ_Fatigue_01",
	"LOP_U_TAK_Civ_Fatigue_02",
	"LOP_U_TAK_Civ_Fatigue_03",
	"LOP_U_TAK_Civ_Fatigue_04",
	"LOP_U_TAK_Civ_Fatigue_05",
	"LOP_U_TAK_Civ_Fatigue_06",
	"LOP_U_TAK_Civ_Fatigue_07",
	"LOP_U_TAK_Civ_Fatigue_08",
	"LOP_U_TAK_Civ_Fatigue_09",
	"LOP_U_TAK_Civ_Fatigue_10",
	"LOP_U_TAK_Civ_Fatigue_11",
	"LOP_U_TAK_Civ_Fatigue_12",
	"LOP_U_TAK_Civ_Fatigue_13",
	"LOP_U_TAK_Civ_Fatigue_14",
	"LOP_U_TAK_Civ_Fatigue_15",
	"LOP_U_TAK_Civ_Fatigue_16",
	
	"LOP_U_AM_Fatigue_01",
	"LOP_U_AM_Fatigue_01_2",
	"LOP_U_AM_Fatigue_01_3",
	"LOP_U_AM_Fatigue_01_4",
	"LOP_U_AM_Fatigue_01_5",
	"LOP_U_AM_Fatigue_01_6",

	"LOP_U_AM_Fatigue_02",
	"LOP_U_AM_Fatigue_02_2",
	"LOP_U_AM_Fatigue_02_3",
	"LOP_U_AM_Fatigue_02_4",
	"LOP_U_AM_Fatigue_02_5",
	"LOP_U_AM_Fatigue_02_6",

	"LOP_U_AM_Fatigue_03",
	"LOP_U_AM_Fatigue_03_2",
	"LOP_U_AM_Fatigue_03_3",
	"LOP_U_AM_Fatigue_03_4",
	"LOP_U_AM_Fatigue_03_5",
	"LOP_U_AM_Fatigue_03_6",

	"LOP_U_AM_Fatigue_04",
	"LOP_U_AM_Fatigue_04_2",
	"LOP_U_AM_Fatigue_04_3",
	"LOP_U_AM_Fatigue_04_4",
	"LOP_U_AM_Fatigue_04_5",
	"LOP_U_AM_Fatigue_04_6"
];

private _headgear = selectRandom [
	"LOP_H_Pakol",
	"LOP_H_Turban",
	"LOP_H_Pakol",
	"LOP_H_Pakol"
];

private _beard = selectRandom [
	"TRYK_Beard_BK",
	"TRYK_Beard_BK",
	"TRYK_Beard_BK",
	"TRYK_Beard_BW",
	"TRYK_Beard_Gr"
];

private _weapon = selectRandom [
	"rhs_weap_akm",
	"rhs_weap_akms"
];

if (_armed) then {
	_unit setUnitLoadout [
		[_weapon,"rhs_acc_dtkakm","","",["rhs_30Rnd_762x39mm",30],[],""],[],[],
		[_uniform,[["ACE_fieldDressing",1],["ACE_packingBandage",1],["ACE_morphine",1],["ACE_tourniquet",1],["rhs_30Rnd_762x39mm",1,30]]],["V_TacVest_blk",[["rhs_30Rnd_762x39mm",3,30],["rhs_mag_f1",1,1]]],[],
		_headgear,_beard,[],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]
	];

	if (random 2 > 0.7) then {
		_unit addWeapon "rhs_weap_rpg75";
	};
} else {
	_unit setUnitLoadout [[],[],[],[_uniform,[]],[],[],_headgear,_beard,[],["","","","","",""]];
};