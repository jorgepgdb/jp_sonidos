local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

AddEventHandler('handsup:toggle', function(param)
	canHandsUp = param
end)

Citizen.CreateThread(function()
	local handsup = false

	while true do
		Citizen.Wait(0)

		if not IsPedInAnyVehicle(player, true) then
			if IsControlJustReleased(0, Keys['X']) and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				local playerPed = PlayerPedId()
				RequestAnimDict('random@mugging3')
				while not HasAnimDictLoaded('random@mugging3') do
					Citizen.Wait(100)
				end

				if handsup then
					handsup = false
					TriggerServerEvent('esx_thief:update', handsup)
					ClearPedTasks(playerPed)
				else
					handsup = true
					TaskPlayAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
					TeclasCulias()
					TriggerServerEvent('esx_thief:update', handsup)
				end
			end
		end
	end
end)

-- RegisterCommand("levantarmanos",function()
-- 	if not IsPedInAnyVehicle(GetPlayerPed()) then
-- 		local playerPed = PlayerPedId()
-- 		RequestAnimDict('random@mugging3')
-- 		while not HasAnimDictLoaded('random@mugging3') do
-- 			Citizen.Wait(100)
-- 		end

-- 		if handsup then
-- 			handsup = false
-- 			TriggerServerEvent('esx_thief:update', handsup)
-- 			ClearPedTasks(playerPed)
-- 		else
-- 			handsup = true
-- 			TaskPlayAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
-- 			TeclasCulias()
-- 			TriggerServerEvent('esx_thief:update', handsup)
-- 		end
-- 	else
-- 		Wait(100)
-- 	end
-- end)

-- RegisterKeyMapping("levantarmanos","Levantar las manos","keyboard","X")

function TeclasCulias()
	Citizen.CreateThread(function()
		while handsup and not IsPedInAnyVehicle(GetPlayerPed()) do
			Citizen.Wait(5)
			DisableControlAction(0, 24, true) 		-- Attack
			DisableControlAction(0, 257, true) 		-- Attack 2
			DisableControlAction(0, 25, true) 		-- Aim
			DisableControlAction(0, 263, true) 		-- Melee Attack 1
			DisableControlAction(0, 45, true) 		-- Reload
			DisableControlAction(0, 22, true) 		-- Jump
			DisableControlAction(0, 37, true) 		-- Select Weapon
			DisableControlAction(0, 23, true) 		-- Also 'enter'?
			DisableControlAction(0, 288, true) 		-- Phone
			DisableControlAction(0, 289, true) 		-- Inventory
			DisableControlAction(0, 170, true) 		-- Animations
			DisableControlAction(0, 167, true) 		-- Job & Panicbutton
			DisableControlAction(0, 168, true) 		-- Billing
			DisableControlAction(0, 56, true) 		-- Job
			DisableControlAction(0, 57, true) 		-- Clothes Menu
			DisableControlAction(0, 0, true) 		-- Disable changing view
			DisableControlAction(0, 26, true) 		-- Disable looking behind
			DisableControlAction(0, 59, true) 		-- Disable steering in vehicle
			DisableControlAction(0, 71, true) 		-- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) 		-- Disable reversing in vehicle
			DisableControlAction(2, 36, true) 		-- Disable going stealth
			DisableControlAction(0, 47, true)  		-- Disable weapon
			DisableControlAction(0, 264, true) 		-- Disable melee
			DisableControlAction(0, 257, true) 		-- Disable melee
			DisableControlAction(0, 140, true) 		-- Disable melee
			DisableControlAction(0, 141, true) 		-- Disable melee
			DisableControlAction(0, 142, true) 		-- Disable melee
			DisableControlAction(0, 143, true) 		-- Disable melee
			DisableControlAction(0, 75, true)  		-- Disable exit vehicle
			DisableControlAction(27, 75, true) 		-- Disable exit vehicle
			DisableControlAction(0, 21, true)		-- Disable running
			DisableControlAction(0, 73, true)		-- Disable X
		end
	end)
end	
