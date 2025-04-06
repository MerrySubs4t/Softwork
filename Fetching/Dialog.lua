local _index = {}
local _Library = {}
_translate=function(en,th)if _G.Thailand or getgenv().Thai or _G.Thai then return tostring(th)else return tostring(en)end end;
local Service = {
	TweenService = game:GetService("TweenService"),
	UserInputService = game:GetService("UserInputService")
}

function _index:Tween(info)
	return Service.TweenService:Create(info.v, TweenInfo.new(info.t, Enum.EasingStyle[info.s], Enum.EasingDirection[info.d]), info.g)
end

function _index:RbxtoNumber(rbx)
	return tonumber(string.match(rbx, "%d+"))
end

function _index:GetIcon(i)
	if type(i) == 'string' and not i:find('rbxassetid://') then
		return "rbxassetid://".. i
	elseif type(i) == 'number' then
		return "rbxassetid://".. i
	else
		return i
	end
end

function _index:lak(Frame)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos = UDim2.new(StartPosition.X.Scale, StartPosition.X.Offset + Delta.X, StartPosition.Y.Scale, StartPosition.Y.Offset + Delta.Y)
		local Tween = Service.TweenService:Create(Frame, TweenInfo.new(0.3), {Position = pos})
		Tween:Play()
	end

	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			Dragging = true
			DragStart = input.Position
			StartPosition = Frame.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					Dragging = false
				end
			end)
		end
	end)

	Frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			DragInput = input
		end
	end)

	Service.UserInputService.InputChanged:Connect(function(input)
		if input == DragInput and Dragging then
			Update(input)
		end
	end)
end

function _index:Shadow(Frame, Transparency)
	local Shadow = Instance.new("ImageLabel")

	Shadow.Parent = Frame
	Shadow.Name = "DropShadow"
	Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
	Shadow.BackgroundColor3 = Color3.fromRGB(28,28,30)
	Shadow.BackgroundTransparency = 1
	Shadow.BorderColor3 = Color3.fromRGB(0,0,0)
	Shadow.BorderSizePixel = 0
	Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	Shadow.Size = UDim2.new(1, 120, 1, 120)
	Shadow.ZIndex = 0
	Shadow.Image = _index:GetIcon(8992230677)
	Shadow.ImageColor3 = Color3.new(0, 0, 0)
	Shadow.ImageTransparency = Transparency or 0.35
	Shadow.ResampleMode = Enum.ResamplerMode.Default
	Shadow.ScaleType = Enum.ScaleType.Slice
	Shadow.SliceScale = 1
	Shadow.TileSize = UDim2.new(1, 0, 1, 0)
	Shadow.SliceCenter = Rect.new(99, 99, 99, 99)

	return Shadow
end

function _index:Button(Parent)
	local Click = Instance.new("TextButton")

	Click.Name = "Click"
	Click.Parent = Parent
	Click.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Click.BackgroundTransparency = 1.000
	Click.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Click.BorderSizePixel = 0
	Click.Size = UDim2.new(1, 0, 1, 0)
	Click.Font = Enum.Font.SourceSans
	Click.Text = ""
	Click.TextColor3 = Color3.fromRGB(0, 0, 0)
	Click.TextSize = 14.000

	return Click
end

function _index:ClickEffect(c, p)
	local Mouse = game.Players.LocalPlayer:GetMouse()

	local relativeX = Mouse.X - c.AbsolutePosition.X
	local relativeY = Mouse.Y - c.AbsolutePosition.Y

	if relativeX < 0 or relativeY < 0 or relativeX > c.AbsoluteSize.X or relativeY > c.AbsoluteSize.Y then
		return
	end

	local ClickButtonCircle = Instance.new("Frame")
	ClickButtonCircle.Parent = p
	ClickButtonCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ClickButtonCircle.BackgroundTransparency = 0.7
	ClickButtonCircle.BorderSizePixel = 0
	ClickButtonCircle.AnchorPoint = Vector2.new(0.5, 0.5)
	ClickButtonCircle.Position = UDim2.new(0, relativeX, 0, relativeY)
	ClickButtonCircle.Size = UDim2.new(0, 0, 0, 0)
	ClickButtonCircle.ZIndex = 10

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = ClickButtonCircle

	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

	local goal = {
		Size = UDim2.new(0, c.AbsoluteSize.X * 1.5, 0, c.AbsoluteSize.X * 1.5),
		BackgroundTransparency = 1
	}

	local expandTween = Service.TweenService:Create(ClickButtonCircle, tweenInfo, goal)

	expandTween.Completed:Connect(function()
		ClickButtonCircle:Destroy()
	end)

	expandTween:Play()
end

