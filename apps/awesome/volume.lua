--[[
  volume_widget = widget({ type = "textbox", name = "tb_volume",
                             align = "right" })

    function update_volume(widget)
        local fd = io.popen("amixer sget Master")
        local status = fd:read("*all")
        fd:close()
        
        local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
        -- volume = string.format("% 3d", volume)
]]--
--        status = string.match(status, "%[(o[^%]]*)%]")
--[[
        -- starting colour
        local sr, sg, sb = 0x3F, 0x3F, 0x3F
        -- ending colour
        local er, eg, eb = 0xDC, 0xDC, 0xCC

        local ir = volume * (er - sr) + sr
        local ig = volume * (eg - sg) + sg
        local ib = volume * (eb - sb) + sb
        interpol_colour = string.format("%.2x%.2x%.2x", ir, ig, ib)
        if string.find(status, "on", 1, true) then
            volume = " <span background='#" .. interpol_colour .. "'>   </span>"
        else
            volume = " <span color='red' background='#" .. interpol_colour .. "'> M </span>"
        end
        widget.text = volume
     end

    update_volume(volume_widget)
    awful.hooks.timer.register(1, function () update_volume(volume_widget) end)
]]--

myvolmon = widget({ type = "textbox", name = "myvolmon", align = "right" })
function volume_status ()
--  local fd = io.popen("amixer sget Master")
--  local line=fd:read()
--  while line do --go through each line
--    line=fd:read()
--  end
--  fd:close()
        
--  local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
--  volume = string.format("% 3d", volume)
--        status = string.match(status, "%[(o[^%]]*)%]")
  return "dummy"
end

myvolmon.text = " " .. volume_status() .. " "
my_volmon_timer=timer({timeout=10})
my_volmon_timer:add_signal("timeout", function()
    myvolmon.text = " " .. volume_status() .. " "
end)
my_volmon_timer:start()
