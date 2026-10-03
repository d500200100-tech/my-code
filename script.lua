-- DEEPSEEK VIP v8.5 (100% VISIBLE 3D BOX ESP UP TO 5000M, AIMBOT, SILENT, NO LAG)
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local CloseBtn = Instance.new("TextButton") 
local OpenBtn = Instance.new("TextButton")  
local ToggleAimBot = Instance.new("TextButton")
local ToggleSilent = Instance.new("TextButton")
local ToggleEsp = Instance.new("TextButton")
local FovUp = Instance.new("TextButton")
local FovDown = Instance.new("TextButton")
local DistUp = Instance.new("TextButton")
local DistDown = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

-- Компактная панель меню под мобилку
Main.Size = UDim2.new(0, 150, 0, 310)
Main.Position = UDim2.new(0.05, 0, 0.15, 0)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local MainStroke = Instance.new("UIStroke", Main)
MainStroke.Thickness = 2
MainStroke.Color = Color3.fromRGB(255, 60, 60)

-- Название меню (Можешь менять текст в кавычках на свой)
Title.Size = UDim2.new(0.75, 0, 0, 35)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "DEEPSEEK VIP"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 13
Title.Font = Enum.Font.RobotoMono
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Main

-- Крестик закрытия окна
CloseBtn.Size = UDim2.new(0, 22, 0, 22)
CloseBtn.Position = UDim2.new(1, -28, 0, 6)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.Parent = Main
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 5)

-- Кнопка открытия
OpenBtn.Size = UDim2.new(0, 80, 0, 28)
OpenBtn.Position = UDim2.new(0.02, 0, 0.15, 0) 
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
OpenBtn.Text = "Open Menu"
OpenBtn.TextColor3 = Color3.fromRGB(255, 60, 60)
OpenBtn.TextSize = 11
OpenBtn.Font = Enum.Font.RobotoMono
OpenBtn.Visible = false
OpenBtn.Active = true
OpenBtn.Draggable = true 
OpenBtn.Parent = ScreenGui
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 6)
local OpenStroke = Instance.new("UIStroke", OpenBtn)
OpenStroke.Color = Color3.fromRGB(255, 60, 60)
OpenStroke.Thickness = 1.5

