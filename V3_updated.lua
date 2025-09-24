-- Gui to Lua
-- Version: 3.2

-- Instances:

local Reachgui = Instance.new("ScreenGui")
local Drag = Instance.new("Frame")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")

Reach.Name = "Reach"
Reach.Parent = ScrollingFrame
addCorner(Reach)
Reach.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Reach.BorderSizePixel = 0
Reach.Position = UDim2.new(0, 0, 0.136612028, 0)
Reach.Size = UDim2.new(0, 66, 0, 50)
Reach.Font = Enum.Font.SourceSans
Reach.Text = "Reach"
Reach.TextColor3 = Color3.fromRGB(255, 255, 255)
Reach.TextScaled = true
Reach.TextSize = 14.000
Reach.TextWrapped = true
Reach.MouseButton1Click:Connect(function()
	ho.Visible = false
	Reacch.Visible = true
end)

Removegui.Name = "Remove gui"
Removegui.Parent = ScrollingFrame
addCorner(Removegui)
Removegui.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Removegui.BorderSizePixel = 0
Removegui.Position = UDim2.new(0, 0, 0.273224026, 0)
Removegui.Size = UDim2.new(0, 66, 0, 50)
Removegui.Font = Enum.Font.SourceSans
Removegui.Text = "Remove gui"
Removegui.TextColor3 = Color3.fromRGB(0, 0, 0)
Removegui.TextScaled = true
Removegui.TextSize = 14.000
Removegui.TextWrapped = true
Removegui.MouseButton1Click:Connect(function()
	Reachgui:Destroy()
end)

ho.Name = "ho"
ho.Parent = Frame
addCorner(ho)
ho.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
ho.Position = UDim2.new(0.289719582, 0, 0.0382513665, 0)
ho.Size = UDim2.new(0, 217, 0, 165)

Good.Name = "Good"
Good.Parent = ho
addCorner(Good)
Good.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Good.BorderSizePixel = 0
Good.Size = UDim2.new(0, 217, 0, 50)
Good.Font = Enum.Font.SourceSans
Good.Text = "Thanks for using Reach Gui V3 Pls Subscribe :)"
Good.TextColor3 = Color3.fromRGB(255, 255, 255)
Good.TextScaled = true
Good.TextSize = 14.000
Good.TextWrapped = true

Name1.Name = "Name"
Name1.Parent = ho
addCorner(Name1)
Name1.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Name1.BorderSizePixel = 0
Name1.Position = UDim2.new(0, 0, 0.357575744, 0)
Name1.Size = UDim2.new(0, 216, 0, 50)
Name1.Font = Enum.Font.SourceSans
Name1.Text = ""
Name1.TextColor3 = Color3.fromRGB(255, 255, 255)
Name1.TextScaled = true
Name1.TextSize = 14.000
Name1.TextWrapped = true
pcall(function()
	Name1.Text = game.Players:GetPlayerFromCharacter(game.Workspace.CurrentCamera.CameraSubject.Parent).Name
end)

