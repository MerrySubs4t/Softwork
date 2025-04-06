
Fetching = loadstring(game:HttpGetAsync("https://github.com/MerrySubs4t/Softwork/blob/main/Fetching/FrameworkUI.lua?raw=true"))({"https://discord.gg/uy6TP4ew7d"})
Window = Fetching:Window({
	Logo = 128185233852701,
	Size = UDim2.new(0, 500,0, 375)
})
Tab1 = Window:CreateTab({
	Title = "General",
	Icon = 108409511010308
})
Tab2 = Window:CreateTab({
	Title = "Teleport",
	Icon = 108409511010308
})
Tab3 = Window:CreateTab({
	Title = "Automatic",
	Icon = 108409511010308
})
Section = Tab1:CreateSection({
	Title = "Test",
	Side = "r"
})
Section2 = Tab1:CreateSection({
	Title = "Test",
	Side = "l"
})
Section3 = Tab1:CreateSection({
	Title = "Test",
	Side = "l"
})
Section:CreateToggle({
	Title = "Test",
	Value = false,
	CallBack = function(v)
		print(v)
	end
})
Section:CreateToggle({
	Title = "Test",
	Value = true,
	CallBack = function(v)
		print(v)
	end
})
Section3:CreateLabel({
	Title = "Impossible",
	Side = "Left"
})
Section3:CreateImage({
	Title = "TestEZ",
	Desc = "kuy buy 999999999999999 coins",
	Icon = 81707063924327
})
Section:CreateButton({
	Title = "Button",
	CallBack = function()
		print("Click")
	end
})
Section.Line()
Section:CreateButton({
	Title = "Button",
	CallBack = function()
		print("Click")
	end
})
Section2:CreateButton({
	Title = "Button",
	CallBack = function()
		print("Click")
	end
})
Section2:CreateButton({
	Title = "Button",
	CallBack = function()
		print("Click")
	end
})
Section3:CreateSlider({
	Title = "This is a Slider",
	Desc = "Description Slider",
	Min = 0,
	Max = 1,
	Value = 0.5,
	Rounding = 2,
	Callback = function(value)
		print(value)
	end
})
Section2:CreateDropdown({
	Title = "This is a multi dropdown",
	List = {"SA", "GGGG", "QQQQ", "4", "5"},
	Value = "As",
	Multi = false,
	Callback = function(value)
		print(value)
	end})
Section:CreateKeybind({
	Title = "Keybind",
	Key = Enum.KeyCode.Q,
	Value = false,
	Callback = function(key, value)
		print(key, value)
	end,
})
Section:CreateSelect({
	Title = "Select Clear",
	Desc = "Description",
	List = {"Clear All", "Clear String", "Clear Table", "Add List"},
	Value = "Clear All",
	Callback = function(value)
		_G.Clear = value
	end,
})
Section:CreateTextbox({
	Title = "This is a TextBox",
	Desc = "description textbox",
	ClearTextOnFocus = true,
	Value = "f",
	Callback = function(value)
		print(value)
	end})

Section:CreateSpawn({
	Title = "Megalodon",
	Color = Color3.fromRGB(0, 255, 127),
	Transparency = 0
})
Section:CreateSpawn({
	Title = "Orca",
	Color = Color3.fromRGB(0, 255, 127),
	Transparency = 0
})
Section:Image({
	Image = 138127867432976
})
a = Section:Paragarp({
	Title = "Asasasaa"
})
az = Section:Icon({
	Title = "Asasas",
	Image = 81707063924327
})
task.wait(5)
az:ImageColor(Color3.fromRGB(255, 255, 0))
Section:Icon({Title = "Posutin", Image = 98398560997612})