-- Функция стилизации кнопок
local function StyleButton(btn, text, posY)
    btn.Size = UDim2.new(0.88, 0, 0, 28)
    btn.Position = UDim2.new(0.06, 0, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(170, 170, 180)
    btn.TextSize = 11
    btn.Font = Enum.Font.SourceSansSemibold
    btn.Parent = Main
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    Instance.new("UIStroke", btn).Color = Color3.fromRGB(40, 40, 50)
end

local function CreateControlPair(frame, btnUp, btnDown, labelText, posY)
    frame.Size = UDim2.new(0.88, 0, 0, 28)
    frame.Position = UDim2.new(0.06, 0, 0, posY)
    frame.BackgroundTransparency = 1
    frame.Parent = Main
    
    btnDown.Size = UDim2.new(0.46, 0, 1, 0)
    btnDown.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    btnDown.Text = labelText .. " -"
    btnDown.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnDown.TextSize = 11
    btnDown.Font = Enum.Font.SourceSansBold
    btnDown.Parent = frame
    Instance.new("UICorner", btnDown).CornerRadius = UDim.new(0, 5)

    btnUp.Size = UDim2.new(0.46, 0, 1, 0)
    btnUp.Position = UDim2.new(0.54, 0, 0, 0)
    btnUp.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
    btnUp.Text = labelText .. " +"
    btnUp.TextColor3 = Color3.fromRGB(255, 255, 255)
    btnUp.TextSize = 11
    btnUp.Font = Enum.Font.SourceSansBold
    btnUp.Parent = frame
    Instance.new("UICorner", btnUp).CornerRadius = UDim.new(0, 5)
end

StyleButton(ToggleAimBot, "⚡ AimBot: OFF", 45)
StyleButton(ToggleSilent, "🎯 Silent: OFF", 80)
StyleButton(ToggleEsp, "👁️ Box ESP: OFF", 115)

CreateControlPair(Instance.new("Frame"), FovUp, FovDown, "FOV", 160)
CreateControlPair(Instance.new("Frame"), DistUp, DistDown, "DIST", 195)

local InfoLabel = Instance.new("TextLabel", Main)
InfoLabel.Size = UDim2.new(0.88, 0, 0, 45)
InfoLabel.Position = UDim2.new(0.06, 0, 0, 245)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(130, 130, 140)
InfoLabel.TextSize = 10
InfoLabel.Font = Enum.Font.RobotoMono
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.Parent = Main

-- Базовые настройки
local AimBotActive = false
local SilentActive = false
local EspActive = false
local AimFOV = 150 
local MaxDistance = 2000 -- Дистанция при старте сразу 2000м, настраивается кнопками

-- Отрисовка круга FOV
local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = Color3.fromRGB(255, 60, 60)
FOVCircle.Thickness = 1.2
FOVCircle.Visible = false

local function updateMenuUI()
    ToggleAimBot.Text = AimBotActive and "⚡ AimBot: ON" or "⚡ AimBot: OFF"
    ToggleAimBot.BackgroundColor3 = AimBotActive and Color3.fromRGB(10, 60, 40) or Color3.fromRGB(25, 25, 30)
    ToggleSilent.Text = SilentActive and "🎯 Silent: ON" or "🎯 Silent: OFF"
    ToggleSilent.BackgroundColor3 = SilentActive and Color3.fromRGB(10, 60, 40) or Color3.fromRGB(25, 25, 30)
    ToggleEsp.Text = EspActive and "👁️ Box ESP: ON" or "👁️ Box ESP: OFF"
    ToggleEsp.BackgroundColor3 = EspActive and Color3.fromRGB(10, 40, 70) or Color3.fromRGB(25, 25, 30)
    InfoLabel.Text = string.format("Fov: %dpx\nDist: %dm", AimFOV, MaxDistance)
end

CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false OpenBtn.Visible = true end)
OpenBtn.MouseButton1Click:Connect(function() Main.Visible = true OpenBtn.Visible = false end)
ToggleAimBot.MouseButton1Click:Connect(function() AimBotActive = not AimBotActive updateMenuUI() end)
ToggleSilent.MouseButton1Click:Connect(function() SilentActive = not SilentActive updateMenuUI() end)
ToggleEsp.MouseButton1Click:Connect(function() EspActive = not EspActive updateMenuUI() end)

FovUp.MouseButton1Click:Connect(function() AimFOV = math.clamp(AimFOV + 25, 50, 500) updateMenuUI() end)
FovDown.MouseButton1Click:Connect(function() AimFOV = math.clamp(AimFOV - 25, 50, 500) updateMenuUI() end)
DistUp.MouseButton1Click:Connect(function() MaxDistance = math.clamp(MaxDistance + 200, 100, 5000) updateMenuUI() end)
DistDown.MouseButton1Click:Connect(function() MaxDistance = math.clamp(MaxDistance - 200, 100, 5000) updateMenuUI() end)

updateMenuUI()

local Camera = workspace.CurrentCamera
local LocalPlayer = game.Players.LocalPlayer

-- Функция поиска ближайшего игрока к прицелу
local function GetClosest()
    local closest, shortestDist = nil, math.huge
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
            local hrp = p.Character.HumanoidRootPart
            local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myHrp and (hrp.Position - myHrp.Position).Magnitude <= MaxDistance then
                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local mag = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                    if mag <= AimFOV and mag < shortestDist then shortestDist = mag; closest = p end
                end
            end
        end
    end
    return closest
end

-- Хук под баллистику Распада (Silent Aim)
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)

local method = getnamecallmethod()
    local args = {...}
    if SilentActive and method == "FireServer" and tostring(self) == "ProjectileEvent" then 
        local target = GetClosest()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            args = target.Character.Head.Position
            return oldNamecall(self, unpack(args))
        end
    end
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