function _Library:Dialog(info)
	local Title = info.Title
	local Desc = info.Desc
	local Banner = info.Banner or _index:GetIcon(138127867432976)
	local Callback = info.Callback or function()end 


	local DialogNotify = Instance.new("ScreenGui")
	local Main_1 = Instance.new("Frame")
	local UICorner_1 = Instance.new("UICorner")
	local UIGradient_1 = Instance.new("UIGradient")
	local Main_2 = Instance.new("Frame")
	local Frame_1 = Instance.new("Frame")
	local ImageLabel_1 = Instance.new("ImageLabel")
	local UICorner_2 = Instance.new("UICorner")
	local ShadowInside_1 = Instance.new("Frame")
	local UIGradient_2 = Instance.new("UIGradient")
	local UICorner_3 = Instance.new("UICorner")
	local UICorner_4 = Instance.new("UICorner")
	local UICorner_5 = Instance.new("UICorner")
	local UIGradient_3 = Instance.new("UIGradient")
	local UIListLayout_1 = Instance.new("UIListLayout")
	local Frame_2 = Instance.new("Frame")
	local TextLabel_1 = Instance.new("TextLabel")
	local UIGradient_4 = Instance.new("UIGradient")
	local TextLabel_2 = Instance.new("TextLabel")
	local Frame_3 = Instance.new("Frame")
	local Frame_4 = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local TextLabel_3 = Instance.new("TextLabel")
	local UIGradient_5 = Instance.new("UIGradient")


	DialogNotify.Name = "DialogNotify"
	DialogNotify.Parent = not game:GetService("RunService"):IsStudio() and game:GetService("CoreGui") or game:GetService("Players").LocalPlayer.PlayerGui
	DialogNotify.ZIndexBehavior = Enum.ZIndexBehavior.Global

	Main_1.Name = "Main"
	Main_1.Parent = DialogNotify
	Main_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Main_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Main_1.BackgroundTransparency = 1
	Main_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Main_1.BorderSizePixel = 0
	Main_1.Position = UDim2.new(0.5, 0,0.5, 0)
	Main_1.Size = UDim2.new(0, 0,0, 0)

	task.spawn(function()
		_index:Tween({
			v = Main_1,
			t = 0.3,
			s = "Bounce",
			d = "Out",
			g = {Size = UDim2.new(0, 350,0, 300)}
		}):Play()
	end)

	_index:lak(Main_1)
	_index:Shadow(Main_1, 0.2)

	UICorner_1.Parent = Main_1

	UIGradient_1.Parent = Main_1
	UIGradient_1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(36, 36, 36)), ColorSequenceKeypoint.new(1, Color3.fromRGB(9, 9, 9))}

	Main_2.Name = "Main"
	Main_2.Parent = Main_1
	Main_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Main_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Main_2.BorderColor3 = Color3.fromRGB(0,0,0)
	Main_2.BorderSizePixel = 0
	Main_2.Position = UDim2.new(0.5, 0,0.5, 0)
	Main_2.Size = UDim2.new(1, 0,1, 0)
	Main_2.ClipsDescendants = true

	Frame_1.Parent = Main_2
	Frame_1.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Frame_1.BackgroundTransparency = 1
	Frame_1.BorderColor3 = Color3.fromRGB(0,0,0)
	Frame_1.BorderSizePixel = 0
	Frame_1.Position = UDim2.new(0.5, 0,0.166666672, 0)
	Frame_1.Size = UDim2.new(0, 350,0, 100)
	Frame_1.ClipsDescendants = true

	ImageLabel_1.Parent = Frame_1
	ImageLabel_1.AnchorPoint = Vector2.new(0.5, 0.5)
	ImageLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	ImageLabel_1.BackgroundTransparency = 1
	ImageLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ImageLabel_1.BorderSizePixel = 0
	ImageLabel_1.Position = UDim2.new(0.5, 0,0.5, 0)
	ImageLabel_1.Size = UDim2.new(1, 0,1, 0)
	ImageLabel_1.ClipsDescendants = true
	ImageLabel_1.Image = Banner
	ImageLabel_1.ScaleType = Enum.ScaleType.Crop

	UICorner_2.Parent = ImageLabel_1
	UICorner_2.CornerRadius = UDim.new(0,3)

	ShadowInside_1.Name = "ShadowInside"
	ShadowInside_1.Parent = ImageLabel_1
	ShadowInside_1.BackgroundColor3 = Color3.fromRGB(0,0,0)
	ShadowInside_1.BorderColor3 = Color3.fromRGB(0,0,0)
	ShadowInside_1.BorderSizePixel = 0
	ShadowInside_1.Size = UDim2.new(1, 0,1, 0)
	ShadowInside_1.ZIndex = 2

	UIGradient_2.Parent = ShadowInside_1
	UIGradient_2.Rotation = 90
	UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1), NumberSequenceKeypoint.new(0.7,1), NumberSequenceKeypoint.new(1,0.2)}

	UICorner_3.Parent = ShadowInside_1
	UICorner_3.CornerRadius = UDim.new(0,3)

	UICorner_4.Parent = Frame_1

	UICorner_5.Parent = Main_2

	UIGradient_3.Parent = Main_2
	UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 44, 33)), ColorSequenceKeypoint.new(0.302768, Color3.fromRGB(14, 25, 20)), ColorSequenceKeypoint.new(1, Color3.fromRGB(9, 9, 9))}
	UIGradient_3.Rotation = 90

	UIListLayout_1.Parent = Main_2
	UIListLayout_1.Padding = UDim.new(0,5)
	UIListLayout_1.SortOrder = Enum.SortOrder.LayoutOrder

	Frame_2.Parent = Main_2
	Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Frame_2.BackgroundTransparency = 1
	Frame_2.BorderColor3 = Color3.fromRGB(0,0,0)
	Frame_2.BorderSizePixel = 0
	Frame_2.Position = UDim2.new(0.5, 0,0.597750008, 0)
	Frame_2.Size = UDim2.new(0, 350,0, 148)
	Frame_2.ClipsDescendants = true

	TextLabel_1.Parent = Frame_2
	TextLabel_1.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel_1.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TextLabel_1.BackgroundTransparency = 1
	TextLabel_1.BorderColor3 = Color3.fromRGB(0,0,0)
	TextLabel_1.BorderSizePixel = 0
	TextLabel_1.Position = UDim2.new(0.5, 0,0.0879999995, 0)
	TextLabel_1.Size = UDim2.new(0.899999976, 0,0.162, 0)
	TextLabel_1.Font = Enum.Font.GothamBold
	TextLabel_1.Text = Title
	TextLabel_1.TextColor3 = Color3.fromRGB(255,255,255)
	TextLabel_1.TextSize = 20
	TextLabel_1.RichText = true

	UIGradient_4.Parent = TextLabel_1
	UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 255))}
	UIGradient_4.Rotation = 90

	TextLabel_2.Parent = Frame_2
	TextLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel_2.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TextLabel_2.BackgroundTransparency = 1
	TextLabel_2.BorderColor3 = Color3.fromRGB(0,0,0)
	TextLabel_2.BorderSizePixel = 0
	TextLabel_2.Position = UDim2.new(0.5, 0,0.569999993, 0)
	TextLabel_2.Size = UDim2.new(0.899999976, 0,0.777999997, 0)
	TextLabel_2.Font = Enum.Font.GothamBold
	TextLabel_2.Text = Desc
	TextLabel_2.TextColor3 = Color3.fromRGB(255,255,255)
	TextLabel_2.TextSize = 12
	TextLabel_2.TextYAlignment = Enum.TextYAlignment.Top
	TextLabel_2.RichText = true

	Frame_3.Parent = Main_2
	Frame_3.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Frame_3.BackgroundTransparency = 1
	Frame_3.BorderColor3 = Color3.fromRGB(0,0,0)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0.5, 0,0.936666667, 0)
	Frame_3.Size = UDim2.new(0, 350,0, 38)
	Frame_3.ClipsDescendants = true

	Frame_4.Parent = Frame_3
	Frame_4.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame_4.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Frame_4.BorderColor3 = Color3.fromRGB(0,0,0)
	Frame_4.BorderSizePixel = 0
	Frame_4.Position = UDim2.new(0.5, 0,0.5, 0)
	Frame_4.Size = UDim2.new(0, 150,0.649999976, 0)

	local click = _index:Button(Frame_4)

	click.MouseButton1Click:Connect(function()
		Callback()
		_index:ClickEffect(Frame_4, click)
		_index:Tween({
			v = Main_1,
			t = 0.3,
			s = "Bounce",
			d = "Out",
			g = {Size = UDim2.new(0, 0,0, 0)}
		}):Play()
		ImageLabel_1:Destroy()
		task.wait(0.3)
		Main_1:Destroy()
	end)

	UICorner_6.Parent = Frame_4
	UICorner_6.CornerRadius = UDim.new(0,3)

	TextLabel_3.Parent = Frame_4
	TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel_3.BackgroundColor3 = Color3.fromRGB(255,255,255)
	TextLabel_3.BackgroundTransparency = 1
	TextLabel_3.BorderColor3 = Color3.fromRGB(0,0,0)
	TextLabel_3.BorderSizePixel = 0
	TextLabel_3.Position = UDim2.new(0.5, 0,0.5, 0)
	TextLabel_3.Size = UDim2.new(1, 0,1, 0)
	TextLabel_3.Font = Enum.Font.GothamBold
	TextLabel_3.Text = "Continue"
	TextLabel_3.TextColor3 = Color3.fromRGB(255,255,255)
	TextLabel_3.TextSize = 14

	UIGradient_5.Parent = Frame_4
	UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 255))}
	UIGradient_5.Rotation = -12
end
return _Library
