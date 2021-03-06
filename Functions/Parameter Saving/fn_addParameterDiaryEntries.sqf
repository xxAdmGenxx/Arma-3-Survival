/* ----------------------------------------------------------------------------
Function: KISKA_fnc_addParameterDiaryEntries

Description:
	Creates a diary entry to save or delete saved mission parameters

Parameters:
	NONE

Returns:
	NOTHING

Examples:
    (begin example)

		Postinit function

    (end)

Author(s):
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
if !(hasInterface) exitWith {};

waitUntil {
    if !(isNull player) exitWith {true};
    sleep 1;
    false
};

player createDiarySubject ["BLWK_params_entry","Save Mission Parameters",""];

player createDiaryRecord ["BLWK_params_entry", ["Save Mission Parameters", 
	"<execute expression='[true] call BLWK_fnc_paramsQuery'>SAVE MISSION PARAMETERS</execute>"
]];

player createDiaryRecord ["BLWK_params_entry", ["Save Mission Parameters", 
	"<execute expression='[false] call BLWK_fnc_paramsQuery'>RESET SAVED MISSION PARAMETERS</execute>"
]];