-- Главный цикл работы скрипта
game:GetService("RunService").RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOVCircle.Radius = AimFOV
    FOVCircle.Visible = (AimBotActive or SilentActive)

    if AimBotActive then
        local target = GetClosest()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end

    local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    -- Отрисовка стабильного 3D ESP через BoxHandleAdornment
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            local bbg = hrp:FindFirstChild("MobileESP")
            local box = hrp:FindFirstChild("3D_ESP_Box")
            
            if EspActive and myHrp and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                local dist = (hrp.Position - myHrp.Position).Magnitude
                
                -- Дистанция проверяется в реальном времени прямо из переменной менюшки
                if dist <= MaxDistance then
                    -- Ники с метрами
                    if not bbg then
                        bbg = Instance.new("BillboardGui", hrp)

bbg.Name = "MobileESP"; bbg.Size = UDim2.new(0, 150, 0, 20); bbg.AlwaysOnTop = true; bbg.StudsOffset = Vector3.new(0, 3.5, 0)
local tl = Instance.new("TextLabel", bbg)
tl.Size = UDim2.new(1, 0, 1, 0); tl.BackgroundTransparency = 1; tl.TextColor3 = Color3.fromRGB(255, 45, 85); tl.TextSize = 12; tl.Font = Enum.Font.SourceSansBold
end
bbg.TextLabel.Text = p.Name .. " [" .. math.floor(dist) .. "m]"
-- Объёмный 3D куб вокруг персонажа (Не лагает на 5000м и виден сквозь горы)
if not box then
box = Instance.new("BoxHandleAdornment", hrp)
box.Name = "3D_ESP_Box"
box.Size = Vector3.new(4.5, 6, 4.5)
box.AlwaysOnTop = true
box.ZIndex = 5
box.Color3 = Color3.fromRGB(255, 45, 85)
box.Transparency = 0.75
box.Adornee = hrp
end
else
if bbg then bbg:Destroy() end; if box then box:Destroy() end
end
else
if bbg then bbg:Destroy() end; if box then box:Destroy() end
end
end
end
end)
CreateControlPair(Instance.new("Frame"), FovUp, FovDown, "FOV", 160)
CreateControlPair(Instance.new("Frame"), DistUp, DistDown, "DIST", 195)

local InfoLabel = Instance.new("TextLabel", Main)
InfoLabel.Size = UDim2.new(0.88, 0, 0, 45)
InfoLabel.Position = UDim2.new(0.06, 0, 0, 245)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(130, 130, 140)
InfoLabel.TextSize = 10
InfoLabel.Font = Enum.Font.RobotoMono
InfoLabel.TextXAlignment = Enum.TextXAlignment.Left
InfoLabel.Parent = Main

-- Базовые настройки
local AimBotActive = false
local SilentActive = false
local EspActive = false
local AimFOV = 150 
local MaxDistance = 2000 -- Дистанция при старте сразу 2000м, настраивается кнопками

-- Отрисовка круга FOV
local FOVCircle = Drawing.new("Circle")
FOVCircle.Color = Color3.fromRGB(255, 60, 60)
FOVCircle.Thickness = 1.2
FOVCircle.Visible = false

local function updateMenuUI()
    ToggleAimBot.Text = AimBotActive and "⚡ AimBot: ON" or "⚡ AimBot: OFF"
    ToggleAimBot.BackgroundColor3 = AimBotActive and Color3.fromRGB(10, 60, 40) or Color3.fromRGB(25, 25, 30)
    ToggleSilent.Text = SilentActive and "🎯 Silent: ON" or "🎯 Silent: OFF"
    ToggleSilent.BackgroundColor3 = SilentActive and Color3.fromRGB(10, 60, 40) or Color3.fromRGB(25, 25, 30)
    ToggleEsp.Text = EspActive and "👁️ Box ESP: ON" or "👁️ Box ESP: OFF"
    ToggleEsp.BackgroundColor3 = EspActive and Color3.fromRGB(10, 40, 70) or Color3.fromRGB(25, 25, 30)
    InfoLabel.Text = string.format("Fov: %dpx\nDist: %dm", AimFOV, MaxDistance)
end

