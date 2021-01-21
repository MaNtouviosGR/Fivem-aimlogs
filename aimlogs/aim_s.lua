local hook = 'YOUR_WEBHOOK_LINK'

RegisterServerEvent('aimlogs:log')
AddEventHandler('aimlogs:log', function(pedId)
    local _source = source
    local name = GetPlayerName(_source)
    local targetName = GetPlayerName(pedId)
    PerformHttpRequest(hook, function(err, text, headers) end, 'POST', json.encode({embeds={{title="__**Aim Logs**__",description="\nPlayer name: "..name.. "`[".._source.."]`\nIs aiming: "..targetName.." `["..pedId.."]`",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end)
