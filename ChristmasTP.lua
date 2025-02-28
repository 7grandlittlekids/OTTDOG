if(game.PlaceId == 118688242561353) then
local function teleportToPosition()
    -- วาร์ปตัวละครไปยังตำแหน่งที่กำหนด
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1260.81238, 596.298462, 897.356873)
end

local function handleElevator()
    local statusText = workspace.Elevator8.Screen.StatusGui.Title.Text

    if statusText == "2/4" then
        -- ส่งคำสั่งไปยังเซิร์ฟเวอร์
        local args = {
            [1] = 8
        }
        game:GetService("ReplicatedStorage").Elevator:FireServer(unpack(args))

        -- รอจนกว่าสถานะจะเปลี่ยนเป็น "0/4"
        repeat
            wait(0.1) -- รอเล็กน้อยเพื่อหลีกเลี่ยงการใช้ทรัพยากรมากเกินไป
            statusText = workspace.Elevator8.Screen.StatusGui.Title.Text
        until statusText == "0/4"

        -- วาร์ปตัวละครไปยังตำแหน่งเดิม
        teleportToPosition()
    end
end

-- เริ่มต้น: วาร์ปไปที่ตำแหน่งทันที
teleportToPosition()

-- ตรวจสอบสถานะลิฟต์ทุก ๆ เฟรม
game:GetService("RunService").Heartbeat:Connect(handleElevator)
end
