local function Replay()
local args = {}

game:GetService("ReplicatedStorage").Events.ExitGame:FireServer()
warn("REPLAYING")
end

local EndScreen = game.Players.LocalPlayer.PlayerGui.GameGui.EndScreen.Visible

if EndScreen == false then
warn("Game hasnt ended!")

   repeat
   wait(0.5)
   
   local EndScreen = game.Players.LocalPlayer.PlayerGui.GameGui.EndScreen.Visible
   
   until EndScreen == true
   
   Replay()
end

Replay()
