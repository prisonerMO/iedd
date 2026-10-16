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
