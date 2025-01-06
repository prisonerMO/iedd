params ["_ctrlGroup"];
private _model = iedd_vbied_preDefined get 'model';
private _type = _model select 2;
private _max = (getNumber (configFile >> "CfgVehicles" >> _type >> "maxSpeed")) max 50;
private _slider = _ctrlGroup controlsGroupCtrl 100;
private _edit = _ctrlGroup controlsGroupCtrl 101;
_slider sliderSetSpeed [1, 1, 1];
_slider sliderSetRange [0, _max];
_slider ctrlAddEventHandler ["SliderPosChanged", {
    params ["_slider"];
    private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;
    private _value = sliderPosition _slider;
    _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'km/h';
}];
_edit ctrlAddEventHandler ["KillFocus", {
    params ["_edit"];
    private _model = iedd_vbied_preDefined get 'model';
    private _type = _model select 2;
    private _max = (getNumber (configFile >> "CfgVehicles" >> _type >> "maxSpeed")) max 50;
    private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100;
    private _value = ((parseNumber ctrlText _edit) min 0) max _max;
    _slider sliderSetPosition _value;
    _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'km/h';
}];