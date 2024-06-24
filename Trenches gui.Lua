-- Create a new ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MySquareGUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create a frame for the window
local window = Instance.new("Frame")
window.Name = "Window"
window.Size = UDim2.new(0, 600, 0, 400)
window.Position = UDim2.new(0.5, -300, 0.5, -200)
window.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  
window.BorderSizePixel = 0
window.Active = true
window.Draggable = true
window.Parent = screenGui

-- Create a panel for the name bar
local nameBar = Instance.new("Frame")
nameBar.Name = "NameBar"
nameBar.Size = UDim2.new(1, 0, 0, 50)
nameBar.Position = UDim2.new(0, 0, 0, 0)
nameBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
nameBar.BorderSizePixel = 0
nameBar.Active = true
nameBar.Parent = window

-- Create a label for the name bar
local nameLabel = Instance.new("TextLabel")
nameLabel.Name = "NameLabel"
nameLabel.Text = "Trenches 5P1D3R5_Scripts"
nameLabel.Size = UDim2.new(0.8, 0, 1, 0)
nameLabel.Position = UDim2.new(0, 0, 0, 0)
nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
nameLabel.BackgroundTransparency = 1
nameLabel.Font = Enum.Font.SourceSans
nameLabel.TextSize = 24
nameLabel.Parent = nameBar

-- Create an options button
local optionsButton = Instance.new("TextButton")
optionsButton.Name = "OptionsButton"
optionsButton.Text = "Options"
optionsButton.Size = UDim2.new(0.2, 0, 1, 0)
optionsButton.Position = UDim2.new(0.8, 0, 0, 0)
optionsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
optionsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
optionsButton.BorderSizePixel = 0
optionsButton.Font = Enum.Font.SourceSans
optionsButton.TextSize = 24
optionsButton.Parent = nameBar

-- Create a side panel for tabs
local sidePanel = Instance.new("Frame")
sidePanel.Name = "SidePanel"
sidePanel.Size = UDim2.new(0, 150, 1, -50)
sidePanel.Position = UDim2.new(0, 0, 0, 50)
sidePanel.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
sidePanel.BorderSizePixel = 0
sidePanel.Parent = window

-- Create a content area for displaying tab content
local contentArea = Instance.new("Frame")
contentArea.Name = "ContentArea"
contentArea.Size = UDim2.new(1, -150, 1, -50)
contentArea.Position = UDim2.new(0, 150, 0, 50)
contentArea.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
contentArea.BorderSizePixel = 0
contentArea.Parent = window

-- Create an options panel
local optionsPanel = Instance.new("Frame")
optionsPanel.Name = "OptionsPanel"
optionsPanel.Size = UDim2.new(1, 0, 1, 0)
optionsPanel.Position = UDim2.new(0, 0, 0, 0)
optionsPanel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
optionsPanel.BorderSizePixel = 0
optionsPanel.Visible = false
optionsPanel.Parent = contentArea

-- Watermark label
local watermarkLabel = Instance.new("TextLabel")
watermarkLabel.Name = "WatermarkLabel"
watermarkLabel.Text = "Created by Seapie (Discord realseapie)"
watermarkLabel.Size = UDim2.new(1, 0, 0, 30)
watermarkLabel.Position = UDim2.new(0, 0, 1, -30)
watermarkLabel.TextColor3 = Color3.fromRGB(150, 150, 150) -- Gray color
watermarkLabel.BackgroundTransparency = 1
watermarkLabel.Font = Enum.Font.SourceSans
watermarkLabel.TextSize = 18
watermarkLabel.Parent = optionsPanel

-- Create a dropdown for theme selection
local themeDropdown = Instance.new("TextButton")
themeDropdown.Name = "ThemeDropdown"
themeDropdown.Text = "Select Theme"
themeDropdown.Size = UDim2.new(1, -20, 0.1, -20)
themeDropdown.Position = UDim2.new(0, 10, 0.2, 0)
themeDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
themeDropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
themeDropdown.BorderSizePixel = 0
themeDropdown.Font = Enum.Font.SourceSans
themeDropdown.TextSize = 24
themeDropdown.Parent = optionsPanel

-- Create a frame for dropdown options
local dropdownOptions = Instance.new("Frame")
dropdownOptions.Name = "DropdownOptions"
dropdownOptions.Size = UDim2.new(1, -20, 0, 200)
dropdownOptions.Position = UDim2.new(0, 10, 0, 35)
dropdownOptions.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
dropdownOptions.BorderSizePixel = 0
dropdownOptions.Visible = false
dropdownOptions.Parent = themeDropdown

-- Function to create dropdown options
local function createDropdownOption(text, position, callback)
    local option = Instance.new("TextButton")
    option.Name = text .. "Option"
    option.Text = text
    option.Size = UDim2.new(1, 0, 0, 50)
    option.Position = position
    option.TextColor3 = Color3.fromRGB(255, 255, 255)
    option.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    option.BorderSizePixel = 0
    option.Font = Enum.Font.SourceSans
    option.TextSize = 24
    option.Parent = dropdownOptions
    
    option.MouseButton1Click:Connect(callback)
    return option
end

