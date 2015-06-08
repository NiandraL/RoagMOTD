surface.CreateFont("Bebas40", {
	font = "Bebas Neue", 
	size = 40, 
	weight = 500, 
	blursize = 0, 
	scanlines = 0, 
	antialias = true, 
	underline = false, 
	italic = false, 
	strikeout = false, 
	symbol = false, 
	rotary = false, 
	shadow = false, 
	additive = false, 
	outline = false, 
})

net.Receive("RoagMOTD_Open", function()
	gui.EnableScreenClicker(true)
	
	local frame = vgui.Create("DFrame")
	frame:SetSize(ScrW(), ScrH())
	frame:SetPos(0,0)
	frame:SetTitle("")
	//frame:SetDraggable(false)
	frame:ShowCloseButton(false)
	frame.Paint = function()
		draw.RoundedBox(0, 0, 0, ScrW(), ScrH(), Color(0,0,0,200))
	end
	
	local roagmotd_panel = vgui.Create("DPanel", frame)
	roagmotd_panel:SetPos(0,0)
	roagmotd_panel:SetSize(RoagMOTD.PanelWidth, ScrW())
	roagmotd_panel.Paint = function()
		draw.RoundedBox(0, 0, 0, RoagMOTD.PanelWidth, ScrW(), RoagMOTD.PanelColour)
	end
	
	local roagmotd_html = vgui.Create("HTML", frame)
	roagmotd_html:SetSize(ScrW()-RoagMOTD.PanelWidth-40, ScrH()-40)
	roagmotd_html:SetPos(RoagMOTD.PanelWidth+20, 20)
	roagmotd_html:OpenURL(RoagMOTD.DefaultURL)
	
	local loop = 0
	for k, v in pairs(RoagMOTD.ButtonsTable) do
	local roagmotd_buttons = vgui.Create("DButton", roagmotd_panel)
	roagmotd_buttons:SetPos(25,25+loop*60)
	roagmotd_buttons:SetSize(RoagMOTD.PanelWidth-50, 50)
	roagmotd_buttons:SetText("")
	roagmotd_buttons:SetColor(RoagMOTD.ButtonFontColour)
	roagmotd_buttons.Paint = function()
		draw.RoundedBox(0, 0, 0, 200,50, v.colour)
		draw.RoundedBox(0, 0, 25, 200,50, v.colour_two)
		draw.RoundedBox(0, 0, 25, 200/4,25, Color(204, 210, 215))
		draw.RoundedBox(0, 0, 0, 200/4,25, Color(255, 255, 255))
		draw.DrawText(k, "Bebas40", 65, 5, Color(255, 255, 255, 255),TEXT_ALIGN_LEFT)
	end
	loop = loop + 1
	roagmotd_buttons.DoClick = function()
		roagmotd_html:SetURL(v.url)
	end
	end
	
	local roagmotd_buttons_close = vgui.Create("DButton", roagmotd_panel)
	roagmotd_buttons_close:SetSize(RoagMOTD.PanelWidth-50, 50)
	roagmotd_buttons_close:SetPos(25,ScrH()-75)
	roagmotd_buttons_close:SetText(RoagMOTD.CloseButton)
	roagmotd_buttons_close:SetColor(RoagMOTD.ButtonFontColour)
	roagmotd_buttons_close:SetFont("Bebas40")
	roagmotd_buttons_close.Paint = function()
		draw.RoundedBox(0, 0, 0, RoagMOTD.PanelWidth-50, 50, RoagMOTD.CloseButtonColour)
		draw.RoundedBox(0, 0, 25, RoagMOTD.PanelWidth-50, 50, RoagMOTD.CloseButtonColour_2)
	end
	roagmotd_buttons_close.DoClick = function()
		frame:Remove()
		gui.EnableScreenClicker(false)
	end
	
end)