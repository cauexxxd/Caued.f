-- Cauezim Hub : Blox Fruits -- Script feito por caueDEV

-- Baixar Rayfield UI Library local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({ Name = "Cauezim Hub : Blox Fruits", LoadingTitle = "Cauezim Loader", LoadingSubtitle = "by caueDEV", ConfigurationSaving = { Enabled = true, FolderName = nil, FileName = "CauezimHubCfg" }, Discord = { Enabled = false, Invite = "", RememberJoins = true }, KeySystem = false })

-- Aba: Farmar local Tab = Window:CreateTab("Farmar", 4483362458) Tab:CreateToggle({ Name = "Auto Farm Level", CurrentValue = false, Callback = function(Value) if Value then print("Auto Farm ativado") -- Auto Farm lógica pode ser integrada aqui else print("Auto Farm desativado") end end })

Tab:CreateToggle({ Name = "Auto Quest", CurrentValue = false, Callback = function(Value) print("Auto Quest: ", Value) -- Lógica de Auto Quest aqui end })

Tab:CreateToggle({ Name = "Auto Haki", CurrentValue = false, Callback = function(Value) if Value then while Value do game:GetService("VirtualInputManager"):SendKeyEvent(true, "J", false, game) wait(1) end end end })

-- Aba: Teleporte local TeleportTab = Window:CreateTab("Teleporte", 4483362458) TeleportTab:CreateButton({ Name = "Teleport para Ilha Inicial", Callback = function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1033, 130, 1285) end })

TeleportTab:CreateButton({ Name = "Teleport para Segunda Ilha", Callback = function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6508, 7, -132) end })

-- Aba: Frutas local FruitTab = Window:CreateTab("Fruta/Raid", 4483362458) FruitTab:CreateButton({ Name = "Pegar Fruta Aleatória", Callback = function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits") end })

FruitTab:CreateToggle({ Name = "Notificar quando Fruta Spawnar", CurrentValue = false, Callback = function(Value) print("Aviso de fruta ativado: ", Value) -- Lógica de notificação de fruta end })

-- Aba: Visual local VisualTab = Window:CreateTab("Visual", 4483362458) VisualTab:CreateToggle({ Name = "ESP de Inimigos", CurrentValue = false, Callback = function(v) print("ESP de Inimigos: ", v) -- Lógica de ESP end })

VisualTab:CreateToggle({ Name = "Mostrar Baús", CurrentValue = false, Callback = function(v) print("Mostrar Baús: ", v) -- Lógica para mostrar baús no mapa end })

-- Aba: Status local StatTab = Window:CreateTab("Status", 4483362458) StatTab:CreateSlider({ Name = "Speed Hack", Range = {16, 120}, Increment = 1, Suffix = "Velocidade", CurrentValue = 16, Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end })

StatTab:CreateSlider({ Name = "Jump Power", Range = {50, 200}, Increment = 5, Suffix = "Salto", CurrentValue = 50, Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value end })

-- Aba: Diversos local MiscTab = Window:CreateTab("Diversos", 4483362458) MiscTab:CreateButton({ Name = "Rejoin Server", Callback = function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer) end })

MiscTab:CreateButton({ Name = "Resetar Personagem", Callback = function() game.Players.LocalPlayer.Character:BreakJoints() end })

