-- Cauezim Hub : Blox Fruits -- Script atualizado por caueDEV

-- Carregar UI Rayfield
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()

local Window = Rayfield:CreateWindow({
    Name = "Cauezim Hub : Blox Fruits",
    LoadingTitle = "Cauezim Loader",
    LoadingSubtitle = "by caueDEV",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "CauezimHubCfg"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = true
    },
    KeySystem = false
})

-- Aba: Farmar
local FarmTab = Window:CreateTab("Farmar", 4483362458)

FarmTab:CreateToggle({
    Name = "Auto Farm Level",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().AutoFarm = Value
        while getgenv().AutoFarm and task.wait() do
            local player = game.Players.LocalPlayer
            local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            local enemy = workspace.Enemies:FindFirstChildWhichIsA("Model")
            if enemy and humanoidRootPart then
                humanoidRootPart.CFrame = enemy.HumanoidRootPart.CFrame * CFrame.new(0, 5, 0)
                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Z", false, game)
            end
        end
    end
})

FarmTab:CreateToggle({
    Name = "Auto Quest",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BanditQuest1", 1)
        end
    end
})

FarmTab:CreateToggle({
    Name = "Auto Haki",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().AutoHaki = Value
        while getgenv().AutoHaki and task.wait(1) do
            game:GetService("VirtualInputManager"):SendKeyEvent(true, "J", false, game)
        end
    end
})

-- Aba: Teleporte
local TeleportTab = Window:CreateTab("Teleporte", 4483362458)

TeleportTab:CreateButton({
    Name = "Ilha Inicial",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1033, 130, 1285)
    end
})

TeleportTab:CreateButton({
    Name = "Segunda Ilha",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6508, 7, -132)
    end
})

-- Aba: Frutas/Raids
local FruitTab = Window:CreateTab("Fruta/Raid", 4483362458)

FruitTab:CreateButton({
    Name = "Pegar Fruta Aleatória",
    Callback = function()
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits")
    end
})

FruitTab:CreateToggle({
    Name = "Aviso de fruta",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().FrutaNotificacao = Value
        while getgenv().FrutaNotificacao and task.wait(10) do
            for _,v in pairs(workspace:GetChildren()) do
                if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                    Rayfield:Notify({Title = "Fruta encontrada!", Content = v.Name.." spawnou no mapa!", Duration = 5})
                end
            end
        end
    end
})

-- Aba: Visual
local VisualTab = Window:CreateTab("Visual", 4483362458)

VisualTab:CreateToggle({
    Name = "ESP de Inimigos",
    CurrentValue = false,
    Callback = function(Value)
        -- Aqui você pode integrar um ESP externo como Kiriot ESP
        print("ESP ativado:", Value)
    end
})

VisualTab:CreateToggle({
    Name = "Mostrar Baús",
    CurrentValue = false,
    Callback = function(Value)
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("MeshPart") and v.Name == "Chest1" then
                v.Highlight = Value
            end
        end
    end
})

-- Aba: Status
local StatTab = Window:CreateTab("Status", 4483362458)

StatTab:CreateSlider({
    Name = "Velocidade",
    Range = {16, 120},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = 16,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

StatTab:CreateSlider({
    Name = "Pulo",
    Range = {50, 200},
    Increment = 5,
    Suffix = "JumpPower",
    CurrentValue = 50,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

-- Aba: Diversos
local MiscTab = Window:CreateTab("Diversos", 4483362458)

MiscTab:CreateButton({
    Name = "Reentrar no Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

MiscTab:CreateButton({
    Name = "Resetar Personagem",
    Callback = function()
        game.Players.LocalPlayer.Character:BreakJoints()
    end
})
