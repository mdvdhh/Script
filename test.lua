local OLD_FOLDER = "CHedHub/Theme Color"

local function deleteFolder(path)
    if isfolder(path) then
        for _, item in ipairs(listfiles(path)) do
            if isfolder(item) then
                deleteFolder(item)
            else
                delfile(item)
            end
        end
        delfolder(path)
    end
end

deleteFolder(OLD_FOLDER)

local FOLDER = "Cryonix Hub"
local FILE_VERSION = FOLDER .. "/version.txt"

if not isfolder(FOLDER) then
    makefolder(FOLDER)
end

pcall(writefile, FILE_VERSION, "v1.5")

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

wait(2)

WindUI:Notify({
    Title = "Welcome to Cryonix Hub",
    Content = "Loaded Successfully!",
    Duration = 5.5, 
    Icon = "check-check",
})

local Window = WindUI:CreateWindow({
    Title = "Cryonix Hub",
    Icon = "boxes",
    Author = "by idcgj36             ",
    Folder = "Cryonix Hub",
    Size = UDim2.fromOffset(410, 235),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 420),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 175,
    Background = "rbxassetid://0",
    BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    User = {
        Enabled = false,
        Anonymous = false,
        Callback = function() end,
    },
})

Window:Tag({
    Title = "Universal",
    Color = Color3.fromHex("#00E5FF"),
    Radius = 5, 
})

Window:Tag({
    Title = "v1.5",
    Color = Color3.fromHex("#00ff00"),
    Radius = 5, 
})

Window:Tag({
    Title = "Beta",
    Color = Color3.fromHex("#FFC107"),
    Radius = 5,
})

