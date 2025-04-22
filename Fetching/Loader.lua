if not game:IsLoaded() then game.Loaded:Wait() end

if getgenv().Fetching then
	return error("Dectection 2 Executions: Line 8 return function(...)")
end

function LoadGame()
	if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/Fetching/_index/Bloxfruits"))() -- Bloxfruit
	elseif game.PlaceId == 72907489978215 or game.PlaceId == 16732694052 then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/Fetching/_index/Fisch"))() -- Fisch
	else
		game:GetService("Players").LocalPlayer:Kick("Game not found :(\nhttps://discord.gg/uy6TP4ew7d")
	end
end

translate = function(en, th)
	if _G.Thailand or getgenv().Thai or _G.Thai then
		return tostring(th)
	else 
		return tostring(en)
	end 
end

Dialog = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/Fetching/Framework/dialog5555"))()

th = 'ตรวจพบ "ไฟล์บันทึกการตั้งค่า" คุณต้องการลบ "ไฟล์บันทึกการตั้งค่า" รึป่าว\nคำเตือน : หากคุณลบ "ไฟล์บันทึกการตั้งค่า" การตั้งค่าจะถูกรีเซ็ตเป็นค่าเริ่มต้นทั้งหมด\nเช่น คุณเปิดการย้ายเซิฟหาบอสตัวใดตัวหนึ่งแล้วคุณลบการตั้งค่า มันก็จะถูกรีเซ็ตเป็นหรือปิดทันที'
en = '"Settings Log File" has been detected. Do you want to delete "Settings Log File" ?Warning: If you delete the "Settings Log File", all settings will be reset to their default values.For example, if you enabled server hopping to find a specific boss and you delete the settings, it will be reset or disabled.'
if isfolder("Fetching'Script") then
	Dialog:Create({
		title = "Fetching's Script",
		desc = translate(en, th),
		titleb1 = translate("Remove", "ลบการตั้งค่า"),
		titleb2 = translate("Ignore", "ไม่สนใจ"),
		UpperCallback = function()
				if isfolder("Fetching'Script") then
					delfolder("Fetching'Script")
				end
				wait(1)
				LoadGame()
		end,
		LowerCallback = function()
				LoadGame()
		end,
	})
else
		LoadGame()
end

local TeleportCheck = false
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
	if not TeleportCheck and queue_on_teleport then
		TeleportCheck = true
		queue_on_teleport([[
			if not game:IsLoaded() then game.Loaded:Wait() end

			if game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/Fetching/_index/Bloxfruits"))() -- Bloxfruit
			elseif game.PlaceId == 72907489978215 or game.PlaceId == 16732694052 then
				loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/Fetching/_index/Fisch"))() -- Fisch
			else
				game:GetService("Players").LocalPlayer:Kick("Game not found :(\nhttps://discord.gg/uy6TP4ew7d")
			end
		]])
	end
end)
