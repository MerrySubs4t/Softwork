local v21 = game.Players.LocalPlayer
function FindEnemiesInRange(v223, v224)
	local v225 = (v21.Character or v21.CharacterAdded:Wait()):GetPivot().Position
	local v226 = nil
	for v471, v472 in ipairs(v224) do
		if (not v472:GetAttribute("IsBoat") and v472:FindFirstChildOfClass("Humanoid") and (v472.Humanoid.Health > 0)) then
			local v671 = v472:FindFirstChild("Head")
			if (v671 and ((v225 - v671.Position).Magnitude <= 60)) then
				if (v472 ~= v21.Character) then
					table.insert(v223, {
						v472,
						v671
					})
					v226 = v671
				end
			end
		end
	end
	for v473, v474 in ipairs(game.Players:GetPlayers()) do
		if (v474.Character and (v474 ~= v21)) then
			local v672 = v474.Character:FindFirstChild("Head")
			if (v672 and ((v225 - v672.Position).Magnitude <= 60)) then
				table.insert(v223, {
					v474.Character,
					v672
				})
				v226 = v672
			end
		end
	end
	return v226
end
function GetEquippedTool()
	local v227 = v21.Character
	if not v227 then
		return nil
	end
	for v475, v476 in ipairs(v227:GetChildren()) do
		if v476:IsA("Tool") then
			return v476
		end
	end
	return nil
end
return function()
	local v228 = {}
	local v229 = game:GetService("Workspace").Enemies:GetChildren()
	local v230 = FindEnemiesInRange(v228, v229)
	if not v230 then
		return
	end
	local v231 = GetEquippedTool()
	if not v231 then
		return
	end
	pcall(function()
		if (# v228 > 0) then
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack"):FireServer(1e-999)
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(v230, v228)
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(v230, v228)
			game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit"):FireServer(v230, v228)
		else
			task.wait(1e-999)
		end
	end)
end
