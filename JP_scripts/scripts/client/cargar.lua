local carryingBackInProgress = false
local carryAnimNamePlaying = ""
local carryAnimDictPlaying = ""
local carryControlFlagPlaying = 0


RegisterCommand('agacharse', function()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) then
        RequestAnimSet( "move_ped_crouched" )

        while ( not HasAnimSetLoaded( "move_ped_crouched" ) ) do 
            Citizen.Wait( 100 )
        end 
        if not IsPedInAnyVehicle(ped) then
            if not activo then
                activo = true
                SetPedMovementClipset(ped, "move_ped_crouched", 0.25)
                IsPedDucking(ped, false)
            elseif activo then
                activo = false
                ResetPedMovementClipset(ped)
                IsPedDucking(ped, false)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)
        DisableControlAction(0, 36, true)
    end
end)

RegisterKeyMapping('agacharse', 'Agacharse', 'keyboard', 'LCONTROL')

local disableShuffle = true
function disableSeatShuffle(flag)
    disableShuffle = flag
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local maslento = true
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) and disableShuffle then
            maslento = false
            if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
                if GetIsTaskActive(GetPlayerPed(-1), 165) then
                    SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
                end
            end
        end
        if maslento then Citizen.Wait(500) end
    end
end)

RegisterNetEvent("conducir")
AddEventHandler("conducir", function()
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        disableSeatShuffle(false)
        Citizen.Wait(1000000)
        disableSeatShuffle(true)
    else
        CancelEvent()
    end
end)

RegisterCommand("conducir", function(source, args, raw) --change command here
    TriggerEvent("conducir")
end, false)

RegisterCommand("c", function(source, args, raw) --change command here
    TriggerEvent("conducir")
end, false)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = PlayerPedId()
		if IsPedArmed(ped, 4) and IsPlayerFreeAiming(PlayerId()) then
			DisableControlAction(1, 22)
		end
	end
end)