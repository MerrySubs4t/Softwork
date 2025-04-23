local PLACE_SCRIPTS = {
    [2753915549] = "Bloxfruits",
    [4442272183] = "Bloxfruits",
    [7449423635] = "Bloxfruits",
    [16732694052] = "Fisch",
    [72907489978215] = "Fisch",
}

function LoadGame()
    local scriptName = PLACE_SCRIPTS[game.PlaceId]
    if scriptName then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/Fetching/_index/"..scriptName))()
    else
        game.Players.LocalPlayer:Kick("Game not supported\nhttps://discord.gg/uy6TP4ew7d")
    end
end

function translate(en, th)
    return (_G.Thailand or getgenv().Thai or _G.Thai) and th or en
end

Dialog = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerrySubs4t/Softwork/refs/heads/main/Fetching/Framework/dialog5555"))()
if isfolder("Fetching'Script") then
    Dialog:Create({
        title = "Fetching's Script",
        desc = translate(
            '"Settings Log File" detected. Delete it?',
            'ตรวจพบไฟล์การตั้งค่า คุณต้องการลบหรือไม่?'
        ),
        titleb1 = translate("Remove", "ลบ"),
        titleb2 = translate("Ignore", "ไม่สนใจ"),
        UpperCallback = function()
            delfolder("Fetching'Script")
            wait(1)
            LoadGame()
        end,
        LowerCallback = LoadGame,
    })
else
    LoadGame()
end
