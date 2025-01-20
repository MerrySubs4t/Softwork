local LoadingTime = tick()
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/G1GX/Collection/refs/heads/main/Dummyhub/Src"))()
local Window = Library:CreateWindow({Credit = "pindummy"})
local Page1 = Window:AddPage({
	Title = "General",
	Icon = "home",
	Page = {
		Left = {
			Name = "Farm",
			Icon = "arrow-big-up"
		},
		Right = {
			Name = "Setup",
			Icon = "file-cog"
		}
	}
})
Page1:CreateToggle("Left", {
	Title = "Farm Level",
	Desc = "Level Max 2400",
	Value = false,
	Callback = function(vu)
		
	end})
Page1:CreateDropdown("Right",{
	Title = "Weapon",
	Desc = "Select Weapon Farm",
	ListDesc = "Select Weapon To Farm",
	Value = "Melee",
	List = {"Melee", "Sword", "Power Fruit"},
	MultiDropdown = false,
	Callback = function(vu)
			
	end})
Page1:CreateSlider("Right",{
	Title = 'Distance',
	Desc = "Setup Distance",
	Min = 1,
	Max = 20,
	Value = 20,
	Callback = function(vu)
	
	end})
Page1:CreateLabel("Right", {
	Title = " - Setting Skill",
	Desc = "Select Skill To Use Farm"
})
Page1:CreateButton("r",{
	Title = "Redeem All Code",
	Desc = "Redeem All Code Need lv 25",
	Secure = false,
	Callback = function()
		
	end})
