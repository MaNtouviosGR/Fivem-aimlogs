local used = false

Citizen.CreateThread(function() --Creates thread
    while true do
        Citizen.Wait(100)
        local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))
        local id = GetPlayerName(PlayerId())
        if aiming then

            Citizen.SetTimeout(5000, function()
                used = false
            end)
            
            if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                local pedId = GetPlayerServerId(aiming)
                if used == false then
                    TriggerServerEvent('aimlogs:log', pedId )
                    used = true
                end
            end 
        end 

        if not aiming then
            used = false
        end
    end 
end)