/* ----------------------------------------------------------------------------
Function: BLWK_fnc_createBuildObjectsArray

Description:
	Creates an array in the format of BLWK_buildableObjects_array from a config.

Parameters:
	0: _configClass : <STRING> - The parent class of all the items to convert

Returns:
	ARRAY - all the classes formatted into an array

Examples:
    (begin example)

		BLWK_buildableObjects_array = ["BLWK_buildableItems"] call BLWK_fnc_createBuildObjectsArray;

    (end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
params [
	["_configClass","",[""]]
];

if (_configClass isEqualTo "") exitWith {
	"_configClass is undefined string" call BIS_fnc_error;
};

private _configs = call {
	if (isClass (configFile >> _configClass)) exitWith {
		"true" configClasses (configFile >> _configClass)
	};
	if (isClass (missionConfigFile >> _configClass)) exitWith {
		"true" configClasses (missionConfigFile >> _configClass)
	};

	[]
};

if (_configs isEqualTo []) exitWith {
	["%1 classes not found in mission or main config",_configClass] call BIS_fnc_error;
};

private _returnArray = [];
private [
	"_class_temp",
	"_price_temp",
	"_category_temp",
	"_hasAI_temp",
	"_rotation_temp",
	"_attachmentX_temp",
	"_attachmentY_temp",
	"_attachmentZ_temp",
	"_invincible_temp"
];
_configs apply {
	_class_temp configName _config;
	_price_temp = [_config >> "price"] call BIS_fnc_getCfgData;
	_category_temp = [_config >> "category"] call BIS_fnc_getCfgData;
	_hasAI_temp = [_config >> "hasAI"] call BIS_fnc_getCfgData;
	_rotation_temp = [_config >> "rotation"] call BIS_fnc_getCfgData;
	_attachmentX_temp = [_config >> "attachmentX"] call BIS_fnc_getCfgData;
	_attachmentY_temp = [_config >> "attachmentY"] call BIS_fnc_getCfgData;
	_attachmentZ_temp = [_config >> "attachmentZ"] call BIS_fnc_getCfgData;
	_invincible_temp = [_config >> "invincible"] call BIS_fnc_getCfgData;


	_returnArray pushBack [
		_price_temp,
		_class_temp,
		_category_temp,
		[_attachmentX_temp,_attachmentY_temp,_attachmentZ_temp],
		_hasAI_temp,
		_rotation_temp,
		_invincible_temp
	];
};


_returnArray