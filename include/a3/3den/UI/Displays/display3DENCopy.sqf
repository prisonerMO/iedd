#include "\a3\3DEN\UI\resincl.inc"

_mode = _this select 0;
_params = _this select 1;
_class = _this select 2;

switch _mode do {

	case "onLoad": {
		_display = _params select 0;

		_ctrlTitle = _display displayCtrl IDC_DISPLAY3DENCOPY_TITLE;
		_ctrlEdit = _display displayCtrl IDC_DISPLAY3DENCOPY_EDIT;
		_ctrlGroup = _display displayCtrl IDC_DISPLAY3DENCOPY_GROUP; 

		_data = uinamespace getvariable ["Display3DENCopy_data",[]];
		_dataTitle = _data param [0,"",[""]];
		_dataEdit = _data param [1,"",[""]];

		_ctrlTitle ctrlSetText _dataTitle;
		_ctrlEdit ctrlSetText _dataEdit;
		_ctrlEdit ctrlSetPositionH ((ctrlTextHeight _ctrlEdit) max (ctrlPosition _ctrlGroup select 3));
		_ctrlEdit ctrlCommit 0;
	};
};