 util.AddNetworkString( "RoagMOTD_Open" )
 
hook.Add("PlayerSay", "RoagMOTD_Open", function(ply, text, uselessvariable)
	if (text == "!motd") then
		net.Start("RoagMOTD_Open")
		net.Send(ply)
	end
end)

hook.Add("PlayerInitialSpawn", "RoagMOTD_Spawn", function(ply)
	if RoagMOTD.ShowOnSpawn then
	timer.Create("RoagMOTD_Check", 1, 0, function()
		if ply:IsValid() then
			if not table.HasValue(RoagMOTD.WhitelistedGroups, ply:GetUserGroup()) then
				net.Start("RoagMOTD_Open")
				net.Send(ply)
				timer.Destroy("RoagMOTD_Check")
			else
				timer.Destroy("RoagMOTD_Check")
			end
		end	
	end)
	end
end)

concommand.Add(RoagMOTD.ConsoleCommand, function(ply)
	net.Start("RoagMOTD_Open")
	net.Send(ply)
end)

for k, v in pairs(file.Find("materials/niandralades/motd/*.png", "GAME")) do
	resource.AddFile(v)
end