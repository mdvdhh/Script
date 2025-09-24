-- Reach Gui v5 (chuyển từ V3 -> V5 layout, giữ chức năng V3)
-- Sử dụng PlayerGui (an toàn hơn CoreGui)
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Remove existing with same name
for _,c in pairs(PlayerGui:GetChildren()) do
    if c.Name == "Reach Gui" or c.Name == "Reach gui" then
        c:Destroy()
    end
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Reach Gui"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame (from V5)
local Frame = Instance.new("Frame")
Frame.Name = "Reach Frame"
Frame.Parent = ScreenGui
Frame.BorderSizePixel = 0
Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Frame.Size = UDim2.new(0, 242, 0, 194)
Frame.Position = UDim2.new(0, 300, 0, 28)
Frame.Active = true
-- legacy draggable property (kept for compatibility)
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = Frame

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "title"
Title.Parent = Frame
Title.TextWrapped = true
Title.BorderSizePixel = 0
Title.TextScaled = true
Title.BackgroundColor3 = Color3.fromRGB(145, 145, 145)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 110, 0, 22)
Title.Text = "Reach Gui v5"
Title.Position = UDim2.new(0, 11, 0, 6)

-- Left column buttons (Home, Reach, Remove gui) adapted to v5
local function makeLeftBtn(name, posY, text, bg)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = Frame
    btn.BackgroundColor3 = bg or Color3.fromRGB(0,0,0)
    btn.BorderSizePixel = 0
    btn.Size = UDim2.new(0, 66, 0, 26)
    btn.Position = UDim2.new(0, 6, 0, posY)
    btn.Font = Enum.Font.SourceSans
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.TextScaled = true
    return btn
end

local HomeBtn = makeLeftBtn("HomeBtn", 36, "Home", Color3.fromRGB(0,0,0))
local ReachBtn = makeLeftBtn("ReachBtn", 68, "Reach", Color3.fromRGB(0,0,0))
local RemoveBtn = makeLeftBtn("RemoveBtn", 100, "Remove gui", Color3.fromRGB(255,0,0))

-- Content frames: Home panel and Reach panel (like V3 ho & Reacch)
local HomeFrame = Instance.new("Frame")
HomeFrame.Name = "HomeFrame"
HomeFrame.Parent = Frame
HomeFrame.BackgroundColor3 = Color3.fromRGB(136,136,136)
HomeFrame.Size = UDim2.new(0, 157, 0, 150)
HomeFrame.Position = UDim2.new(0, 80, 0, 30)

local ReachFrame = Instance.new("Frame")
ReachFrame.Name = "ReachFrame"
ReachFrame.Parent = Frame
ReachFrame.BackgroundColor3 = Color3.fromRGB(136,136,136)
ReachFrame.Size = HomeFrame.Size
ReachFrame.Position = HomeFrame.Position
ReachFrame.Visible = false

-- Home content (credits / rejoin)
local Good = Instance.new("TextLabel")
Good.Parent = HomeFrame
Good.BackgroundTransparency = 1
Good.Size = UDim2.new(1,0,0,32)
Good.Position = UDim2.new(0,0,0,6)
Good.Font = Enum.Font.SourceSans
Good.Text = "Thanks for using Reach Gui v5 (ported from v3) :)"
Good.TextColor3 = Color3.fromRGB(255,255,255)
Good.TextScaled = true

local NameLabel = Instance.new("TextLabel")
NameLabel.Parent = HomeFrame
NameLabel.BackgroundTransparency = 1
NameLabel.Position = UDim2.new(0,0,0,44)
NameLabel.Size = UDim2.new(1,0,0,26)
NameLabel.Font = Enum.Font.SourceSans
pcall(function()
    local camSub = workspace.CurrentCamera and workspace.CurrentCamera.CameraSubject
    if camSub and camSub.Parent and Players:GetPlayerFromCharacter(camSub.Parent) then
        NameLabel.Text = Players:GetPlayerFromCharacter(camSub.Parent).Name
    else
        NameLabel.Text = ""
    end
end)
NameLabel.TextColor3 = Color3.fromRGB(255,255,255)
NameLabel.TextScaled = true