CloseBtn.MouseButton1Click:Connect(function() Main.Visible = false OpenBtn.Visible = true end)
OpenBtn.MouseButton1Click:Connect(function() Main.Visible = true OpenBtn.Visible = false end)
ToggleAimBot.MouseButton1Click:Connect(function() AimBotActive = not AimBotActive updateMenuUI() end)
ToggleSilent.MouseButton1Click:Connect(function() SilentActive = not SilentActive updateMenuUI() end)
ToggleEsp.MouseButton1Click:Connect(function() EspActive = not EspActive updateMenuUI() end)

FovUp.MouseButton1Click:Connect(function() AimFOV = math.clamp(AimFOV + 25, 50, 500) updateMenuUI() end)
FovDown.MouseButton1Click:Connect(function() AimFOV = math.clamp(AimFOV - 25, 50, 500) updateMenuUI() end)
DistUp.MouseButton1Click:Connect(function() MaxDistance = math.clamp(MaxDistance + 200, 100, 5000) updateMenuUI() end)
DistDown.MouseButton1Click:Connect(function() MaxDistance = math.clamp(MaxDistance - 200, 100, 5000) updateMenuUI() end)

updateMenuUI()

local Camera = workspace.CurrentCamera
local LocalPlayer = game.Players.LocalPlayer

-- Функция поиска ближайшего игрока к прицелу
local function GetClosest()
    local closest, shortestDist = nil, math.huge
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
            local hrp = p.Character.HumanoidRootPart
            local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if myHrp and (hrp.Position - myHrp.Position).Magnitude <= MaxDistance then
                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local mag = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
                    if mag <= AimFOV and mag < shortestDist then shortestDist = mag; closest = p end
                end
            end
        end
    end
    return closest
end

-- Хук под баллистику Распада (Silent Aim)
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
local method = getnamecallmethod()
    local args = {...}
    if SilentActive and method == "FireServer" and tostring(self) == "ProjectileEvent" then 
        local target = GetClosest()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            args = target.Character.Head.Position
            return oldNamecall(self, unpack(args))
        end
    end
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

-- Главный цикл работы скрипта
game:GetService("RunService").RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOVCircle.Radius = AimFOV
    FOVCircle.Visible = (AimBotActive or SilentActive)

    if AimBotActive then
        local target = GetClosest()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end

    local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    -- Отрисовка стабильного 3D ESP через BoxHandleAdornment
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            local bbg = hrp:FindFirstChild("MobileESP")
            local box = hrp:FindFirstChild("3D_ESP_Box")
            
            if EspActive and myHrp and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                local dist = (hrp.Position - myHrp.Position).Magnitude
                
                -- Дистанция проверяется в реальном времени прямо из переменной менюшки
                if dist <= MaxDistance then
                    -- Ники с метрами
                    if not bbg then
                        bbg = Instance.new("BillboardGui", hrp)
bbg.Name = "MobileESP"; bbg.Size = UDim2.new(0, 150, 0, 20); bbg.AlwaysOnTop = true; bbg.StudsOffset = Vector3.new(0, 3.5, 0)
local tl = Instance.new("TextLabel", bbg)
tl.Size = UDim2.new(1, 0, 1, 0); tl.BackgroundTransparency = 1; tl.TextColor3 = Color3.fromRGB(255, 45, 85); tl.TextSize = 12; tl.Font = Enum.Font.SourceSansBold
end
bbg.TextLabel.Text = p.Name .. " [" .. math.floor(dist) .. "m]"
-- Объёмный 3D куб вокруг персонажа (Не лагает на 5000м и виден сквозь горы)
if not box then
box = Instance.new("BoxHandleAdornment", hrp)
box.Name = "3D_ESP_Box"
box.Size = Vector3.new(4.5, 6, 4.5)
box.AlwaysOnTop = true
box.ZIndex = 5
box.Color3 = Color3.fromRGB(255, 45, 85)
box.Transparency = 0.75
box.Adornee = hrp
end
else
if bbg then bbg:Destroy() end; if box then box:Destroy() end
end
else
if bbg then bbg:Destroy() end; if box then box:Destroy() end
end
end
end
end)
