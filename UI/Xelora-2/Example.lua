--Credit to SixzensED
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/UI/Xelora-2/Source.obf"))()

local main = library:CreateWindow({Title = "Xelora Hub 2",Icon = 127435222710292})

local tab = main:CreateTab({Title = "Tabs ???"})

local tab2 = main:CreateTab({Title = "Tabs ???"})

local side = tab:CreateSection({Title = "Section Left ?",Side = "l"})

local side2 = tab:CreateSection({Title = "Section Right ?",Side = "r"})

side:CreateToggle({Title = "Toggle ???",value = true,callback = function(value)
    print(value)
end,})

side:CreateSlider({Title = "Slider ???",min = 0,max = 10000,value = 1000,callback = function(value)
    print(value)
end,})

side:CreateButton({Title = "Button ???",callback = function()
    print(math.random(1,999))
end,})

side:CreateDropdown({Title = "Dropdown ???",value = 1,list = {1,2,3,4,5,6,7,8,9,10},multi = false,callback = function(value)
    print(value)
end,})

side:CreateDropdown({Title = "Multi Dropdown ???",value = {1,2,3,4},list = {1,2,3,4,5,6,7,8,9,10},multi = true,callback = function(value)
    print(value)
end,})

side:CreateLabel({Title = "Label ???",side = "right"}) -- right , left , empty = center

side:CreateKeyBind({Title = "Keybind ???",key = Enum.KeyCode.Q,value = false,callback = function(value)
    print(value)
end,})

side:CreateTextBox({Title = "Textbox ???",value = "lol xelora hub",placeholder = "lol",callback = function(value)
    print(value)
end,})