TextButton.Parent = ho
addCorner(TextButton)
TextButton.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.10497161, 0, 0.696969688, 0)
TextButton.Size = UDim2.new(0, 174, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Rejoin"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextScaled = true
TextButton.TextSize = 14.000
TextButton.TextWrapped = true
TextButton.MouseButton1Click:Connect(function()
	game:GetService("TeleportService"):Teleport(game.PlaceId)
end)

Link.Name = "Link"
Link.Parent = ho
addCorner(Link)
Link.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Link.BorderSizePixel = 0
Link.Position = UDim2.new(1.05069125, 0, 0.200000003, 0)
Link.Size = UDim2.new(0, 228, 0, 30)
Link.Font = Enum.Font.SourceSans
Link.Text = "YT link: https://Youtube.com/c/Warriorrober"
Link.TextColor3 = Color3.fromRGB(255, 255, 255)
Link.TextScaled = true
Link.TextSize = 1.000
Link.TextWrapped = true

Cred.Name = "Cred"
Cred.Parent = ho
addCorner(Cred)
Cred.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Cred.BorderSizePixel = 0
Cred.Position = UDim2.new(1.05069125, 0, 0, 0)
Cred.Size = UDim2.new(0, 228, 0, 30)
Cred.Font = Enum.Font.SourceSans
Cred.Text = "Script made by WarriorRoberr"
Cred.TextColor3 = Color3.fromRGB(255, 255, 255)
Cred.TextScaled = true
Cred.TextSize = 14.000
Cred.TextWrapped = true

Reacch.Name = "Reacch"
Reacch.Parent = Frame
addCorner(Reacch)
Reacch.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Reacch.Position = UDim2.new(0.289719582, 0, 0.0382513665, 0)
Reacch.Size = UDim2.new(0, 217, 0, 165)
Reacch.Visible = false

X.Name = "X"
X.Parent = Reacch
addCorner(X)
X.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
X.BorderSizePixel = 0
X.Position = UDim2.new(0.0368663594, 0, 0.0787878782, 0)
X.Size = UDim2.new(0, 50, 0, 50)
X.Font = Enum.Font.SourceSans
X.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
X.PlaceholderText = "put number"
X.Text = "X"
X.TextColor3 = Color3.fromRGB(255, 255, 255)
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

Y.Name = "Y"
Y.Parent = Reacch
addCorner(Y)
Y.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Y.BorderSizePixel = 0
Y.Position = UDim2.new(0.304147482, 0, 0.0787878782, 0)
Y.Size = UDim2.new(0, 50, 0, 50)
Y.Font = Enum.Font.SourceSans
Y.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Y.PlaceholderText = "put number"
Y.Text = "Y"
Y.TextColor3 = Color3.fromRGB(255, 255, 255)
Y.TextScaled = true
Y.TextSize = 14.000
Y.TextWrapped = true

Z.Name = "Z"
Z.Parent = Reacch
addCorner(Z)
Z.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Z.BorderSizePixel = 0
Z.Position = UDim2.new(0.57603687, 0, 0.0787878782, 0)
Z.Size = UDim2.new(0, 50, 0, 50)
Z.Font = Enum.Font.SourceSans
Z.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Z.PlaceholderText = "put number"
Z.Text = "Z"
Z.TextColor3 = Color3.fromRGB(255, 255, 255)
Z.TextScaled = true
Z.TextSize = 14.000
Z.TextWrapped = true

Red.Name = "Red"
Red.Parent = Reacch
addCorner(Red)
Red.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Red.BorderSizePixel = 0
Red.Position = UDim2.new(0.0368663594, 0, 0.381818175, 0)
Red.Size = UDim2.new(0, 50, 0, 50)
Red.Font = Enum.Font.SourceSans
Red.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Red.PlaceholderText = "put number"
Red.Text = "Red"
Red.TextColor3 = Color3.fromRGB(0, 0, 0)
Red.TextScaled = true
Red.TextSize = 14.000
Red.TextWrapped = true

Blue.Name = "Blue"
Blue.Parent = Reacch
addCorner(Blue)
Blue.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Blue.BorderSizePixel = 0
Blue.Position = UDim2.new(0.576036811, 0, 0.381818175, 0)
Blue.Size = UDim2.new(0, 50, 0, 50)
Blue.Font = Enum.Font.SourceSans
Blue.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Blue.PlaceholderText = "put number"
Blue.Text = "Blue"
Blue.TextColor3 = Color3.fromRGB(0, 0, 0)
Blue.TextScaled = true
Blue.TextSize = 14.000
Blue.TextWrapped = true

Green.Name = "Green"
Green.Parent = Reacch
addCorner(Green)
Green.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Green.BorderSizePixel = 0
Green.Position = UDim2.new(0.304147482, 0, 0.381818175, 0)
Green.Size = UDim2.new(0, 50, 0, 50)
Green.Font = Enum.Font.SourceSans
Green.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Green.PlaceholderText = "put number"
Green.Text = "Green"
Green.TextColor3 = Color3.fromRGB(0, 0, 0)
Green.TextScaled = true
Green.TextSize = 14.000
Green.TextWrapped = true

Transparent.Name = "Transparent"
Transparent.Parent = Reacch
addCorner(Transparent)
Transparent.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Transparent.BorderSizePixel = 0
Transparent.Position = UDim2.new(1.05069125, 0, 0.115151517, 0)
Transparent.Size = UDim2.new(0, 105, 0, 37)
Transparent.Font = Enum.Font.SourceSans
Transparent.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Transparent.PlaceholderText = "put number"
Transparent.Text = "0.7"
Transparent.TextColor3 = Color3.fromRGB(255, 255, 255)
Transparent.TextSize = 16.000
Transparent.TextWrapped = true

Activ1.Name = "Activ1"
Activ1.Parent = Reacch
addCorner(Activ1)
Activ1.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Activ1.BorderSizePixel = 0
Activ1.Position = UDim2.new(0.53456223, 0, 0.864685416, 0)
Activ1.Size = UDim2.new(0, 92, 0, 22)
Activ1.Font = Enum.Font.SourceSans
Activ1.Text = "Ball Reach"
Activ1.TextColor3 = Color3.fromRGB(255, 255, 255)
Activ1.TextScaled = true
Activ1.TextSize = 1.000
Activ1.TextWrapped = true
Activ1.MouseButton1Click:Connect(function()
	local box1 = Instance.new("SelectionSphere")
	box1.Parent = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle
addCorner(box1)
	box1.Adornee = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle
	box1.Color3 = Color3.new(Red.Text,Green.Text,Blue.Text)
	box1.Transparency = Transparent.Text
	box1.SurfaceTransparency = Transparent.Text
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Shape = "Ball"
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Size = Vector3.new(X.Text,Y.Text,Z.Text)
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Massless = true
end)

Activ.Name = "Activ"
Activ.Parent = Reacch
addCorner(Activ)
Activ.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Activ.BorderSizePixel = 0
Activ.Position = UDim2.new(0.53456223, 0, 0.731352091, 0)
Activ.Size = UDim2.new(0, 92, 0, 22)
Activ.Font = Enum.Font.SourceSans
Activ.Text = "Block Reach"
Activ.TextColor3 = Color3.fromRGB(255, 255, 255)
Activ.TextScaled = true
Activ.TextSize = 1.000
Activ.TextWrapped = true
Activ.MouseButton1Click:Connect(function()
	local box = Instance.new("SelectionBox")
	box.Parent = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle
addCorner(box)
	box.Adornee = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle
	box.Color3 = Color3.new(Red.Text,Green.Text,Blue.Text)
	box.Transparency = Transparent.Text
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Shape = "Block"
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Size = Vector3.new(X.Text,Y.Text,Z.Text)
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.Massless = true
end)

Boxtr.Name = "Boxtr"
Boxtr.Parent = Reacch
addCorner(Boxtr)
Boxtr.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
Boxtr.Position = UDim2.new(1.05069125, 0, -0.0424242429, 0)
Boxtr.Size = UDim2.new(0, 105, 0, 26)
Boxtr.Font = Enum.Font.SourceSans
Boxtr.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
Boxtr.Text = "Box Transparent"
Boxtr.TextColor3 = Color3.fromRGB(255, 255, 255)
Boxtr.TextSize = 16.000
Boxtr.TextWrapped = true

ClearB.Name = "Clear B"
ClearB.Parent = Reacch
addCorner(ClearB)
ClearB.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
ClearB.BorderSizePixel = 0
ClearB.Position = UDim2.new(0.110599078, 0, 0.731352091, 0)
ClearB.Size = UDim2.new(0, 92, 0, 34)
ClearB.Font = Enum.Font.SourceSans
ClearB.Text = "Clear Box"
ClearB.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearB.TextScaled = true
ClearB.TextSize = 1.000
ClearB.TextWrapped = true
ClearB.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.SelectionBox:Destroy()
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle.SelectionSphere:Destroy()
end)