-- Theme color definitions
local themes = {
    Default = {
        windowColor = Color3.fromRGB(30, 30, 30),
        nameBarColor = Color3.fromRGB(0, 0, 0),
        sidePanelColor = Color3.fromRGB(255, 0, 0),
        contentAreaColor = Color3.fromRGB(35, 35, 35),
        textColor = Color3.fromRGB(255, 255, 255)
    },
    LightTheme = {
        windowColor = Color3.fromRGB(240, 240, 240),
        nameBarColor = Color3.fromRGB(200, 200, 200),
        sidePanelColor = Color3.fromRGB(220, 220, 220),
        contentAreaColor = Color3.fromRGB(255, 255, 255),
        textColor = Color3.fromRGB(0, 0, 0)
    },
    DarkTheme = {
        windowColor = Color3.fromRGB(30, 30, 30),
        nameBarColor = Color3.fromRGB(0, 0, 0),
        sidePanelColor = Color3.fromRGB(50, 50, 50),
        contentAreaColor = Color3.fromRGB(35, 35, 35),
        textColor = Color3.fromRGB(255, 255, 255)
    },
    GrapeTheme = {
        windowColor = Color3.fromRGB(100, 0, 150),
        nameBarColor = Color3.fromRGB(80, 0, 120),
        sidePanelColor = Color3.fromRGB(120, 0, 180),
        contentAreaColor = Color3.fromRGB(140, 0, 200),
        textColor = Color3.fromRGB(255, 255, 255)
    },
    BloodTheme = {
        windowColor = Color3.fromRGB(120, 0, 0),
        nameBarColor = Color3.fromRGB(100, 0, 0),
        sidePanelColor = Color3.fromRGB(140, 0, 0),
        contentAreaColor = Color3.fromRGB(160, 0, 0),
        textColor = Color3.fromRGB(255, 255, 255)
    },
    Ocean = {
        windowColor = Color3.fromRGB(0, 100, 150),
        nameBarColor = Color3.fromRGB(0, 80, 120),
        sidePanelColor = Color3.fromRGB(0, 120, 180),
        contentAreaColor = Color3.fromRGB(0, 140, 200),
        textColor = Color3.fromRGB(255, 255, 255)
    },
    Midnight = {
        windowColor = Color3.fromRGB(20, 20, 60),
        nameBarColor = Color3.fromRGB(10, 10, 40),
        sidePanelColor = Color3.fromRGB(30, 30, 80),
        contentAreaColor = Color3.fromRGB(40, 40, 100),
        textColor = Color3.fromRGB(255, 255, 255)
    },
    Sentinel = {
        windowColor = Color3.fromRGB(20, 20, 20),
        nameBarColor = Color3.fromRGB(10, 10, 10),
        sidePanelColor = Color3.fromRGB(30, 30, 30),
        contentAreaColor = Color3.fromRGB(40, 40, 40),
        textColor = Color3.fromRGB(255, 0, 0)
    },
    Synapse = {
        windowColor = Color3.fromRGB(0, 0, 0),
        nameBarColor = Color3.fromRGB(20, 20, 20),
        sidePanelColor = Color3.fromRGB(30, 30, 30),
        contentAreaColor = Color3.fromRGB(40, 40, 40),
        textColor = Color3.fromRGB(255, 165, 0) -- Orange text color
    }
}

-- Function to change theme
local function changeTheme(themeName)
    local theme = themes[themeName]
    window.BackgroundColor3 = theme.windowColor
    nameBar.BackgroundColor3 = theme.nameBarColor
    sidePanel.BackgroundColor3 = theme.sidePanelColor
    contentArea.BackgroundColor3 = theme.contentAreaColor
    nameLabel.TextColor3 = theme.textColor
    optionsButton.TextColor3 = theme.textColor
end

-- Add dropdown options
local themeNames = {"Default", "LightTheme", "DarkTheme", "GrapeTheme", "BloodTheme", "Ocean", "Midnight", "Sentinel", "Synapse"}
for i, themeName in ipairs(themeNames) do
    createDropdownOption(themeName, UDim2.new(0, 0, 0, (i - 1) * 50), function()
        themeDropdown.Text = themeName
        dropdownOptions.Visible = false
        changeTheme(themeName)
    end)
end

-- Show/hide dropdown options on click
themeDropdown.MouseButton1Click:Connect(function()
    dropdownOptions.Visible = not dropdownOptions.Visible
end)

-- Function to create a new tab button
local function createTabButton(name, position, callback)
    local tabButton = Instance.new("TextButton")
    tabButton.Name = name .. "Tab"
    tabButton.Text = name
    tabButton.Size = UDim2.new(1, 0, 0, 50)
    tabButton.Position = position
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabButton.BorderSizePixel = 0
    tabButton.Font = Enum.Font.SourceSans
    tabButton.TextSize = 24
    tabButton.Parent = sidePanel
    
    tabButton.MouseButton1Click:Connect(callback)
    return tabButton
end

-- Function to create tab content
local function createTabContent(name)
    local tabContent = Instance.new("Frame")
    tabContent.Name = name .. "Content"
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.Position = UDim2.new(0, 0, 0, 0)
    tabContent.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tabContent.BorderSizePixel = 0
    tabContent.Visible = false
    tabContent.Parent = contentArea

    local contentLabel = Instance.new("TextLabel")
    contentLabel.Name = "ContentLabel"
    contentLabel.Text = "This is the content for " .. name
    contentLabel.Size = UDim2.new(1, 0, 1, 0)
    contentLabel.Position = UDim2.new(0, 0, 0, 0)
    contentLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Font = Enum.Font.SourceSans
    contentLabel.TextSize = 24
    contentLabel.Parent = tabContent

    return tabContent
end

-- Keybind for toggling UI
local UserInputService = game:GetService("UserInputService")
local uiVisible = true -- Initial state of the UI

-- Function to toggle the UI visibility
local function toggleUI()
    uiVisible = not uiVisible
    screenGui.Enabled = uiVisible
end

-- to toggle the UI
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
        toggleUI()
    end
end)

-- Dragging functionality
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

nameBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = window.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

nameBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        update(input)
    end
end)

-- Function to handle options button click
optionsButton.MouseButton1Click:Connect(function()
    optionsPanel.Visible = not optionsPanel.Visible
end)

-- Set the default theme on GUI load
changeTheme("Default")