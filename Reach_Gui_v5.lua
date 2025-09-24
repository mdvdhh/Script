-- Reach Gui v5 (GUI giữ nguyên V5, tính năng Reach từ V3)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Remove old
for _,c in pairs(PlayerGui:GetChildren()) do
    if c.Name == "Reach Gui" then
        c:Destroy()
    end
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Reach Gui"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Frame
local Frame = Instance.new("Frame")
Frame.Name = "Reach Frame"
Frame.Parent = ScreenGui
Frame.BorderSizePixel = 0
Frame.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
Frame.Size = UDim2.new(0, 242, 0, 194)
Frame.Position = UDim2.new(0, 300, 0, 28)
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0,5)
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

-- TextBoxes for X, Y, Z
local function makeTextBox(name, placeholder, posX, posY, color)
    local tb = Instance.new("TextBox")
    tb.Name = name
    tb.Parent = Frame
    tb.PlaceholderColor3 = Color3.fromRGB(186, 186, 186)
    tb.BorderSizePixel = 0
    tb.TextWrapped = true
    tb.TextColor3 = Color3.fromRGB(255,255,255)
    tb.TextScaled = true
    tb.BackgroundColor3 = color
    tb.PlaceholderText = placeholder
    tb.Size = UDim2.new(0,56,0,45)
    tb.Position = UDim2.new(0,posX,0,posY)
    tb.Text = ""
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0,5)
    c.Parent = tb
    return tb
end

local TextBox1 = makeTextBox("TextBox1","X",20,38,Color3.fromRGB(255,0,0))
local TextBox2 = makeTextBox("TextBox2","Y",92,38,Color3.fromRGB(0,255,0))
local TextBox3 = makeTextBox("TextBox3","Z",163,38,Color3.fromRGB(0,0,255))

-- Color boxes (R,G,B)
local function makeColorBox(name, posX)
    local tb = Instance.new("TextBox")
    tb.Name = name
    tb.Parent = Frame
    tb.PlaceholderColor3 = Color3.fromRGB(186,186,186)
    tb.BorderSizePixel = 0
    tb.TextWrapped = true
    tb.TextColor3 = Color3.fromRGB(255,255,255)
    tb.TextScaled = true
    tb.BackgroundColor3 = Color3.fromRGB(86,86,86)
    tb.PlaceholderText = "Color"
    tb.Size = UDim2.new(0,56,0,26)
    tb.Position = UDim2.new(0,posX,0,94)
    tb.Text = ""
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0,5)
    c.Parent = tb
    return tb
end

local ColorBox1 = makeColorBox("ColorBox1",20) -- R
local ColorBox2 = makeColorBox("ColorBox2",92) -- G
local ColorBox3 = makeColorBox("ColorBox3",163) -- B

-- Apply button
local ApplyButton = Instance.new("TextButton")
ApplyButton.Name = "Apply"
ApplyButton.Parent = Frame
ApplyButton.TextWrapped = true
ApplyButton.BorderSizePixel = 0
ApplyButton.TextScaled = true
ApplyButton.TextColor3 = Color3.fromRGB(2,255,0)
ApplyButton.BackgroundColor3 = Color3.fromRGB(54,54,54)
ApplyButton.Size = UDim2.new(0,118,0,24)
ApplyButton.Text = "Apply"
ApplyButton.Position = UDim2.new(0,114,0,154)
local UICornerA = Instance.new("UICorner")
UICornerA.CornerRadius = UDim.new(0,5)
UICornerA.Parent = ApplyButton

-- ToggleClose (hide frame)
local ToggleClose = Instance.new("TextButton")
ToggleClose.Name = "toggleClose"
ToggleClose.Parent = Frame
ToggleClose.TextWrapped = true
ToggleClose.BorderSizePixel = 0
ToggleClose.TextScaled = true
ToggleClose.TextColor3 = Color3.fromRGB(255,255,255)
ToggleClose.BackgroundColor3 = Color3.fromRGB(30,30,30)
ToggleClose.BackgroundTransparency = 0.2
ToggleClose.Size = UDim2.new(0,34,0,26)
ToggleClose.Text = "-"
ToggleClose.Position = UDim2.new(0,204,0,4)
local UICorner4 = Instance.new("UICorner")
UICorner4.Parent = ToggleClose

-- Logic from V3: reach apply
local function getToolHandle()
    local char = LocalPlayer.Character
    if not char then return nil end
    for _,obj in pairs(char:GetChildren()) do
        if obj:IsA("Tool") and obj:FindFirstChild("Handle") then
            return obj.Handle
        end
    end
    return nil
end

local function n(v, fallback)
    local num = tonumber(v)
    if not num then return fallback or 0 end
    return num
end

local function createSelectionBox(handle, color3, sizeVec)
    if not handle then return end
    if handle:FindFirstChildOfClass("SelectionBox") then
        handle:FindFirstChildOfClass("SelectionBox"):Destroy()
    end
    local box = Instance.new("SelectionBox")
    box.Parent = handle
    box.Adornee = handle
    box.Color3 = color3
    pcall(function()
        handle.Size = sizeVec
        handle.Massless = true
    end)
end

ApplyButton.MouseButton1Click:Connect(function()
    local handle = getToolHandle()
    if not handle then return end
    local x = n(TextBox1.Text,4)
    local y = n(TextBox2.Text,4)
    local z = n(TextBox3.Text,4)
    local r = math.clamp(n(ColorBox1.Text,1),0,1)
    local g = math.clamp(n(ColorBox2.Text,1),0,1)
    local b = math.clamp(n(ColorBox3.Text,1),0,1)
    createSelectionBox(handle, Color3.new(r,g,b), Vector3.new(x,y,z))
end)

-- Hide button logic
ToggleClose.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible
end)