local RejoinBtn = Instance.new("TextButton")
RejoinBtn.Parent = HomeFrame
RejoinBtn.BackgroundColor3 = Color3.fromRGB(136,136,136)
RejoinBtn.BorderSizePixel = 0
RejoinBtn.Position = UDim2.new(0.08,0,0,78)
RejoinBtn.Size = UDim2.new(0,140,0,40)
RejoinBtn.Font = Enum.Font.SourceSans
RejoinBtn.Text = "Rejoin"
RejoinBtn.TextColor3 = Color3.fromRGB(255,255,255)
RejoinBtn.TextScaled = true
RejoinBtn.MouseButton1Click:Connect(function()
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

local Link = Instance.new("TextLabel")
Link.Parent = HomeFrame
Link.BackgroundTransparency = 1
Link.Position = UDim2.new(0,0,0,124)
Link.Size = UDim2.new(1,0,0,18)
Link.Font = Enum.Font.SourceSans
Link.Text = "YT link: https://Youtube.com/c/Warriorrober"
Link.TextColor3 = Color3.fromRGB(255,255,255)
Link.TextScaled = false
Link.TextWrapped = true

local Cred = Instance.new("TextLabel")
Cred.Parent = HomeFrame
Cred.BackgroundTransparency = 1
Cred.Position = UDim2.new(0,0,0,108)
Cred.Size = UDim2.new(1,0,0,18)
Cred.Font = Enum.Font.SourceSans
Cred.Text = "Script made by WarriorRoberr"
Cred.TextColor3 = Color3.fromRGB(255,255,255)
Cred.TextScaled = false

-- Reach content (inputs + actions) mapped to V5 TextBoxes
local LabelX = Instance.new("TextLabel")
LabelX.Parent = ReachFrame
LabelX.Text = "X"
LabelX.Size = UDim2.new(0,30,0,18)
LabelX.Position = UDim2.new(0,8,0,8)
LabelX.BackgroundTransparency = 1
LabelX.TextColor3 = Color3.fromRGB(255,255,255)

local TextBoxX = Instance.new("TextBox")
TextBoxX.Parent = ReachFrame
TextBoxX.Name = "X"
TextBoxX.PlaceholderText = "X"
TextBoxX.Size = UDim2.new(0,56,0,45)
TextBoxX.Position = UDim2.new(0,8,0,28)
TextBoxX.Text = "4"
TextBoxX.TextScaled = true

local TextBoxY = Instance.new("TextBox")
TextBoxY.Parent = ReachFrame
TextBoxY.Name = "Y"
TextBoxY.PlaceholderText = "Y"
TextBoxY.Size = UDim2.new(0,56,0,45)
TextBoxY.Position = UDim2.new(0,74,0,28)
TextBoxY.Text = "4"
TextBoxY.TextScaled = true

local TextBoxZ = Instance.new("TextBox")
TextBoxZ.Parent = ReachFrame
TextBoxZ.Name = "Z"
TextBoxZ.PlaceholderText = "Z"
TextBoxZ.Size = UDim2.new(0,56,0,45)
TextBoxZ.Position = UDim2.new(0,140,0,28)
TextBoxZ.Text = "4"
TextBoxZ.TextScaled = true

local ColorBoxR = Instance.new("TextBox")
ColorBoxR.Parent = ReachFrame
ColorBoxR.Name = "Red"
ColorBoxR.PlaceholderText = "R (0-1)"
ColorBoxR.Size = UDim2.new(0,56,0,26)
ColorBoxR.Position = UDim2.new(0,8,0,82)
ColorBoxR.Text = "1"
ColorBoxR.TextScaled = true

local ColorBoxG = Instance.new("TextBox")
ColorBoxG.Parent = ReachFrame
ColorBoxG.Name = "Green"
ColorBoxG.PlaceholderText = "G (0-1)"
ColorBoxG.Size = UDim2.new(0,56,0,26)
ColorBoxG.Position = UDim2.new(0,74,0,82)
ColorBoxG.Text = "1"
ColorBoxG.TextScaled = true

local ColorBoxB = Instance.new("TextBox")
ColorBoxB.Parent = ReachFrame
ColorBoxB.Name = "Blue"
ColorBoxB.PlaceholderText = "B (0-1)"
ColorBoxB.Size = UDim2.new(0,56,0,26)
ColorBoxB.Position = UDim2.new(0,140,0,82)
ColorBoxB.Text = "1"
ColorBoxB.TextScaled = true

local TransparentBox = Instance.new("TextBox")
TransparentBox.Parent = ReachFrame
TransparentBox.Name = "Transparent"
TransparentBox.PlaceholderText = "Transparency"
TransparentBox.Size = UDim2.new(0,105,0,26)
TransparentBox.Position = UDim2.new(0,36,0,112)
TransparentBox.Text = "0.7"
TransparentBox.TextScaled = true

-- Activ buttons
local ActivBlock = Instance.new("TextButton")
ActivBlock.Parent = ReachFrame
ActivBlock.Name = "BlockReach"
ActivBlock.BackgroundColor3 = Color3.fromRGB(136,136,136)
ActivBlock.Position = UDim2.new(0.05,0,0,144)
ActivBlock.Size = UDim2.new(0,70,0,22)
ActivBlock.Font = Enum.Font.SourceSans
ActivBlock.Text = "Block Reach"
ActivBlock.TextColor3 = Color3.fromRGB(255,255,255)
ActivBlock.TextScaled = true

local ActivBall = Instance.new("TextButton")
ActivBall.Parent = ReachFrame
ActivBall.Name = "BallReach"
ActivBall.BackgroundColor3 = Color3.fromRGB(136,136,136)
ActivBall.Position = UDim2.new(0.55,0,0,144)
ActivBall.Size = UDim2.new(0,70,0,22)
ActivBall.Font = Enum.Font.SourceSans
ActivBall.Text = "Ball Reach"
ActivBall.TextColor3 = Color3.fromRGB(255,255,255)
ActivBall.TextScaled = true

-- Clear Box button
local ClearBoxBtn = Instance.new("TextButton")
ClearBoxBtn.Parent = ReachFrame
ClearBoxBtn.Name = "ClearBox"
ClearBoxBtn.BackgroundColor3 = Color3.fromRGB(136,136,136)
ClearBoxBtn.Position = UDim2.new(0.05,0,0,170)
ClearBoxBtn.Size = UDim2.new(0,140,0,22)
ClearBoxBtn.Font = Enum.Font.SourceSans
ClearBoxBtn.Text = "Clear Box/Sphere"
ClearBoxBtn.TextColor3 = Color3.fromRGB(255,255,255)
ClearBoxBtn.TextScaled = true

-- Apply / ApplyButton (kept as in V5)
local ApplyButton = Instance.new("TextButton")
ApplyButton.Name = "Apply"
ApplyButton.Parent = Frame
ApplyButton.TextWrapped = true
ApplyButton.BorderSizePixel = 0
ApplyButton.TextScaled = true
ApplyButton.TextColor3 = Color3.fromRGB(2, 255, 0)
ApplyButton.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
ApplyButton.Size = UDim2.new(0, 118, 0, 24)
ApplyButton.Text = "Apply"
ApplyButton.Position = UDim2.new(0, 114, 0, 154)

-- Close / Minimize / Open (adapted from V3)
local ToggleClose = Instance.new("TextButton")
ToggleClose.Name = "toggleClose"
ToggleClose.Parent = Frame
ToggleClose.TextWrapped = true
ToggleClose.BorderSizePixel = 0
ToggleClose.TextScaled = true
ToggleClose.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleClose.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleClose.BackgroundTransparency = 0.2
ToggleClose.Size = UDim2.new(0, 34, 0, 26)
ToggleClose.Text = "X"
ToggleClose.Position = UDim2.new(0, 204, 0, 4)

local Minimize = Instance.new("TextButton")
Minimize.Name = "Minimize"
Minimize.Parent = Frame
Minimize.BackgroundColor3 = Color3.fromRGB(30,30,30)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0, 170, 0, 4)
Minimize.Size = UDim2.new(0, 34, 0, 26)
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255,255,255)
Minimize.TextScaled = true

