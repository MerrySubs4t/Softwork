local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/UI/Xeo/Sorce.css"))() --Logo Cant Change use ur Brain to change this

local main = library.new({Loading = true}) -- true : Loading Screen

local tab = main.tab({Title = "Tab"})

local page1 = tab.page({Title = "Page",Side = 2})
local page2 = tab.page({Title = "Page",Side = 1})

local toggle = page1.Toggle({Title = "Toggle",Default = false,Callback = function(value)
	print(value)
end,})
	--toggle.SetValue(20)
local Slider = page1.Slider({Title = "Slider",Min = 0,Max = 5000,Default = 100,Callback = function(value)
	print(value)
end,})
	-- Slider.SetValue(20)
local Label = page1.Label({Title = "Lebel"})

page1.Button({Title = "Button",Callback = function()
	print("Button")
end,})

local dropdown = page1.Dropdown({Title = "Dropdown",List = {1,2,3,4,5,6},Default = 1,Multi = false,Callback = function(value)
	print(value)
end,})
	-- dropdown.Add(value)
	-- dropdown.Clear()
	
local toggle = page2.Toggle({Title = "Toggle",Default = false,Callback = function(value)
	print(value)
end,})
--toggle.SetValue(20)
local Slider = page2.Slider({Title = "Slider",Min = 0,Max = 5000,Default = 100,Callback = function(value)
	print(value)
end,})
-- Slider.SetValue(20)
local Label = page2.Label({Title = "Lebel"})

page1.Button({Title = "Button",Callback = function()
	print("Button")
end,})

local dropdown = page2.Dropdown({Title = "Dropdown",List = {1,2,3,4,5,6},Default = 1,Multi = false,Callback = function(value)
	print(value)
end,})
