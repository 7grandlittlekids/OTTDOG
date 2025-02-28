if(game.PlaceId == 118688242561353) then
local function teleportToPosition()
    -- วาร์ปตัวละครไปยังตำแหน่งที่กำหนด
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-280.405029, 633.415466, 724.407288, -0.0104775475, 1.09676769e-07, 0.999945104, 8.43243608e-09, 1, -1.09594438e-07, -0.999945104, 7.28369232e-09, -0.0104775475)    
end

local function handleElevator()
    local statusText = workspace.Elevator21.Screen.StatusGui.Title.Text

    if statusText == "2/4" then
        -- ส่งคำสั่งไปยังเซิร์ฟเวอร์
        local args = {
            [1] = 543
        }
        game:GetService("ReplicatedStorage").Elevator:FireServer(unpack(args))

        -- รอจนกว่าสถานะจะเปลี่ยนเป็น "0/4"
        repeat
            wait(0.1) -- รอเล็กน้อยเพื่อหลีกเลี่ยงการใช้ทรัพยากรมากเกินไป
            statusText = workspace.Elevator21.Screen.StatusGui.Title.Text
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