local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "Open"
OpenBtn.Parent = ScreenGui
OpenBtn.BackgroundColor3 = Color3.fromRGB(0,0,0)
OpenBtn.Position = UDim2.new(-0.00208333344, 0, 0.393750012, 0)
OpenBtn.Size = UDim2.new(0, 83, 0, 50)
OpenBtn.Font = Enum.Font.SourceSans
OpenBtn.Text = "Open"
OpenBtn.TextColor3 = Color3.fromRGB(255,255,255)
OpenBtn.TextScaled = true

-- UI corners for nicer look (map to V5 UICorners)
for _,obj in pairs({TextBoxX,TextBoxY,TextBoxZ,ColorBoxR,ColorBoxG,ColorBoxB,TransparentBox,ApplyButton,RejoinBtn,ActivBlock,ActivBall,ClearBoxBtn,ToggleClose,Minimize}) do
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0,5)
    c.Parent = obj
end

-- Button behaviors: show/hide frames (Home/Reach)
HomeBtn.MouseButton1Click:Connect(function()
    HomeFrame.Visible = true
    ReachFrame.Visible = false
end)
ReachBtn.MouseButton1Click:Connect(function()
    HomeFrame.Visible = false
    ReachFrame.Visible = true
end)
RemoveBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Open / Close / Minimize behaviors
ToggleClose.MouseButton1Click:Connect(function()
    Frame.Visible = false
    OpenBtn.Visible = true
end)
OpenBtn.MouseButton1Click:Connect(function()
    Frame.Visible = true
    OpenBtn.Visible = false
end)
Minimize.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)

