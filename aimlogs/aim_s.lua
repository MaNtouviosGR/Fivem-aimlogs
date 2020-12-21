local hook = 'YOUR_WEBHOOK_LINK'

RegisterServerEvent('aimlogs:log')
AddEventHandler('aimlogs:log', function(pedId)
    local _source = source
    local name = GetPlayerName(_source)
    local targetName = GetPlayerName(pedId)
    PerformHttpRequest(hook, function(err, text, headers) end, 'POST', json.encode({embeds={{title="_**Aim Logs**__",description="\nPlayer name: "..name.."\nis aiming: "..targetName.."",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end)