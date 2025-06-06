--Main Source Made By Mituma Dev

local function ESP_Index()
	return typeof(getfenv().getgenv) == "function" and typeof(getfenv().getgenv()) == "table" and getfenv().getgenv() or _G
end

if ESP_Index().ESP then
	return ESP_Index().ESP
end

local ESPChange = Instance.new("BindableEvent")
local ESP; ESP = {
	Value = setmetatable({}, {
		__index = function(self, name)
			return ESP.Values[name]
		end,
		__newindex = function(self, name, value)
			if ESP.Values[name] == value then return end
			ESP.Values[name] = value
			ESPChange:Fire()
		end
	}),
	Values = {},
	ESPApplied = {}
}
local cons = {}

function GetRGBValue()
	return Color3.new(
		math.sin(((os.clock() * 12) % 360) / 360 * 2 * math.pi) * 0.5 + 0.5,
		math.sin((((os.clock() * 12) % 360) / 360 + 1/3) * 2 * math.pi) * 0.5 + 0.5,
		math.sin((((os.clock() * 12) % 360) / 360 + 2/3) * 2 * math.pi) * 0.5 + 0.5
	)
end


local function ESPz(obj, espSettings)
	if not obj then return end
	obj = obj:IsA("Model") and obj or obj:FindFirstAncestorOfClass("Model") or obj

	espSettings = espSettings or {}
	espSettings.Color = espSettings.Color or Color3.new(1,1,1)
	espSettings.HighlightEnabled = type(espSettings.HighlightEnabled) ~= "nil" and espSettings.HighlightEnabled or type(espSettings.HighlightEnabled) == "nil"
	espSettings.Text = espSettings.Text or obj.Name
	espSettings.ESPName = espSettings.ESPName or ""
	--espSettings.Object = espSettings.Object or obj

	local col = espSettings.Color

	local function updateESP()
		local found = table.find(ESP.ESPApplied, obj)
		if not found then
			table.insert(ESP.ESPApplied, obj)
		end

		local ESPFolder = obj:FindFirstChild("ESPFolder") or Instance.new("Folder", obj)
		ESPFolder.Name = "ESPFolder"

		local hl = ESPFolder:FindFirstChild("Highlight") or Instance.new("Highlight", ESPFolder)
		hl.Adornee = obj
		hl.OutlineColor = col
		hl.FillColor = col
		hl.FillTransparency = 0.8
		hl.OutlineTransparency = 0.8
		hl.Enabled = not not ESP.Value[espSettings.ESPName]

		if not espSettings.HighlightEnabled then
			hl:Destroy()
		end

		local bg = ESPFolder:FindFirstChild("BillboardGui") or Instance.new("BillboardGui", ESPFolder)
		bg.Adornee = espSettings.Object or obj
		bg.AlwaysOnTop = true
		bg.Size = UDim2.fromOffset(100, 100)
		bg.MaxDistance = math.huge
		bg.Enabled = not not ESP.Value[espSettings.ESPName]

		local circle = bg:FindFirstChild("Frame") or Instance.new("Frame", bg)
		circle.Position = UDim2.fromScale(0.5, 0.5)
		circle.AnchorPoint = Vector2.new(0.5, 0.5)
		circle.Size = UDim2.fromOffset(2, 2)
		circle.BackgroundColor3 = col

		local corner = circle:FindFirstChild("UICorner") or Instance.new("UICorner", circle)
		corner.CornerRadius = UDim.new(1,0)

		local gradient = circle:FindFirstChild("UIGradient") or Instance.new("UIGradient", circle)
		gradient.Rotation = 90
		gradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(1,1,1)), ColorSequenceKeypoint.new(1, Color3.new(0.5, 0.5, 0.5))})

		local stroke = circle:FindFirstChild("UIStroke") or Instance.new("UIStroke", circle)
		stroke.Thickness = 0.5

		local label = bg:FindFirstChild("TextLabel") or Instance.new("TextLabel", bg)
		label.TextStrokeTransparency = 1
		label.BackgroundTransparency = 1
		label.TextColor3 = col
		label.Text = espSettings.Text
		label.TextScaled = true
		label.Font = Enum.Font.Code
		label.Size = UDim2.fromScale(1, 0.2)
		label.Position = UDim2.new(0, 0, 0.5, 24)
		label.AnchorPoint = Vector2.new(0, 0.5)

		local stroke = label:FindFirstChild("UIStroke") or Instance.new("UIStroke", label)
		stroke.Thickness = 1
	end

	Destroy_ESP()
	updateESP()
	local con1, con2, con3;

	cons[obj] = {}

	local function doCon3()
		if con3 then
			con3:Disconnect()
			con3 = nil
			cons[obj][3] = nil
		end
		con3 = game["Run Service"].RenderStepped:Connect(function()
			if not obj or not obj.Parent or not obj:FindFirstChild("ESPFolder") then
				con1:Disconnect()
				con2:Disconnect()
				con3:Disconnect()
				con3 = nil
				cons[obj][3] = nil
				col = espSettings.Color
				updateESP()
				return
			end
			col = GetRGBValue()
			updateESP()
		end)
		cons[obj][3] = con3
	end
	con1 = ESPChange.Event:Connect(function()
		updateESP()
		if ESP.Value.RGBESP and not con3 then
			doCon3()
		elseif not ESP.Value.RGBESP and con3 then
			con3:Disconnect()
			con3 = nil
			cons[obj][3] = nil
			col = espSettings.Color
			updateESP()
		end
	end)
	con2 = obj.Destroying:Connect(function()
		con1:Disconnect()
		con2:Disconnect()
		if con3 then
			con3:Disconnect()
			con3 = nil
			cons[obj][3] = nil
			col = espSettings.Color
			updateESP()
		end
	end)
	cons[obj][1] = con1
	cons[obj][2] = con2
	if ESP.Value.RGBESP then
		doCon3()
	end
end
function Destroy_ESP(obj)
	if not obj then return end
	obj = obj:IsA("Model") and obj or obj:FindFirstAncestorOfClass("Model") or obj

	local found = table.find(ESP.ESPApplied, obj)
	if found then
		table.remove(ESP.ESPApplied, found)
	end

	for i,v in (cons[obj] or {}) do
		if v then
			v:Disconnect()
		end
	end 

	if obj:FindFirstChild("ESPFolder") then
		obj.ESPFolder:Destroy()
	end
end

ESP.AddESP = ESPz
ESP.RemoveESP = Destroy_ESP

ESP_Index.ESP = ESP

return ESP