Window:EditOpenButton({
    Title = " Open ",
    Icon = "airplay",
    CornerRadius = UDim.new(0,25),
    StrokeThickness = 2.1,
    Color = ColorSequence.new( 
        Color3.fromHex("#00FFFF"),
        Color3.fromHex("#BBFCFF")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local Tab = Window:Tab({
    Title = "Home",
    Icon = "house",
    Locked = false,
})

Window:SelectTab(1)

local Button = Tab:Button({
    Title = "Dex Explorer",
    Desc = "Dex++ Explorer",
    Locked = false,
    Callback = function()
     loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Image Dex Gui",
    Desc = "",
    Locked = false,
    Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/IRSILVER/scripts/main/robloximagedex")) ()
    end
})

local Button = Tab:Button({
    Title = "SimpleSpy",
    Desc = "",
    Locked = false,
    Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/wfrefdewwss/Discord-Custom-Status-24-7/refs/heads/main/requirements.txt"))()
    end
})

local Button = Tab:Button({
    Title = "Gui Maker Mobile",
    Desc = "",
    Locked = false,
    Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/mdvdhh/Script/refs/heads/main/GuiMaker"))()
    end
})

Tab:Divider()

local Tab = Window:Tab({
    Title = "Local Player",
    Icon = "circle-user",
    Locked = false,
})

local Section = Tab:Section({ 
    Title = "CFrame Speed/WalkSpeed",
    TextXAlignment = "Left",
    TextSize = 17,
})

local CFSpeedEnabled = false
local CFSpeedValue = 50

local CFSpeedToggle = Tab:Toggle({
    Title = "CFrame Speed",
    Desc = "Toggle",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        CFSpeedEnabled = state
    end
})

local CFSpeedSlider = Tab:Slider({
    Title = "CFrame Speed Value",
    Step = 1,
    Value = {
        Min = 1,
        Max = 180,
        Default = 15
    },
    Callback = function(value)
        CFSpeedValue = value
    end
})

task.spawn(function()
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    RunService.Heartbeat:Connect(function()
        if CFSpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local HRP = LocalPlayer.Character.HumanoidRootPart
            local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if Humanoid and Humanoid.MoveDirection.Magnitude > 0 then
                HRP.CFrame = HRP.CFrame + (Humanoid.MoveDirection * (CFSpeedValue / 10))
            end
        end
    end)
end)

local WalkSpeedEnabled = false
local WalkSpeedValue = 16 

local WalkToggle = Tab:Toggle({
    Title = "WalkSpeed",
    Desc = "Toggle",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        WalkSpeedEnabled = state
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid").WalkSpeed = state and WalkSpeedValue or 16
        end
    end
})

local WalkSlider = Tab:Slider({
    Title = "WalkSpeed Value",
    Step = 1,
    Value = {
        Min = 1,
        Max = 500,
        Default = 16
    },
    Callback = function(value)
        WalkSpeedValue = value
        if WalkSpeedEnabled then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid").WalkSpeed = WalkSpeedValue
            end
        end
    end
})

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    task.wait(0.2)
    if WalkSpeedEnabled then
        char:FindFirstChildOfClass("Humanoid").WalkSpeed = WalkSpeedValue
    end
end)

local Section = Tab:Section({ 
    Title = "TPJump/JumpPower",
    TextXAlignment = "Left",
    TextSize = 17,
})

local TPJumpEnabled = false
local TPJumpPower = 50

local TPJumpToggle = Tab:Toggle({
    Title = "TP Jump",
    Desc = "Toggle",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        TPJumpEnabled = state
    end
})

local TPJumpSlider = Tab:Slider({
    Title = "TP Jump Value",
    Step = 1,
    Value = {
        Min = 10,
        Max = 500,
        Default = 50
    },
    Callback = function(value)
        TPJumpPower = value
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function setupChar(char)
    local Humanoid = char:WaitForChild("Humanoid")
    local HRP = char:WaitForChild("HumanoidRootPart")
    Humanoid.StateChanged:Connect(function(_, newState)
        if TPJumpEnabled and newState == Enum.HumanoidStateType.Jumping then
            task.wait(0.05)
            HRP.CFrame = HRP.CFrame + Vector3.new(0, TPJumpPower, 0)
        end
    end)
end

if LocalPlayer.Character then
    setupChar(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(setupChar)

local JumpPowerEnabled = false
local JumpPowerValue = 50

local JumpPowerToggle = Tab:Toggle({
    Title = "Jump Power",
    Desc = "Toggle",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        JumpPowerEnabled = state
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid").UseJumpPower = true
            char:FindFirstChildOfClass("Humanoid").JumpPower = state and JumpPowerValue or 50
        end
    end
})

local JumpPowerSlider = Tab:Slider({
    Title = "Jump Power Value",
    Step = 1,
    Value = {
        Min = 1,
        Max = 500,
        Default = 50
    },
    Callback = function(value)
        JumpPowerValue = value
        if JumpPowerEnabled then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChildOfClass("Humanoid") then
                char:FindFirstChildOfClass("Humanoid").UseJumpPower = true
                char:FindFirstChildOfClass("Humanoid").JumpPower = JumpPowerValue
            end
        end
    end
})

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")
    task.wait(0.2)
    if JumpPowerEnabled then
        char:FindFirstChildOfClass("Humanoid").UseJumpPower = true
        char:FindFirstChildOfClass("Humanoid").JumpPower = JumpPowerValue
    end
end)

local InfJumpEnabled = false

local InfJumpToggle = Tab:Toggle({
    Title = "Infinite Jump",
    Desc = "Toggle",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        InfJumpEnabled = state
    end
})

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

local Section = Tab:Section({ 
    Title = "Gravity",
    TextXAlignment = "Left",
    TextSize = 17,
})

local GravityEnabled = false
local GravityValue = workspace.Gravity

local GravityToggle = Tab:Toggle({
    Title = "Gravity",
    Desc = "Toggle",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        GravityEnabled = state
        if state then
            workspace.Gravity = GravityValue
        else
            workspace.Gravity = 196.2
        end
    end
})

local GravitySlider = Tab:Slider({
    Title = "Gravity Value",
    Step = 1,
    Value = {
        Min = 0,
        Max = 500,
        Default = 196
    },
    Callback = function(value)
        GravityValue = value
        if GravityEnabled then
            workspace.Gravity = GravityValue
        end
    end
})

local Section = Tab:Section({ 
    Title = "Fov",
    TextXAlignment = "Left",
    TextSize = 17,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local DefaultFOV = 70 
local FOVEnabled = false
local CurrentFOV = DefaultFOV

local function UpdateFOV()
	if FOVEnabled then
		Camera.FieldOfView = CurrentFOV
	else
		Camera.FieldOfView = DefaultFOV
	end
end

workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	task.wait(0.1)
	Camera = workspace.CurrentCamera
	UpdateFOV()
end)

LocalPlayer.CharacterAdded:Connect(function()
	task.wait(1)
	UpdateFOV()
end)

local Toggle = Tab:Toggle({
	Title = "FOV",
	Desc = "Toggle",
	Icon = "",
	Type = "Toggle",
	Default = false,
	Callback = function(state)
		FOVEnabled = state
		UpdateFOV()
	end
})

local Slider = Tab:Slider({
	Title = "FOV Value",
	Step = 1,
	Value = {
		Min = 70,
		Max = 125, 
		Default = DefaultFOV,
	},
	Callback = function(value)
		CurrentFOV = value
		UpdateFOV()
	end
})

local Tab = Window:Tab({
    Title = "Visuals",
    Icon = "sparkles",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Day",
    Locked = false,
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.ClockTime = 14
    end
})

local ButtonNight = Tab:Button({
    Title = "Night",
    Locked = false,
    Callback = function()
        local Lighting = game:GetService("Lighting")
        Lighting.ClockTime = 0
    end
})

local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local Original = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient
}

local FullBrightLoop = nil

local Toggle = Tab:Toggle({
    Title = "Full Bright",
    Desc = "",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        if state then

            FullBrightLoop = RunService.RenderStepped:Connect(function()
                Lighting.Brightness = 2.2
                Lighting.ClockTime = 12
                Lighting.FogEnd = 1e10
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
            end)
        else

            if FullBrightLoop then
                FullBrightLoop:Disconnect()
                FullBrightLoop = nil
            end
            Lighting.Brightness = Original.Brightness
            Lighting.ClockTime = Original.ClockTime
            Lighting.FogEnd = Original.FogEnd
            Lighting.GlobalShadows = Original.GlobalShadows
            Lighting.OutdoorAmbient = Original.OutdoorAmbient
        end
    end
})

Tab:Divider()

local Button = Tab:Button({
    Title = "Show Ping/Fps",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/upZqKVNE/raw"))()
    end
})

Window:Divider()

local Tab = Window:Tab({
    Title = "Script",
    Icon = "code-xml",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Bacon Lock",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/asjdifeklsxdf/Roblox/refs/heads/main/Bacon%20Lock"))()
    end
})

local Button = Tab:Button({
    Title = "Aimbot",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/yerx623/Public/refs/heads/main/AimBot.lua'))()
    end
})

local Button = Tab:Button({
    Title = "Fly Gui V3",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/yerx623/LimitVersalhub/refs/heads/main/fly-guiv3.lua'))()
    end
})

local Button = Tab:Button({
    Title = "Drop Tool",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/cumcdK1O/raw"))()
    end
})

local Button = Tab:Button({
    Title = "Noclip Gui",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-NOCLIP-GUI-43727"))()
    end
})

local Button = Tab:Button({
    Title = "Anti Fling",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Antifling-30317"))()
    end
})

local Button = Tab:Button({
    Title = "Anti AFK",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://scriptblox.com/script/Universal-Script-AntiAFK-System-SOLARA-21775/raw"))()
    end
})

local Button = Tab:Button({
    Title = "Keyboard Mobile",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/aNVs9uTw/raw"))()
    end
})

local Button = Tab:Button({
    Title = "Set TP",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/idcgj36/SX/refs/heads/main/settp.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Touch Fling Gui",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LiarRise/FLN-X/refs/heads/main/README.md"))()
    end
})

