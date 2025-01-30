Library = {}

function Library:CreateWindowKey(a)

	assert(type(a) == "table", "Invalid configuration table.")

	local function Tw(info)
		return game:GetService("TweenService"):Create(info.v,TweenInfo.new(info.t,Enum.EasingStyle[info.s],Enum.EasingDirection[info.d]),info.g)
	end
	local function gl(i)
		local a
		if type(i) == 'string' and not i:find('rbxassetid://') then
			a = "rbxassetid://".. i
		elseif type(i) == 'number' then
			a = "rbxassetid://".. i
		else
			a = i
		end
		return a
	end
	local function lak(o)
		local a, b, c, d
		local function u(i)
			local Delta = i.Position - c
			local pos = UDim2.new(d.X.Scale, d.X.Offset + Delta.X, d.Y.Scale, d.Y.Offset + Delta.Y)
			local Tween = game:GetService("TweenService"):Create(o, TweenInfo.new(0.3), {Position = pos})
			Tween:Play()
		end
		o.InputBegan:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
				a = true
				c = i.Position
				d = o.Position

				i.Changed:Connect(function()
					if i.UserInputState == Enum.UserInputState.End then
						a = false
					end
				end)
			end
		end)
		o.InputChanged:Connect(function(i)
			if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
				b = i
			end
		end)

		game:GetService("UserInputService").InputChanged:Connect(function(i)
			if i == b and a then
				u(i)
			end
		end)
	end
	local function checkKey(textBox, validKey)
		local inputKey = textBox.Text
		return inputKey == validKey
	end

	assert(a.Name, "Missing Name")
	assert(a.Icon, "Missing Logo")
	assert(a.Desc, "Missing Desc")
	assert(a.Key, "Missing Key")
	local Name, Icon, Desc, Key = a.Name, a.Icon, a.Desc, a.Key

	local GetKey = Instance.new("ScreenGui")
	local Shadow_1 = Instance.new("ImageLabel")
	local background_1 = Instance.new("Frame")
	local UICorner_1 = Instance.new("UICorner")
	local UIGradient_1 = Instance.new("UIGradient")
	local Logo_1 = Instance.new("ImageLabel")
	local MapName_1 = Instance.new("TextLabel")
	local Desc_1 = Instance.new("TextLabel")
	local Key_1 = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UIGradient_2 = Instance.new("UIGradient")
	local UIStroke_1 = Instance.new("UIStroke")
	local UIGradient_3 = Instance.new("UIGradient")
	local CheckKeyText_1 = Instance.new("TextLabel")
	local TextBox_1 = Instance.new("TextBox")
	local ListButton_1 = Instance.new("Frame")
	local UIListLayout_1 = Instance.new("UIListLayout")
	local CheckKey_1 = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIGradient_4 = Instance.new("UIGradient")
	local TextLabel_1 = Instance.new("TextLabel")
	local load_1 = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local UIGradient_5 = Instance.new("UIGradient")
	local Logo_2 = Instance.new("ImageLabel")

	GetKey.Name = "GetKey"
	GetKey.Parent = not game:GetService("RunService"):IsStudio() and game:GetService("CoreGui") or game:GetService("Players").LocalPlayer.PlayerGui

	Shadow_1.Name = "Shadow"
	Shadow_1.Parent = GetKey
	Shadow_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadow_1.BackgroundColor3 = Color3.fromRGB(163,162,165)
	Shadow_1.BackgroundTransparency = 1
	Shadow_1.Position = UDim2.new(0.5, 0,0.5, 0)
	Shadow_1.Size = UDim2.new(0, 0,0, 0)
	Shadow_1.Image = "rbxassetid://1316045217"
	Shadow_1.ImageColor3 = Color3.fromRGB(32,32,34)
	Shadow_1.ScaleType = Enum.ScaleType.Slice
	Shadow_1.SliceCenter = Rect.new(10, 10, 118, 118)
	Shadow_1.ClipsDescendants = true

	background_1.Name = "background"
	background_1.Parent = Shadow_1
	background_1.AnchorPoint = Vector2.new(0.5, 0.5)
	background_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	background_1.BorderColor3 = Color3.fromRGB(0,0,0)
	background_1.BorderSizePixel = 0
	background_1.Position = UDim2.new(0.5, 0,0.5, 0)
	background_1.Size = UDim2.new(0, 0,0, 0)

	lak(Shadow_1)

	UICorner_1.Parent = background_1

	UIGradient_1.Parent = background_1
	UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 74, 85)), ColorSequenceKeypoint.new(1, Color3.fromRGB(31, 31, 33))}

	Logo_1.Name = "Logo"
	Logo_1.Parent = background_1
	Logo_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Logo_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Logo_1.BackgroundTransparency = 1
	Logo_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Logo_1.BorderSizePixel = 0
	Logo_1.Position = UDim2.new(0.5, 0,0.5, 0)
	Logo_1.Size = UDim2.new(0, 300,0, 300)
	Logo_1.Image = gl(Icon)
	Logo_1.ImageTransparency = 0.800000011920929

	MapName_1.Name = "MapName"
	MapName_1.Parent = background_1
	MapName_1.AnchorPoint = Vector2.new(0.5, 0.5)
	MapName_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	MapName_1.BackgroundTransparency = 1
	MapName_1.BorderColor3 = Color3.fromRGB(0,0,0)
	MapName_1.BorderSizePixel = 0
	MapName_1.Position = UDim2.new(0.5, 0,0.119999997, 0)
	MapName_1.Size = UDim2.new(0, 200,0, 50)
	MapName_1.Font = Enum.Font.SourceSansBold
	MapName_1.Text = tostring(Name)
	MapName_1.TextColor3 = Color3.fromRGB(255,255,255)
	MapName_1.TextSize = 50

	Desc_1.Name = "Desc"
	Desc_1.Parent = background_1
	Desc_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Desc_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Desc_1.BackgroundTransparency = 1
	Desc_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Desc_1.BorderSizePixel = 0
	Desc_1.Position = UDim2.new(0.5, 0,0.239999995, 0)
	Desc_1.Size = UDim2.new(0, 200,0, 50)
	Desc_1.Font = Enum.Font.SourceSansBold
	Desc_1.Text = tostring(Desc)
	Desc_1.TextColor3 = Color3.fromRGB(255,255,255)
	Desc_1.TextSize = 20
	Desc_1.TextTransparency = 0.5

	Key_1.Name = "Key"
	Key_1.Parent = background_1
	Key_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Key_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Key_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Key_1.BorderSizePixel = 0
	Key_1.Position = UDim2.new(0.5, 0,0.769999981, 0)
	Key_1.Size = UDim2.new(0, 220,0, 40)
	Key_1.ZIndex = 2

	UICorner_2.Parent = Key_1

	UIGradient_2.Parent = Key_1
	UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 74, 85)), ColorSequenceKeypoint.new(1, Color3.fromRGB(31, 31, 33))}

	UIStroke_1.Parent = Key_1
	UIStroke_1.Color = Color3.fromRGB(255,255,255)
	UIStroke_1.Thickness = 2

	UIGradient_3.Parent = UIStroke_1
	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(92, 92, 92)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(158, 158, 158)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(92, 92, 92))}

	CheckKeyText_1.Name = "CheckKeyText"
	CheckKeyText_1.Parent = Key_1
	CheckKeyText_1.AnchorPoint = Vector2.new(0.5, 1)
	CheckKeyText_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	CheckKeyText_1.BackgroundTransparency = 1
	CheckKeyText_1.BorderColor3 = Color3.fromRGB(0,0,0)
	CheckKeyText_1.BorderSizePixel = 0
	CheckKeyText_1.Position = UDim2.new(0.5, 0,0, 0)
	CheckKeyText_1.Size = UDim2.new(0, 200,0, 30)
	CheckKeyText_1.Font = Enum.Font.SourceSansBold
	CheckKeyText_1.Text = ". . ."
	CheckKeyText_1.TextColor3 = Color3.fromRGB(255, 255, 255)
	CheckKeyText_1.TextSize = 20

	TextBox_1.Parent = Key_1
	TextBox_1.Active = true
	TextBox_1.AnchorPoint = Vector2.new(0.5, 0)
	TextBox_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TextBox_1.BackgroundTransparency = 1
	TextBox_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TextBox_1.BorderSizePixel = 0
	TextBox_1.CursorPosition = -1
	TextBox_1.Position = UDim2.new(0.5, 0,0, 0)
	TextBox_1.Size = UDim2.new(0.899999976, 0,1, 0)
	TextBox_1.ZIndex = 3
	TextBox_1.Font = Enum.Font.SourceSansBold
	TextBox_1.PlaceholderColor3 = Color3.fromRGB(156,156,156)
	TextBox_1.PlaceholderText = "Paste Your Key"
	TextBox_1.Text = ""
	TextBox_1.TextColor3 = Color3.fromRGB(255,255,255)
	TextBox_1.TextSize = 15

	ListButton_1.Name = "ListButton"
	ListButton_1.Parent = background_1
	ListButton_1.AnchorPoint = Vector2.new(0.5, 1)
	ListButton_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ListButton_1.BackgroundTransparency = 1
	ListButton_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ListButton_1.BorderSizePixel = 0
	ListButton_1.Position = UDim2.new(0.5, 0,0.99000001, 0)
	ListButton_1.Size = UDim2.new(0, 100,0, 40)

	UIListLayout_1.Parent = ListButton_1
	UIListLayout_1.Padding = UDim.new(0,5)
	UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Center

	CheckKey_1.Name = "CheckKey"
	CheckKey_1.Parent = ListButton_1
	CheckKey_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	CheckKey_1.BorderColor3 = Color3.fromRGB(0,0,0)
	CheckKey_1.BorderSizePixel = 0
	CheckKey_1.Size = UDim2.new(0, 100,0, 35)

	UICorner_3.Parent = CheckKey_1
	UICorner_3.CornerRadius = UDim.new(0,9)

	UIGradient_4.Parent = CheckKey_1
	UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(102, 191, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(8, 116, 255))}

	TextLabel_1.Parent = CheckKey_1
	TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TextLabel_1.BackgroundTransparency = 1
	TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TextLabel_1.BorderSizePixel = 0
	TextLabel_1.Size = UDim2.new(1, 0,1, 0)
	TextLabel_1.Font = Enum.Font.SourceSansBold
	TextLabel_1.Text = "Check"
	TextLabel_1.TextColor3 = Color3.fromRGB(255,255,255)
	TextLabel_1.TextSize = 20

	load_1.Name = "load"
	load_1.Parent = Shadow_1
	load_1.AnchorPoint = Vector2.new(0.5, 0.5)
	load_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	load_1.BorderColor3 = Color3.fromRGB(0,0,0)
	load_1.BorderSizePixel = 0
	load_1.Position = UDim2.new(0.5, 0,0.5, 0)
	load_1.Size = UDim2.new(0, 350,0, 300)
	load_1.ClipsDescendants = true
	load_1.ZIndex = 5

	UICorner_4.Parent = load_1
	UICorner_4.CornerRadius = UDim.new(0,8)

	UIGradient_5.Parent = load_1
	UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 74, 85)), ColorSequenceKeypoint.new(1, Color3.fromRGB(31, 31, 33))}

	Logo_2.Name = "Logo"
	Logo_2.Parent = load_1
	Logo_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Logo_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Logo_2.BackgroundTransparency = 1
	Logo_2.BorderColor3 = Color3.fromRGB(0,0,0)
	Logo_2.BorderSizePixel = 0
	Logo_2.Position = UDim2.new(0.5, 0,0.5, 0)
	Logo_2.Size = UDim2.new(0, 250,0, 250)
	Logo_2.Image = gl(Icon)
	Logo_2.ZIndex = 6

	local Click = Instance.new("TextButton")

	Click.Name = "Click"
	Click.Parent = CheckKey_1
	Click.Active = true
	Click.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Click.BackgroundTransparency = 1
	Click.BorderColor3 = Color3.fromRGB(0,0,0)
	Click.BorderSizePixel = 0
	Click.Size = UDim2.new(1, 0,1, 0)
	Click.Font = Enum.Font.SourceSans
	Click.Text = ""
	Click.TextSize = 14

	delay(.5, function()
		Tw({
			v = Shadow_1,
			t = 1,
			s = "Exponential",
			d = "Out",
			g = {Size = UDim2.new(0, 360,0, 310)}
		}):Play()
		Tw({
			v = background_1,
			t = 1,
			s = "Exponential",
			d = "Out",
			g = {Size = UDim2.new(0, 350,0, 300)}
		}):Play()
		wait(.5)
		Tw({
			v = load_1,
			t = 1,
			s = "Exponential",
			d = "Out",
			g = {Size = UDim2.new(0, 0,0, 0)}
		}):Play()
		Tw({
			v = Logo_2,
			t = 1,
			s = "Exponential",
			d = "Out",
			g = {Size = UDim2.new(0, 0,0, 0)}
		}):Play()
		Tw({
			v = UICorner_4,
			t = 1,
			s = "Exponential",
			d = "Out",
			g = {CornerRadius = UDim.new(1,0)}
		}):Play()
	end)

	local isTyping = false

	local function rotateGradient(gradient)
		local connection
		connection = game:GetService("RunService").RenderStepped:Connect(function()
			if not isTyping then
				connection:Disconnect()
			else
				gradient.Rotation = (gradient.Rotation + 2) % 360
			end
		end)
	end

	TextBox_1.Focused:Connect(function()
		isTyping = true
		rotateGradient(UIGradient_3)
	end)

	TextBox_1.FocusLost:Connect(function()
		isTyping = false
	end)

	local sound = Instance.new("Sound")
	sound.Name = "Sound"
	sound.Volume = 1
	sound.Looped = false
	sound.Parent = workspace

	Click.MouseButton1Click:Connect(function()
		if checkKey(TextBox_1, Key) then
			CheckKeyText_1.Text = "Key Verified"
			CheckKeyText_1.TextColor3 = Color3.fromRGB(0, 255, 0)

			sound.SoundId = "rbxassetid://3450794184"
			sound:Play()

			Tw({
				v = CheckKeyText_1,
				t = .1,
				s = "Exponential",
				d = "Out",
				g = {Rotation = 5}
			}):Play()
			delay(.04, function()
				Tw({
					v = CheckKeyText_1,
					t = .1,
					s = "Exponential",
					d = "Out",
					g = {Rotation = 0}
				}):Play()
			end)

			delay(1, function()
				Tw({
					v = Shadow_1,
					t = 1,
					s = "Exponential",
					d = "Out",
					g = {Size = UDim2.new(0, 0,0, 0)}
				}):Play()
				local ag = Tw({
					v = background_1,
					t = 1,
					s = "Exponential",
					d = "Out",
					g = {Size = UDim2.new(0, 0,0, 0)}
				})
				ag:Play()
				ag.Completed:Wait()
				GetKey:Destroy()
			end)
		else
			sound.SoundId = "rbxassetid://550209561"
			sound:Play()

			CheckKeyText_1.Text = "Invalid Key"
			CheckKeyText_1.TextColor3 = Color3.fromRGB(255, 49, 49)
			Tw({
				v = CheckKeyText_1,
				t = .1,
				s = "Exponential",
				d = "Out",
				g = {Rotation = 5}
			}):Play()
			delay(.04, function()
				Tw({
					v = CheckKeyText_1,
					t = .1,
					s = "Exponential",
					d = "Out",
					g = {Rotation = 0}
				}):Play()
			end)
		end
	end)

	local g = {}
	function g:CreateGetKeyButton(a)
		assert(typeof(a.Name) == "string", "newText ต้องเป็น string")
		assert(typeof(a.Callback) == "function", "callback ต้องเป็น function")

		local newButton = CheckKey_1:Clone()
		newButton.TextLabel.Text = a.Name
		newButton.Click.MouseButton1Click:Connect(a.Callback)
		newButton.Parent = ListButton_1
	end

	return g
end

local Window = Library:CreateWindowKey({
	Name = "Fish",
	Desc = "Link in your clipboard",
	Icon = 107097024646412,
	Key = "1234"
})

Window:CreateGetKeyButton({
	Name = "Get Key",
	Callback = function()
		print("setclipboard key")
	end})
