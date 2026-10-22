/*DEBUG , Not in use */
class RscText {};
class RscControlsGroup {};
class RscControlsGroupNoScrollbars: RscControlsGroup {};
class RscDisplayAttributes {
	class Controls {
		class Content: RscControlsGroup {};
	};
};
class iedd_modules_RscIeds: RscDisplayAttributes {
	class Controls: Controls {
		class Content: Content {
			class Controls {
				class iedd_modules_scroll: RscControlsGroupNoScrollbars {
					class controls:controls {                        
                        class GVAR(type);
                        class GVAR(variationL);
                        class GVAR(variation);
                        class GVAR(sizeL);
                        class GVAR(size);
                        class GVAR(dudL);
                        class GVAR(dudSlider);
                        class GVAR(distanceL);
                        class GVAR(distanceSlider);
                        class GVAR(timerL);
                        class GVAR(timer);
                        class GVAR(TimerValueL);
                        class GVAR(TimerValueSlider);     
					};
				};
			};
		};
	};
};

onLoad = QUOTE([ARR_2({call FUNC(vbiedSelected)},[ARR_2(_this select 0,0)])] call CBA_fnc_execNextFrame);
onUnload = QUOTE([ARR_2({call FUNC(attributes)},[ARR_3('onUnload',_this,QQGVAR(RscSetIED))])] call CBA_fnc_execNextFrame);