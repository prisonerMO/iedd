#include "script_component.hpp"
//This function added to CBA_event, not in use currenlty
params ["_bombObj"];
//_bombObj call FUNC(dudWires);
[_bombObj] spawn {
	params ["_bombObj"];
	private _sound = format ["iedd_ied_dud%1", floor (random 4)];
	_bombObj say3D _sound;
	private _pos = _bombObj modelToWorld [0,0,0.4];
	private _ps1 = "#particlesource" createVehicle _pos;
	_ps1 setParticleParams [   
		["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard",   
		1, 1, [0, 0, 0], [0, 0, 0], 0, 1, 1, 3, [0.5,1.5],   
		[[1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],   
		[0.25,1], 1, 1, "", "", _ps1];   
	_ps1 setParticleRandom [0.2, [0.5, 0.5, 0.25], [0.125, 0.125, 0.125], 0.2, 0.2, [0, 0, 0, 0], 0, 0];  
	_ps1 setDropInterval 0.05;
	sleep 0.5;
	private _ps2 = "#particlesource" createVehicle _pos;
	_ps2 setParticleParams [   
		["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 16, 1], "", "Billboard",   
		5, 1.66, [0, 0, 0], [0, 0, 0], 0, 1.25, 1, 3, [0.5,1.5],   
		[[0, 0, 0, 0], [0.05, 0.05, 0.05, 1], [0.05, 0.05, 0.05, 1], [0.05, 0.05, 0.05, 1], [0.1, 0.1, 0.1, 0.5], [0.125, 0.125, 0.125, 0]],  
		[0.25,1], 1, 1, "", "", _ps2];   
	_ps2 setParticleRandom [0.2, [0.05, 0.05, 0.05], [0.1, 0.1, 0.1], 0.2, 0.2, [0, 0, 0, 0], 0, 0];  
	_ps2 setDropInterval 0.5;
	sleep 0.2;
	deleteVehicle _ps1; 

	sleep 0.25;
	deleteVehicle _ps2;
};
