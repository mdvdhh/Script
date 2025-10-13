-- Theme: Techno
-- Accent: #00ffe0
-- Dialog: #0a0a0f
-- Outline: #00b3ff
-- Text: #e6faff
-- Placeholder: #4d6f80
-- Background: #000000
-- Button: #0d1f2d
-- Icon: #00d9ff

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "KillPlayerGui"
gui.Parent = player:WaitForChild("PlayerGui")

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.BackgroundColor3 = Color3.fromHex('#0a0a0f')
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(0, 224, 0, 34)
TopBar.Position = UDim2.new(0, 174, 0, 8)
TopBar.Active = true
TopBar.Draggable = true
TopBar.Parent = gui

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 5)
TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 92, 0, 17)
Title.Position = UDim2.new(0, 7, 0, 9)
Title.Font = Enum.Font.SourceSans
Title.Text = "Kill Player Gui"
Title.TextScaled = true
Title.TextColor3 = Color3.fromHex('#e6faff')
Title.Parent = TopBar

local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Text = "-"
Toggle.TextScaled = true
Toggle.TextColor3 = Color3.fromHex('#e6faff')
Toggle.BackgroundTransparency = 1
Toggle.Size = UDim2.new(0, 36, 0, 26)
Toggle.Position = UDim2.new(0, 182, 0, 4)
Toggle.Parent = TopBar

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 5)
ToggleCorner.Parent = Toggle

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.BackgroundColor3 = Color3.fromHex('#0a0a0f')
Main.BorderSizePixel = 0
Main.Size = UDim2.new(0, 224, 0, 114)
Main.Position = UDim2.new(0, 0, 0, 36)
Main.Parent = TopBar

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 5)
MainCorner.Parent = Main

local openClose = Instance.new("TextButton")
openClose.Name = "openClose"
openClose.Text = "›"
openClose.TextScaled = true
openClose.TextColor3 = Color3.fromHex('#e6faff')
openClose.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
openClose.BackgroundTransparency = 0.8
openClose.Position = UDim2.new(0, 188, 0, 12)
openClose.Size = UDim2.new(0, 28, 0, 28)
openClose.Parent = Main

local openCloseCorner = Instance.new("UICorner")
openCloseCorner.CornerRadius = UDim.new(0, 5)
openCloseCorner.Parent = openClose

local OnOff = Instance.new("TextButton")
OnOff.Name = "OnOff"
OnOff.Text = "OFF"
OnOff.TextScaled = true
OnOff.TextColor3 = Color3.fromHex('#00ffe0')
OnOff.BackgroundColor3 = Color3.fromHex('#0d1f2d')
OnOff.BackgroundTransparency = 0.6
OnOff.Position = UDim2.new(0, 10, 0, 68)
OnOff.Size = UDim2.new(0, 204, 0, 28)
OnOff.Parent = Main

local OnOffCorner = Instance.new("UICorner")
OnOffCorner.CornerRadius = UDim.new(0, 5)
OnOffCorner.Parent = OnOff

local List = Instance.new("Frame")
List.Name = "List"
List.BackgroundColor3 = Color3.fromHex('#0a0a0f')
List.BorderSizePixel = 0
List.Position = UDim2.new(0, 226, 0, -36)
List.Size = UDim2.new(0, 228, 0, 150)
List.Visible = false
List.Parent = Main

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 5)
ListCorner.Parent = List

local Aspect = Instance.new("UIAspectRatioConstraint")
Aspect.AspectRatio = 6.58824
Aspect.Parent = TopBar

Toggle.MouseButton1Click:Connect(function()
	if isOpen then
		Main.Visible = false
		Toggle.Text = "+"
	else
		Main.Visible = true
		Toggle.Text = "-"
	end
	isOpen = not isOpen
end)

