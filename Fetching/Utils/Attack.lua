local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Enemies = workspace:WaitForChild("Enemies")
local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")

return function()
	for _, v in ipairs(Enemies:GetChildren()) do
		local hrp = v:FindFirstChild("HumanoidRootPart")
		local hum = v:FindFirstChild("Humanoid")
		if hum and hum.Health > 0 and hrp and (hrp.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 60 then
			Net["RE/RegisterAttack"]:FireServer(0)

			local args = {
				[1] = hrp,
				[2] = {}
			}

			for _, e in ipairs(Enemies:GetChildren()) do
				if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
					table.insert(args[2], {
						[1] = e,
						[2] = e:FindFirstChild("HumanoidRootPart") or e:FindFirstChildOfClass("BasePart")
					})
				end
			end

			Net["RE/RegisterHit"]:FireServer(unpack(args))
		end
	end
end
