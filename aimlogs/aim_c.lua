Citizen.CreateThread(function()
    --Creates thread
    --[[ START LAZYLOADING ]]
    local lastPedAimed
    local PlayerId = PlayerId
    local IsPedArmed = IsPedArmed
    local PlayerPedId = PlayerPedId
    local IsEntityAPed = IsEntityAPed
    local DoesEntityExist = DoesEntityExist
    local GetPlayerServerId = GetPlayerServerId
    local TriggerServerEvent = TriggerServerEvent
    local GetEntityPlayerIsFreeAimingAt = GetEntityPlayerIsFreeAimingAt
    --[[ END LAZYLOADING ]]
    while true do
        local msec = 1000
        if IsPedArmed(PlayerPedId(), 6) then
            msec = 250
            local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))
            if aiming and targetPed ~= LastPedAimed then
                lastPedAimed = targetPed
                if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                    local pedId = GetPlayerServerId(aiming)
                    TriggerServerEvent('aimlogs:log', pedId)
                end
            end
        end
        Wait(msec)
    end
end)