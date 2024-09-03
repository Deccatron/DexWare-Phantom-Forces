--// Defined

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local GameId = game.GameId

--// Tables

local Games = {
    { name = "Phantom Forces", gameid = 113491250,}
}

function Fetch(URL)
    return game:HttpGet(tostring(URL))
end

--// Rest

for _, Supported in Games do
    if Supported.gameid == GameId then
        Library:Notify("DexWare Developed By Deccatron.", 5)
        wait(5)  -- Wait for 5 seconds before the next notification
        Library:Notify("DexWare has detected you being in " .. Supported.name .. ".", 5)
        wait(5)  -- Wait for 5 seconds before the next notification
        Library:Notify("DexWare has successfully loaded.", 5)

--// vars

local players = workspace.Players

--// services

local run_service = game:GetService("RunService")
local teams = game:GetService("Teams")
local plr_service = game:GetService("Players")

--// tables

local features = {
    chams = {teamcheck = true, color = {fill = Color3.fromRGB(121, 106, 255), outline = Color3.fromRGB(119, 121, 255)}, transparency = {fill = 0, outline = 0}}
}

--// functions

function get_players()
    local entity_list = {}
    for _, teams in players:GetChildren() do
        for _, player in teams:GetChildren() do
            if player:IsA("Model") then
                entity_list[#entity_list+1] = player
            end
        end
    end
    return entity_list
end

function is_ally(player)

    if not player then
        return
    end

    local helmet = player:FindFirstChildWhichIsA("Folder"):FindFirstChildOfClass("MeshPart")

    if not helmet then
        return
    end

    if helmet.BrickColor == BrickColor.new("Black") then
        return teams.Phantoms == plr_service.LocalPlayer.Team, teams.Phantoms
    end

    return teams.Ghosts == plr_service.LocalPlayer.Team, teams.Ghosts

end

--// logic

run_service.RenderStepped:Connect(function(delta)

    for _, player in get_players() do

        if not player:FindFirstChildWhichIsA("Highlight") then

            local is_ally, team = is_ally(player)

            if (features.chams.teamcheck and not is_ally) or not features.chams.teamcheck then
                
                local highlight = Instance.new("Highlight", player)
            
                highlight.FillColor = features.chams.color.fill
                highlight.OutlineColor = features.chams.color.outline
            
                highlight.FillTransparency = features.chams.transparency.fill
                highlight.OutlineTransparency = features.chams.transparency.outline

            end
            
        end

    end

end)

        return "loaded regular"
    end
end

Library:Notify("You are not in a DexWare supported game, loading universal..")
loadstring(Fetch("https://github.com/Deccatron/Roblox-Universal-ESP/blob/main/Roblox%20Universal%20ESP/Roblox%20Universal%20ESP.lua"))()
