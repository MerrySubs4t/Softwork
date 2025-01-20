local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/UI/System/Source.css"))() -- LIBRARY
local Window = Library:CreateWindow('BT Project') -- CREATE WINDOW

Tab_1 = Window:addTab('#Home') --Tab

local Home_Left = Tab_1:addSection() --Section

Home_Left:addMenu("#Changelog")--label changelog

local Home_Right = Tab_1:addSection() -- HOME RIGHT SECTION

local Main_Home = Home_Right:addMenu("#Home") --menu right

Main_Home:addTextbox("Speed Hack", 19, function(speedfunc)--Textbox
	print(19)
end)

Main_Home:addToggle("true", true, function(Value)--togglr
	print(Value)
end)
Main_Home:addToggle("false", false, function(Value)--togglr
	print(Value)
end)

Main_Home:addButton("FPS Boost", function()--button
	print("c")
end)

Main_Home:addDropdown('Select Event', "d", {"d", "s"}, function (Value)
	print(Value)
end)