openClose.MouseButton1Click:Connect(function()
	if isOpen then
		List.Visible = false
		openClose.Text = "›"
	else
		List.Visible = true
		openClose.Text = "‹"
	end
	isOpen = not isOpen
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local PlayerName = Instance.new("TextLabel")
PlayerName.Name = "PlayerName"
PlayerName.BackgroundTransparency = 1
PlayerName.Position = UDim2.new(0, 10, 0, 12)
PlayerName.Size = UDim2.new(0, 170, 0, 28)
PlayerName.Font = Enum.Font.SourceSans
PlayerName.TextScaled = true
PlayerName.TextColor3 = Color3.fromRGB(185, 185, 185)
PlayerName.Text = ""
PlayerName.Parent = Main

local Scroll = Instance.new("ScrollingFrame")
Scroll.Name = "ScrollingFrame"
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.Position = UDim2.new(0, 3, 0, 3)
Scroll.Size = UDim2.new(0, 222, 0, 144)
Scroll.ScrollBarThickness = 2
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.Parent = List

local Layout = Instance.new("UIListLayout")
Layout.Parent = Scroll
Layout.Padding = UDim.new(0, 5)
Layout.SortOrder = Enum.SortOrder.LayoutOrder

local function UpdateCanvasSize()
	task.wait()
	Scroll.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 5)
end
Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvasSize)

local function CreatePlayerButton(player)
	if player == LocalPlayer then return end 

	local Button = Instance.new("TextButton")
	Button.Name = player.Name
	Button.Size = UDim2.new(1, -10, 0, 30)
	Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Button.TextColor3 = Color3.fromHex('#e6faff')
	Button.Font = Enum.Font.GothamBold
	Button.TextSize = 13
	Button.Text = string.format("%s (@%s)", player.DisplayName, player.Name)
	Button.AutoButtonColor = false
	Button.Parent = Scroll

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 5)
ButtonCorner.Parent = Button

	Button.MouseEnter:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	end)
	Button.MouseLeave:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	end)

	Button.MouseButton1Click:Connect(function()
		PlayerName.Text = string.format("%s (@%s)", player.DisplayName, player.Name)
	end)
end

for _, player in ipairs(Players:GetPlayers()) do
	CreatePlayerButton(player)
end

Players.PlayerAdded:Connect(function(player)
	CreatePlayerButton(player)
end)

Players.PlayerRemoving:Connect(function(player)
	local btn = Scroll:FindFirstChild(player.Name)
	if btn then
		btn:Destroy()
	end
	UpdateCanvasSize()
end)

local range = math.huge
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local isOn = false

local OnOffButton = OnOff

OnOffButton.Text = "OFF"
OnOffButton.TextColor3 = Color3.fromHex('#00ffe0')

local function GetSelectedPlayer()
	for _, p in ipairs(Players:GetPlayers()) do
		local formatted = string.format("%s (@%s)", p.DisplayName, p.Name)
		if formatted == PlayerName.Text then
			return p
		end
	end
	return nil
end

OnOffButton.MouseButton1Click:Connect(function()
	isOn = not isOn

	if isOn then
		OnOffButton.Text = "ON"
		OnOffButton.TextColor3 = Color3.fromRGB(0, 255, 0)
	else
		OnOffButton.Text = "OFF"
		OnOffButton.TextColor3 = Color3.fromHex('#00ffe0')
	end
end)

RunService.RenderStepped:Connect(function()
	if not isOn then return end

	local target = GetSelectedPlayer()
	if not target then return end

	local char = target.Character
	local myChar = LocalPlayer.Character
	if not (char and myChar) then return end

	local humanoid = char:FindFirstChild("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local tool = myChar:FindFirstChildOfClass("Tool")

	if humanoid and humanoid.Health > 0 and hrp and tool and tool:FindFirstChild("Handle") then
		if LocalPlayer:DistanceFromCharacter(hrp.Position) <= range then
			tool:Activate()
			for _, part in ipairs(char:GetChildren()) do
				if part:IsA("BasePart") then
					firetouchinterest(tool.Handle, part, 0)
					firetouchinterest(tool.Handle, part, 1)
				end
			end
		end
	end
end)