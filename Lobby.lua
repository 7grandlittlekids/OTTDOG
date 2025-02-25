local function teleportToPosition()
    -- วาร์ปตัวละครไปยังตำแหน่งที่กำหนด
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-507.979828, 632.941223, 898.8797, 0.999979019, 2.53350887e-08, -0.00647411682, -2.4822512e-08, 1, 7.92536667e-08, 0.00647411682, -7.90913006e-08, 0.999979019)
end

local function handleElevator()
    local statusText = workspace.Elevator14.Screen.StatusGui.Title.Text

    if statusText == "2/4" then
        -- ส่งคำสั่งไปยังเซิร์ฟเวอร์
        local args = {
            [1] = 14
        }
        game:GetService("ReplicatedStorage").Elevator:FireServer(unpack(args))

        -- รอจนกว่าสถานะจะเปลี่ยนเป็น "0/4"
        repeat
            wait(0.1) -- รอเล็กน้อยเพื่อหลีกเลี่ยงการใช้ทรัพยากรมากเกินไป
            statusText = workspace.Elevator14.Screen.StatusGui.Title.Text
        until statusText == "0/4"

        -- วาร์ปตัวละครไปยังตำแหน่งเดิม
        teleportToPosition()
    end
end

-- เริ่มต้น: วาร์ปไปที่ตำแหน่งทันที
teleportToPosition()

-- ตรวจสอบสถานะลิฟต์ทุก ๆ เฟรม
game:GetService("RunService").Heartbeat:Connect(handleElevator)