local Button = Tab:Button({
    Title = "Trolling Gui",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
    end
})

local Button = Tab:Button({
    Title = "Inventory Viewer",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://pastefy.app/BWs5bgF9/raw'))()
    end
})

local Button = Tab:Button({
    Title = "Esp Player",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
    end
})

local Button = Tab:Button({
    Title = "Draw Tools",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Draw%20Tool"))()
    end
})

local Button = Tab:Button({
    Title = "Combat Gui",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yerx623/LimitVersalhub/refs/heads/main/combat.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Emote",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Invisible",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/mdvdhh/Script/refs/heads/main/invisible.txt'))()
    end
})

local Button = Tab:Button({
    Title = "Reach Gui v3",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/mdvdhh/Script/refs/heads/main/ReachGuiv3.txt'))()
    end
})

local Button = Tab:Button({
    Title = "Float",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/Qc1ZIUwO/raw", true))()
    end
})

local Button = Tab:Button({
    Title = "Auto Equip Tool",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://pastefy.app/oHguLME6/raw'))()
    end
})

local Button = Tab:Button({
    Title = "Kill Player Gui",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/idcgj36/Script/refs/heads/main/KillPlayerGui"))()
    end
})

local Button = Tab:Button({
    Title = "Teleport Gui",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/idcgj36/Script/refs/heads/main/Teleport_Gui'))()
    end
})