Close.Name = "Close"
Close.Parent = Drag
addCorner(Close)
Close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.906542063, 0, 0, 0)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Click:Connect(function()
	Open.Visible = true
	Drag.Visible = false
end)

Minimize.Name = "Minimize"
Minimize.Parent = Drag
addCorner(Minimize)
Minimize.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Minimize.BorderSizePixel = 0
Minimize.Position = UDim2.new(0.813084126, 0, 0, 0)
Minimize.Size = UDim2.new(0, 30, 0, 30)
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "-"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 50.000
Minimize.TextWrapped = true
function Mini()
	if Minimize.Text == "-" then
		Minimize.Text = "+"
		Frame.Visible = false
	elseif Minimize.Text == "+" then
		Minimize.Text = "-"
		Frame.Visible = true
	end
end
Minimize.MouseButton1Click:Connect(Mini)

N.Name = "N"
N.Parent = Drag
addCorner(N)
N.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
N.BorderSizePixel = 0
N.Size = UDim2.new(0, 128, 0, 30)
N.Font = Enum.Font.SourceSans
N.Text = "Reach Gui V3"
N.TextColor3 = Color3.fromRGB(255, 255, 255)
N.TextScaled = true
N.TextSize = 14.000
N.TextWrapped = true

Open.Name = "Open"
Open.Parent = Reachgui
addCorner(Open)
Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open.Position = UDim2.new(-0.00208333344, 0, 0.393750012, 0)
Open.Size = UDim2.new(0, 83, 0, 50)
Open.Font = Enum.Font.SourceSans
Open.Text = "Open"
Open.TextColor3 = Color3.fromRGB(255, 255, 255)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextWrapped = true
Open.MouseButton1Click:Connect(function()
	Open.Visible = false
	Drag.Visible = true
end)