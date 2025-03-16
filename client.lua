-- client.lua

local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("gps", function(source, args, rawCommand)
    if #args < 1 then
        DeleteWaypoint() -- pak mikone waypoint ro dar sorati ke args vared nashe
        QBCore.Functions.Notify("Waypoint Gps Pak Shod", "success")
        return
    end

    local code = args[1]
    local loc = Config.Locations[code]

    if loc then
        SetNewWaypoint(loc.x, loc.y) -- تنظیم waypoint روی نقشه
        QBCore.Functions.Notify("Gps Be " .. code .. " Tanzim Shod.", "success")
    else
        QBCore.Functions.Notify("Code Gps Peyda Nashod", "error")
    end
end, false)

TriggerEvent('chat:addSuggestion', '/gps', 'Location morede nazar mesl "/gps 42"')
