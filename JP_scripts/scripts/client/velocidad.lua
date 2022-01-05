RegisterCommand("v", function(source, args, rawCommand)
		local playerPed = PlayerPedId()
		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed, false)
			if (vehicle ~= nil and vehicle ~= 0) then
				local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
				vehicleLabel = GetLabelText(vehicleLabel)
				local r, g, b = GetVehicleColor(vehicle)
				local velocity = GetEntitySpeed(vehicle)
                local kmh = (velocity * 3.6)
				ExecuteCommand("entorno Hay un " .. vehicleLabel .. " a " .. math.floor(kmh) .. " km/h de color <div style='width:30px;height:15px;display:inline-block;background-color:rgb(" .. r .. "," .. g .. "," .. b .. ")'></div> a alta velocidad")
				Citizen.Wait(10000)
			end
		end
	end,
	false
)


print('! Aiimar#1234')
