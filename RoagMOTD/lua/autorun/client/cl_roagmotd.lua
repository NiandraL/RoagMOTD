RoagMOTD.ButtonsTable = {}
function AddRoagMOTDOption(name, options)
	
	if not name then 
		name = "Button"
    end
	
	if not options.url then
		error("This button does nothing! Please give it a URL.")
    end
	
	if not options.colour then
		options.colour = Color(18,182,254)
	end
	
	if not options.colour_two then
		options.colour_two = Color(16, 169, 236)
	end
	
	RoagMOTD.ButtonsTable[name] = {
		url = options.url, 
		colour = options.colour, 
		colour_two = options.colour_two
	} 
		
end