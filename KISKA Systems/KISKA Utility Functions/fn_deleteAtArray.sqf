/* ----------------------------------------------------------------------------
Function: KISKA_fnc_deleteAtArray

Description:
	Removes an index from a global array.

	This was used in lieu of creating a public variable to sync the array.
	In order to keep network traffic lower if the array becomes large.

Parameters:
	0: _arrayVariableName : <STRING> - The global array in string format
	1: _indexToRemove : <ANY> - The index to remove
	2: _namespace : <NAMESPACE,OBJECT,GROUP,LOCATION,CONTROL,DISPLAY> - What namespace the array is in

Returns:
	BOOL

Examples:
    (begin example)

		["myGlobalArrayVar",someInfoHere] call KISKA_fnc_deleteAtArray;

    (end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
params [
	["_arrayVariableName","",[""]],
	"_indexToRemove",
	["_namespace",missionNamespace,[missionNamespace,objNull,grpNull,controlNull,displayNull,locationNull]]
];

if (_arrayVariableName isEqualTo "") exitWith {
	"KISKA_fnc_deleteAtArray: Array variable name is empty string" call BIS_fnc_error;
};

private _array = _namespace getVariable [_arrayVariableName,[]];

_array deleteAt _indexToRemove;

true