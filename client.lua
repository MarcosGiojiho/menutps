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
        -- {x = , y = , z = }
        gc = { x = 215.76, y = -810.12, z = 30.73 },
        inem = { x = -264.0, y = -964.0, z = 31.0 },
        comisaria = { x = 425.1, y = -979.55, z = 30.71 },
        mb = {x = -74.373627, y = -818.241760, z = 326.173584},
        mba = {x = -325.490112, y = -1965.599976, z = 66.753906}
    }

    local coords = locations[location]

    if coords then
        SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, false, false, true)
    end

    cb("ok")
end)
