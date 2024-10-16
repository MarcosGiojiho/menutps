local menuVisible = false

RegisterCommand("tps", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "abrirMenu" })
end)


RegisterNUICallback("cerrarMenu", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("tp", function(data, cb)
    local location = data.location

    local locations = {
        gc = { x = 215.76, y = -810.12, z = 30.73 },
        inem = { x = -264.0, y = -964.0, z = 31.0 },
        localizacion3 = { x = 425.1, y = -979.55, z = 30.71 }
    }

    local coords = locations[location]

    if coords then
        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, true)
    end

    cb("ok")
end)