-- Utility: find tool handle safely
local function getToolHandle()
    local char = LocalPlayer.Character
    if not char then return nil end
    for _,obj in pairs(char:GetChildren()) do
        if obj:IsA("Tool") then
            if obj:FindFirstChild("Handle") then
                return obj.Handle
            end
        end
    end
    return nil
end

-- Helper to parse numbers with fallback
local function n(v, fallback)
    local num = tonumber(v)
    if num == nil then return fallback or 0 end
    return num
end

-- Create/Update SelectionBox on handle
local function createSelectionBox(handle, color3, transparency, sizeVec)
    if not handle then return end
    -- remove old if exists
    if handle:FindFirstChildOfClass("SelectionBox") then
        handle:FindFirstChildOfClass("SelectionBox"):Destroy()
    end
    local box = Instance.new("SelectionBox")
    box.Parent = handle
    box.Adornee = handle
    box.Color3 = color3
    box.SurfaceTransparency = transparency
    box.Transparency = transparency
    -- apply shape/size by altering handle.Size (as V3)
    pcall(function()
        handle.Shape = Enum.PartType.Block -- if supported; many items ignore Shape property
        handle.Size = sizeVec
        handle.Massless = true
    end)
    return box
end

-- Create/Update SelectionSphere on handle
local function createSelectionSphere(handle, color3, transparency, sizeVec)
    if not handle then return end
    if handle:FindFirstChildOfClass("SelectionSphere") then
        handle:FindFirstChildOfClass("SelectionSphere"):Destroy()
    end
    local sph = Instance.new("SelectionSphere")
    sph.Parent = handle
    sph.Adornee = handle
    sph.Color3 = color3
    sph.Transparency = transparency
    pcall(function()
        handle.Shape = Enum.PartType.Ball
        handle.Size = sizeVec
        handle.Massless = true
    end)
    return sph
end

-- Clear existing selection visuals
ClearBoxBtn.MouseButton1Click:Connect(function()
    local handle = getToolHandle()
    if handle then
        local sb = handle:FindFirstChildOfClass("SelectionBox")
        if sb then pcall(function() sb:Destroy() end) end
        local ss = handle:FindFirstChildOfClass("SelectionSphere")
        if ss then pcall(function() ss:Destroy() end) end
    end
end)

-- Activ Block
ActivBlock.MouseButton1Click:Connect(function()
    local handle = getToolHandle()
    if not handle then return end
    local rx = n(TextBoxX.Text, 4)
    local ry = n(TextBoxY.Text, 4)
    local rz = n(TextBoxZ.Text, 4)
    local r = math.clamp(n(ColorBoxR.Text, 1), 0, 1)
    local g = math.clamp(n(ColorBoxG.Text, 1), 0, 1)
    local b = math.clamp(n(ColorBoxB.Text, 1), 0, 1)
    local t = math.clamp(n(TransparentBox.Text, 0.7), 0, 1)
    createSelectionBox(handle, Color3.new(r,g,b), t, Vector3.new(rx,ry,rz))
end)

-- Activ Ball
ActivBall.MouseButton1Click:Connect(function()
    local handle = getToolHandle()
    if not handle then return end
    local rx = n(TextBoxX.Text, 4)
    local ry = n(TextBoxY.Text, 4)
    local rz = n(TextBoxZ.Text, 4)
    local r = math.clamp(n(ColorBoxR.Text, 1), 0, 1)
    local g = math.clamp(n(ColorBoxG.Text, 1), 0, 1)
    local b = math.clamp(n(ColorBoxB.Text, 1), 0, 1)
    local t = math.clamp(n(TransparentBox.Text, 0.7), 0, 1)
    createSelectionSphere(handle, Color3.new(r,g,b), t, Vector3.new(rx,ry,rz))
end)

-- Apply button: copy values to TextBoxes (optional behavior; kept to avoid break)
ApplyButton.MouseButton1Click:Connect(function()
    -- In this port, Apply doesn't change visual aside from possibly clamping values.
    TextBoxX.Text = tostring(math.max(1, n(TextBoxX.Text, 4)))
    TextBoxY.Text = tostring(math.max(1, n(TextBoxY.Text, 4)))
    TextBoxZ.Text = tostring(math.max(1, n(TextBoxZ.Text, 4)))
    ColorBoxR.Text = tostring(math.clamp(n(ColorBoxR.Text, 1),0,1))
    ColorBoxG.Text = tostring(math.clamp(n(ColorBoxG.Text, 1),0,1))
    ColorBoxB.Text = tostring(math.clamp(n(ColorBoxB.Text, 1),0,1))
    TransparentBox.Text = tostring(math.clamp(n(TransparentBox.Text, 0.7),0,1))
end)

-- finished
