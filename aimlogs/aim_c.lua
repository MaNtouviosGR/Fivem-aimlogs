Citizen.CreateThread(function()
    local lastPedAimed

    while true do
        Citizen.Wait(1000)
        local letSleep = true
        local playerPed = PlayerPedId()
        if DoesEntityExist(playerPed) then
            if IsPedArmed(playerPed, 4) then
                letSleep = false

                local isAiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))
                if isAiming and targetPed ~= lastPedAimed then
                    lastPedAimed = targetPed

                    if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                        if IsPedAPlayer(targetPed) then
                            local targetId = NetworkGetPlayerIndexFromPed(targetPed)

                            if targetId then
                                local pedId = GetPlayerServerId(targetId)
                                
                                if pedId and (pedId > 0) then
                                    TriggerServerEvent('aimlogs:log', pedId)
                                end
                            end
                        end
                    end
                end
            end
        end

        if letSleep then
            Wait(1000)
        end
    end 
end)
