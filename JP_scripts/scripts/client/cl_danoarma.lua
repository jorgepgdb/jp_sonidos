----------------------------------------------------------------------------
----------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.2) 
    	Wait(0)
    	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.1) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.2) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_POOLCUE"), 0.2) 
        Wait(0)		
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GOLFCLUB"), 0.2) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HAMMER"), 0.2) 
        Wait(0)		
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.5) 
        Wait(0)
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BOTTLE"), 0.5) 
        Wait(0)		
    end
end)
----------------------------------------------------------------------------
----------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        s = 1000
	    local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            s = 5
	       DisableControlAction(1, 140, true)
       	   DisableControlAction(1, 141, true)
           DisableControlAction(1, 142, true)
        else
            s = 1000
        end
        Citizen.Wait(s)
    end
end)