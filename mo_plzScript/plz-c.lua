--[[--------------------------]]--
--[[  Created by Mo1810#4230  ]]--
--[[--------------------------]]--

RegisterCommand("plz", function(source, args, raw)
	if args[1] ~= nil then
		local plz = args[1]
		setWaypoint(plz)
	else
		notify(Config.Prefix.. "Navigationsziel wurde ~r~nicht ~s~gesetzt. ~r~Fehler: Ziel unbekannt!")
	end
end, false)

function notify(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(true, false)
end

function setWaypoint(plz)
	local plz_coords = vector2(0,0)
	for i = 1, #Config.postalcodes, 1 do
		if Config.postalcodes[i].code == plz then
			plz_coords = vector2(Config.postalcodes[i].x, Config.postalcodes[i].y)
		end
	end
	
	if plz_coords.x ~= 0.0 and plz_coords.y ~= 0.0then
		SetNewWaypoint(plz_coords.x, plz_coords.y)
		notify(Config.Prefix.. "Navigationsziel wurde ~g~erfolgreich ~s~gesetzt. ~y~PLZ~s~: ~y~" ..plz)
	else
		notify(Config.Prefix.. "Navigationsziel wurde ~r~nicht ~s~gesetzt. ~r~Fehler: Ziel unbekannt!")
	end
	
end

Citizen.CreateThread(function()	
	TriggerEvent('chat:addSuggestion', '/plz', 'Markierung bei einer Postleitzahl setzen', {
	    { name="Postleitzahl", help="Postleitzahl des Zielortes (z.B. 001)" }
	})
end)

--[[--------------------------]]--
--[[  Created by Mo1810#4230  ]]--
--[[--------------------------]]--