local Button = Tab:Button({
    Title = "Anti Lag",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RXScript/RX-GUI-Version-1/refs/heads/main/FPS%20And%20Ping%20Display"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/JoshzzAlteregooo/FpsBoosterV2/refs/heads/main/FpsBoosterV2/JoshzzPanelBooster"))()
    end
})

local Button = Tab:Button({
    Title = "R15 Fly",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/396abc/Script/refs/heads/main/MobileFly.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Shift Lock",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/idcgj36/Script/refs/heads/main/ShiftLock"))()
    end
})

local Button = Tab:Button({
    Title = "Free Cam",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Free-cam-script-35019"))()
    end
})

local Button = Tab:Button({
    Title = "Location Copy",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/TbIoJCUA/raw"))()
    end
})

local Tab = Window:Tab({
    Title = "Hub",
    Icon = "blocks",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Ghost Hub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader"))()
    end
})

local Button = Tab:Button({
    Title = "Game Hub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Game-Hub/main/loader"))()
    end
})

local Button = Tab:Button({
    Title = "Altair Hub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/MxnvA12M/raw"))()
    end
})

local Button = Tab:Button({
    Title = "Tiger X Hub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/balintTheDevX/Tiger-X-V3/main/Tiger%20X%20V3.5%20Fixed"))()
    end
})

local Button = Tab:Button({
    Title = "KRware Hub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KRWareHub/KRWare/refs/heads/main/KRWare%20Hub%20Loader.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Yunus Hub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yunus154524/YunusLo1545-HUB/refs/heads/main/YunusLo1545%20HUB"))()
    end
})

Window:Divider()

