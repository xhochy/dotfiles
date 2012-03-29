mybattmon = widget({ type = "textbox", name = "mybattmon", align = "right" })
function battery_status ()
    local output={} --output buffer
    local fd=io.popen("acpitool -b", "r") --list present batteries
    local line=fd:read()
    while line do --there might be several batteries.
        local battery_num = string.match(line, "Battery \#(%d+)")
        local battery_load = string.match(string.match(line, " (%d*\.%d+)%%"), "%d*")
--        local time_rem = string.match(line, "(%d+\:%d+)\:%d+")
	local discharging
	if string.match(line, "discharging")=="discharging" then --discharging: always red
		discharging="<span color=\"#CC7777\">"
	elseif tonumber(battery_load)>85 then --almost charged
		discharging="<span color=\"#77CC77\">"
	else --charging
		discharging="<span color=\"#CCCC77\">"
	end
        if battery_num and battery_load and time_rem then
            table.insert(output,discharging.."BAT#"..battery_num.." "..battery_load.."% "..time_rem.."</span>")
        elseif battery_num and battery_load then --remaining time unavailable
            table.insert(output,discharging.."BAT#"..battery_num.." "..battery_load.."%</span>")
        end --even more data unavailable: we might be getting an unexpected output format, so let's just skip this line.
        line=fd:read() --read next line
    end
    return table.concat(output," ") --FIXME: better separation for several batteries. maybe a pipe?
end
mybattmon.text = " " .. battery_status() .. " "
my_battmon_timer=timer({timeout=10})
my_battmon_timer:add_signal("timeout", function()
    --mytextbox.text = " " .. os.date() .. " "
    mybattmon.text = " " .. battery_status() .. " "
end)
my_battmon_timer:start()
