local Library = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/UI/Acrylic-Design/Source.css'))();
--Library.Theme:Houston()
--theme https://github.com/3345-c-a-t-s-u-s/Acrylic
local Window = Library:CreateWindow({
	Title = 'Acrylic',
	Logo = "rbxassetid://7733920644",
	KeySystem = true,
	KeySystemInfo = {
		Title = "- Key System -",
		OnGetKey = function()
			return setclipboard('https://example.com/getkey?hwid=')
		end,
		OnLogin = function(key)
			if key == "1234" then
				wait(0.1);
				return true;
			end;
			
			wait();
			
			return false;
		end,
	}
});

local ExampleTab = Window:AddTab({
	Title = 'Example',
	Icon = 'home',
});

local SettingsTab = Window:AddTab({
	Title = 'Settings',
	Icon = 'settings',
});

ExampleTab:AddBlock('Example')

ExampleTab:AddButton({
	Title = 'Button',
	Callback = function()
		print('Click!')
	end,
})

ExampleTab:AddToggle({
	Title = 'Toggle',
	Default = false,
	Callback = function(value)
		print('Toggle!',value)
	end,
})

ExampleTab:AddSlider({
	Title = 'Slider',
	Max = 100,
	Min = 1,
	Default = 25,
	Round = 1,
	Callback = function(value)
		print('Slider!',value)
	end,
})

ExampleTab:AddKeybind({
	Title = 'Keybind',
	Default = "LeftControl",
	Callback = function(value)
		print('Keybind!',value)
	end,
})


ExampleTab:AddTextbox({
	Title = 'Textbox',
	PlaceHolder = 'Type something',
	--Default = "Text",
	Callback = function(value)
		print('Textbox!',value)
	end,
})


ExampleTab:AddDropdown({
	Title = 'Dropdown',
	Values = {1,2,3,4,5,6,7,8,9,10},
	Default = 5,
	Callback = function(value)
		print('Dropdown!',value)
	end,
})

ExampleTab:AddDropdown({
	Title = 'Multiple Dropdown',
	Values = {1,2,3,4,5,6,7,8,9,10},
	Default = {3,4,5,6,7},
	Multi = true,
	MaxMulti = 10,
	Callback = function(value)
		print('Multiple Dropdown!',value)
	end,
})

ExampleTab:AddParagraph({
	Title = 'Paragraph',
	Description = "Device Supported:\n[Mobile]: ✅\n[PC]: ✅\n[Console]: ✅\n\nExecutor Supported:\nSolara\nZolara\nSynapse Z\nWave\nTrigon\nCode X\nArceus X\nFluxus"
})

SettingsTab:AddBlock('Settings')

SettingsTab:AddButton({
	Title = "Reset UI Size",
	Callback = function()
		Window:Resize(Library.SizeLibrary.Default)
	end,
})

SettingsTab:AddToggle({
	Title = 'Performance',
	Default = false,
	Callback = function(a)
		Library.PerformanceMode = a;
	end,
})

SettingsTab:AddBlock("")

SettingsTab:AddButton({
	Title = "Destroy UI",
	Callback = function()
		Window:Destroy()
	end,
})
