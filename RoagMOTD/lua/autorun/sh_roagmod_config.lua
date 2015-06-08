RoagMOTD = RoagMOTD or {}

//Server stuff - See client/cl_RoagMOTD_config.lua for design stuff!
RoagMOTD.ChatCommand = "!motd" -- What command should players enter in chat to re-access the MOTD?
RoagMOTD.ConsoleCommand = "roagmotd" -- What command should players enter in console to re-access the MOTD?
RoagMOTD.WhitelistedGroups = { "vip", "donator" } -- What groups should NOT see the MOTD when they enter the server?
RoagMOTD.ShowOnSpawn = false -- Should the menu appear when you first initially spawn?