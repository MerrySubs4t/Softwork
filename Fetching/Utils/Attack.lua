

local env = (getgenv or getrenv or getfenv)()
local rs = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local client = players.LocalPlayer
local modules = rs:WaitForChild("Modules")
local net = modules:WaitForChild("Net")
local charFolder = workspace:WaitForChild("Characters")
local enemyFolder = workspace:WaitForChild("Enemies")

local Module = {
	AttackCooldown = tick()
}
local CachedChars = {}

function Module.IsAlive(Char: Model?): boolean
	if not Char then return nil end
	local Hum = CachedChars[Char] or Char:FindFirstChildOfClass("Humanoid")
	if Hum then
		CachedChars[Char] = Hum
		return Hum.Health > 0
	end
	return false
end

local HIT_FUNCTION; task.defer(function()
	local PlayerScripts = client:WaitForChild("PlayerScripts")
	local LocalScript = PlayerScripts:FindFirstChildOfClass("LocalScript")

	while not LocalScript do
		client.PlayerScripts.ChildAdded:Wait()
		LocalScript = PlayerScripts:FindFirstChildOfClass("LocalScript")
	end

	if getsenv then
		local Success, ScriptEnv = pcall(getsenv, LocalScript)

		if Success and ScriptEnv then
			HIT_FUNCTION = ScriptEnv._G.SendHitsToServer
		end
	end
end)

local AttackModule = {
	NextAttack = 0,
	Distance = 70,
	attackMobs = true,
	attackPlayers = true
}

local RegisterAttack = net:WaitForChild("RE/RegisterAttack")
local RegisterHit = net:WaitForChild("RE/RegisterHit")

function AttackModule:AttackEnemy(EnemyHead, Table)
	if EnemyHead and client:DistanceFromCharacter(EnemyHead.Position) < self.Distance then
		if HIT_FUNCTION then 
			HIT_FUNCTION(EnemyHead, Table or {})
		else
			RegisterHit:FireServer(EnemyHead, Table or {})
		end
		RegisterAttack:FireServer(0)
	end
end

function AttackModule:AttackNearest()
	local args = {nil, {}}
	for _, Enemy in ipairs(enemyFolder:GetChildren()) do
		local humanoidPart = Enemy:FindFirstChild("HumanoidRootPart")
		if humanoidPart and client:DistanceFromCharacter(humanoidPart.Position) < self.Distance then
			local upperHead = Enemy:FindFirstChild("HumanoidRootPart")
			if not args[1] then
				args[1] = upperHead
			else
				table.insert(args[2], {Enemy, upperHead})
			end
		end
	end

	self:AttackEnemy(unpack(args))

	for _, Char in ipairs(charFolder:GetChildren()) do
		if Char ~= client.Character then
			self:AttackEnemy(Char:FindFirstChild("HumanoidRootPart"))
		end
	end
end

function AttackModule:BladeHits()
	self:AttackNearest()
end

return function() AttackModule:BladeHits() end
