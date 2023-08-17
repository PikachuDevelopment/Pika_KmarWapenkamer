local ESX = nil

local CachedPedState = false

TriggerEvent("esx:getSharedObject", function(response)
    ESX = response
end)

ESX.RegisterServerCallback("pika_kmarwapens:pedExists", function(source, cb)
    if CachedPedState then
        cb(true)
    else
        CachedPedState = true

        cb(false)
    end
end)

RegisterServerEvent("pika_kmarwapens:giveWeapon")
AddEventHandler("pika_kmarwapens:giveWeapon", function(weapon)
    local player = ESX.GetPlayerFromId(source)

    if player then
        player.addWeapon(weapon, Config.ReceiveAmmo)
        TriggerClientEvent("esx:showNotification", source, "Je pakte 1x " .. ESX.GetWeaponLabel(weapon) .. " met " .. Config.ReceiveAmmo .. "x kogels.")
    end
end)