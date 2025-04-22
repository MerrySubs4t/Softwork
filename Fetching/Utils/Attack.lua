return function()
	for _, v in next, workspace.Enemies:GetChildren() do
		if v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= tonumber(60) then
			game:GetService("ReplicatedStorage").Modules.Net["RE/RegisterAttack"]:FireServer(0)
			local args = {
				[1] = v:FindFirstChild("HumanoidRootPart"),
				[2] = {}
			}
			for _, e in next, workspace:WaitForChild("Enemies"):GetChildren() do
				if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
					table.insert(args[2], {
						[1] = e,
						[2] = e:FindFirstChild("HumanoidRootPart") or e:FindFirstChildOfClass("BasePart")
					})
				end
			end
			game:GetService("ReplicatedStorage").Modules.Net["RE/RegisterHit"]:FireServer(unpack(args))
		end
	end
end