local Tab = Window:Tab({
    Title = "Admin",
    Icon = "shield",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Infinite Yield",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

local Button = Tab:Button({
    Title = "Nameless Admin",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
    end
})

local Button = Tab:Button({
    Title = "Nameless Admin v2",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Cmd",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/cmd/main/main.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Reviz Admin",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pa1ntex/reviz-admin-v2-script-FE/refs/heads/main/Reviz%20admin%20v2%20FE"))()
    end
})

local Tab = Window:Tab({
    Title = "Esp",
    Icon = "radar",
    Locked = false,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local highlights = {}
local enabled = false

local function applyHighlight(plr)
    if not enabled or plr == LocalPlayer then return end
    if not plr.Character or highlights[plr] then return end
    local h = Instance.new("Highlight")
    h.Adornee = plr.Character
    h.Parent = workspace
    h.FillTransparency = 0.5
    h.OutlineTransparency = 0
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    local tc = plr.TeamColor
    if tc then
        h.FillColor = tc.Color
        h.OutlineColor = tc.Color
    else
        h.FillColor = Color3.new(1,1,1)
        h.OutlineColor = Color3.new(0,0,0)
    end
    highlights[plr] = h
end

local function removeHighlight(plr)
    if highlights[plr] then
        highlights[plr]:Destroy()
        highlights[plr] = nil
    end
end

local function setupPlayer(plr)
    plr.CharacterAdded:Connect(function()
        task.wait(0.1)
        if enabled then
            removeHighlight(plr)
            applyHighlight(plr)
        end
    end)
    plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
        if highlights[plr] and plr.TeamColor then
            highlights[plr].FillColor = plr.TeamColor.Color
            highlights[plr].OutlineColor = plr.TeamColor.Color
        end
    end)
    if plr.Character then
        applyHighlight(plr)
    end
end

local function enableAll()
    enabled = true
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            setupPlayer(plr)
            applyHighlight(plr)
        end
    end
    Players.PlayerAdded:Connect(function(plr)
        if enabled then
            setupPlayer(plr)
        end
    end)
    Players.PlayerRemoving:Connect(function(plr)
        removeHighlight(plr)
    end)
end

local function disableAll()
    enabled = false
    for plr,h in pairs(highlights) do
        if h then h:Destroy() end
    end
    highlights = {}
end

local Toggle = Tab:Toggle({
    Title = "Chams ESP",
    Desc = "",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        if state then
            enableAll()
        else
            disableAll()
        end
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local names = {}
local enabled = false

local function createName(plr)
    if plr == LocalPlayer then return end
    if names[plr] then return end

    local text = Drawing.new("Text")
    text.Size = 15
    text.Center = true
    text.Outline = true
    text.Font = 2
    text.Visible = false
    text.Text = plr.Name

    names[plr] = text
end

local function removeName(plr)
    if names[plr] then
        names[plr]:Remove()
        names[plr] = nil
    end
end

local function updateNames()
    if not enabled then return end
    for plr, text in pairs(names) do
        if plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            local head = plr.Character.Head
            local pos, vis = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 2, 0))
            if vis then
                text.Position = Vector2.new(pos.X, pos.Y)
                text.Text = plr.Name
                if plr.TeamColor then
                    text.Color = plr.TeamColor.Color
                else
                    text.Color = Color3.new(1,1,1)
                end
                text.Visible = true
            else
                text.Visible = false
            end
        else
            text.Visible = false
        end
    end
end

local function enableAll()
    enabled = true
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            createName(plr)
        end
    end
    Players.PlayerAdded:Connect(function(plr)
        if enabled then
            createName(plr)
        end
    end)
    Players.PlayerRemoving:Connect(function(plr)
        removeName(plr)
    end)
    game:GetService("RunService").RenderStepped:Connect(updateNames)
end

local function disableAll()
    enabled = false
    for plr, text in pairs(names) do
        if text then text:Remove() end
    end
    names = {}
end

local Toggle = Tab:Toggle({
    Title = "Name ESP",
    Desc = "",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        if state then
            enableAll()
        else
            disableAll()
        end
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local tracers = {}
local enabled = false

local function createTracer(plr)
    if plr == LocalPlayer then return end
    if tracers[plr] then return end

    local line = Drawing.new("Line")
    line.Thickness = 2
    line.Visible = false

    tracers[plr] = line
end

local function removeTracer(plr)
    if tracers[plr] then
        tracers[plr]:Remove()
        tracers[plr] = nil
    end
end

local function updateTracers()
    if not enabled then return end
    for plr, line in pairs(tracers) do
        if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            local hrp = plr.Character.HumanoidRootPart
            local pos, vis = Camera:WorldToViewportPoint(hrp.Position)
            if vis then
                local screenSize = Camera.ViewportSize
                local bottom = Vector2.new(screenSize.X / 2, screenSize.Y)
                line.From = bottom
                line.To = Vector2.new(pos.X, pos.Y)
                if plr.TeamColor then
                    line.Color = plr.TeamColor.Color
                else
                    line.Color = Color3.new(1,1,1)
                end
                line.Visible = true
            else
                line.Visible = false
            end
        else
            line.Visible = false
        end
    end
end

local function enableAll()
    enabled = true
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            createTracer(plr)
        end
    end
    Players.PlayerAdded:Connect(function(plr)
        if enabled then
            createTracer(plr)
        end
    end)
    Players.PlayerRemoving:Connect(function(plr)
        removeTracer(plr)
    end)
    game:GetService("RunService").RenderStepped:Connect(updateTracers)
end

local function disableAll()
    enabled = false
    for plr, line in pairs(tracers) do
        if line then line:Remove() end
    end
    tracers = {}
end

local Toggle = Tab:Toggle({
    Title = "Tracer ESP",
    Desc = "",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        if state then
            enableAll()
        else
            disableAll()
        end
    end
})

local Players = game:GetService("Players")
local enabled = false

local function ApplyESP(v)
    if v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
        local hum = v.Character:FindFirstChildOfClass("Humanoid")
        hum.NameDisplayDistance = 9e9
        hum.NameOcclusion = Enum.NameOcclusion.NoOcclusion
        hum.HealthDisplayDistance = 9e9
        hum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn
    end
end

local function RemoveESP(v)
    if v.Character and v.Character:FindFirstChildOfClass("Humanoid") then
        local hum = v.Character:FindFirstChildOfClass("Humanoid")
        hum.NameDisplayDistance = 0
        hum.HealthDisplayDistance = 0
    end
end

local function enableAll()
    enabled = true
    for _,v in pairs(Players:GetPlayers()) do
        ApplyESP(v)
        v.CharacterAdded:Connect(function()
            task.wait(0.3)
            if enabled then ApplyESP(v) end
        end)
    end
    Players.PlayerAdded:Connect(function(v)
        if enabled then
            ApplyESP(v)
            v.CharacterAdded:Connect(function()
                task.wait(0.3)
                if enabled then ApplyESP(v) end
            end)
        end
    end)
end

local function disableAll()
    enabled = false
    for _,v in pairs(Players:GetPlayers()) do
        RemoveESP(v)
    end
end

local Toggle = Tab:Toggle({
    Title = "Roblox ESP",
    Desc = "",
    Icon = "",
    Type = "Toggle",
    Default = false,
    Callback = function(state)
        if state then
            enableAll()
        else
            disableAll()
        end
    end
})

local Tab = Window:Tab({
    Title = "Info",
    Icon = "info",
    Locked = false,
})

local Players = game:GetService("Players")

local PlayerInServer = Tab:Paragraph({
    Title = "Player in Server: " .. #Players:GetPlayers()
})

local function UpdatePlayerCount()
    PlayerInServer:SetTitle("Player in Server: " .. #Players:GetPlayers())
end

Players.PlayerAdded:Connect(UpdatePlayerCount)
Players.PlayerRemoving:Connect(UpdatePlayerCount)

local Display = Tab:Paragraph({
    Title = "Display: " .. game.Players.LocalPlayer.DisplayName
})

local Username = Tab:Paragraph({
    Title = "Username: " .. game.Players.LocalPlayer.Name
})

local AccountAge = Tab:Paragraph({
    Title = "Account Age: " .. game.Players.LocalPlayer.AccountAge .. " days"
})

local Executor = Tab:Paragraph({
    Title = "Executor: " .. identifyexecutor()
})

local GameName = Tab:Paragraph({
    Title = "Game Name: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
})

local GameID = Tab:Paragraph({
    Title = "Game ID: " .. game.PlaceId
})

Window:Divider()

local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local FOLDER = "Cryonix Hub"
local THEME_FOLDER = FOLDER .. "/UI Settings"
local CONFIG_FILE = THEME_FOLDER .. "/ThemeColor.json"

if not isfolder(FOLDER) then
    makefolder(FOLDER)
end
if not isfolder(THEME_FOLDER) then
    makefolder(THEME_FOLDER)
end

local DefaultTheme = {
    Outline = "#FFFFFF",
    Text = "#FFFFFF",
    Background = "#101010",
    Button = "#52525b",
    Icon = "#a1a1aa"
}

local ThemeConfig
if isfile(CONFIG_FILE) then
    local ok, data = pcall(function()
        return HttpService:JSONDecode(readfile(CONFIG_FILE))
    end)
    if ok and type(data) == "table" then
        ThemeConfig = data
    else
        ThemeConfig = DefaultTheme
        writefile(CONFIG_FILE, HttpService:JSONEncode(DefaultTheme))
    end
else
    ThemeConfig = DefaultTheme
    writefile(CONFIG_FILE, HttpService:JSONEncode(DefaultTheme))
end

local function SaveTheme()
    writefile(CONFIG_FILE, HttpService:JSONEncode(ThemeConfig))
end

local themeFolder = ReplicatedStorage:FindFirstChild("Cryonix_ThemeVals")
if not themeFolder then
    themeFolder = Instance.new("Folder")
    themeFolder.Name = "Cryonix_ThemeVals"
    themeFolder.Parent = ReplicatedStorage
end

local function getOrMakeColorValue(name, default)
    local cv = themeFolder:FindFirstChild(name)
    if not cv then
        cv = Instance.new("Color3Value")
        cv.Name = name
        cv.Value = default
        cv.Parent = themeFolder
    end
    return cv
end

local function fromHex(hex)
    return Color3.fromHex(hex)
end

local Values = {
    Outline = getOrMakeColorValue("Outline", fromHex(ThemeConfig.Outline)),
    Text = getOrMakeColorValue("Text", fromHex(ThemeConfig.Text)),
    Background = getOrMakeColorValue("Background", fromHex(ThemeConfig.Background)),
    Button = getOrMakeColorValue("Button", fromHex(ThemeConfig.Button)),
    Icon = getOrMakeColorValue("Icon", fromHex(ThemeConfig.Icon))
}

local function ApplyThemeFromValues()
    WindUI:AddTheme({
        Name = "My Theme",
        Accent = Color3.fromHex("#18181b"),
        Dialog = Color3.fromHex("#161616"),
        Outline = Values.Outline.Value,
        Text = Values.Text.Value,
        Placeholder = Color3.fromHex("#7a7a7a"),
        Background = Values.Background.Value,
        Button = Values.Button.Value,
        Icon = Values.Icon.Value
    })
    WindUI:SetTheme("My Theme")
end

for _,v in pairs(Values) do
    v.Changed:Connect(ApplyThemeFromValues)
end

ApplyThemeFromValues()

local Tab = Window:Tab({
    Title = "UI Settings",
    Icon = "settings",
    Locked = false,
})

Tab:Slider({
    Title = "Background Transparency",
    Value = { 
        Min = 0,
        Max = 1,
        Default = WindUI.TransparencyValue or 0.2,
    },
    Step = 0.1,
    Callback = function(value)
        WindUI.TransparencyValue = tonumber(value)
        Window:ToggleTransparency(tonumber(value) > 0)
    end
})

Tab:Section({
    Title = "Theme Color Settings",
    TextXAlignment = "Left",
    TextSize = 17,
})

local function TweenColorValue(colorValue, newColor)
    local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(colorValue, tweenInfo, {Value = newColor})
    tween:Play()
end

Tab:Colorpicker({
    Title = "Outline",
    Desc = "Select color for Outline",
    Default = Values.Outline.Value,
    Callback = function(color)
        ThemeConfig.Outline = color:ToHex()
        SaveTheme()
        TweenColorValue(Values.Outline, color)
    end
})

Tab:Colorpicker({
    Title = "Text",
    Desc = "Select color for Text",
    Default = Values.Text.Value,
    Callback = function(color)
        ThemeConfig.Text = color:ToHex()
        SaveTheme()
        TweenColorValue(Values.Text, color)
    end
})

Tab:Colorpicker({
    Title = "Background",
    Desc = "Select color for Background",
    Default = Values.Background.Value,
    Callback = function(color)
        ThemeConfig.Background = color:ToHex()
        SaveTheme()
        TweenColorValue(Values.Background, color)
    end
})

Tab:Colorpicker({
    Title = "Button",
    Desc = "Select color for Buttons",
    Default = Values.Button.Value,
    Callback = function(color)
        ThemeConfig.Button = color:ToHex()
        SaveTheme()
        TweenColorValue(Values.Button, color)
    end
})

Tab:Colorpicker({
    Title = "Icon",
    Desc = "Select color for Icons",
    Default = Values.Icon.Value,
    Callback = function(color)
        ThemeConfig.Icon = color:ToHex()
        SaveTheme()
        TweenColorValue(Values.Icon, color)
    end
})

Tab:Button({
    Title = "Reset Theme Colors",
    Desc = "Reset to default theme colors",
    Icon = "rotate-ccw",
    Callback = function()
        if isfile(CONFIG_FILE) then
            delfile(CONFIG_FILE)
        end
        ThemeConfig = DefaultTheme
        writefile(CONFIG_FILE, HttpService:JSONEncode(DefaultTheme))
        for k, v in pairs(DefaultTheme) do
            TweenColorValue(Values[k], fromHex(v))
        end
    end
})