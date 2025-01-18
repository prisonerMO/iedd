params ["_slider"];
private _fnc_sliderMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [52523]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider * 100),"%"];
};
_slider sliderSetRange [0, 1];
_slider sliderSetSpeed [0.01,0.1];
_slider sliderSetPosition 0;
_slider ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
_slider call _fnc_sliderMove;