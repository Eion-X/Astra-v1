local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

local DarkMode = true
local CurrentTab = nil
local IsMinimized = false
local AllButtons = {}
local AllLabels = {}
local AllTabs = {}
local AllTextboxes = {}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = HttpService:GenerateGUID(false)
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false

local LoadFrame = Instance.new("Frame")
LoadFrame.Size = UDim2.new(0, 420, 0, 280)
LoadFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
LoadFrame.BackgroundColor3 = Color3.fromHex("#101018")
LoadFrame.Parent = ScreenGui
LoadFrame.ZIndex = 1000
LoadFrame.ClipsDescendants = true
LoadFrame.BackgroundTransparency = 1

local LoadCorner = Instance.new("UICorner")
LoadCorner.CornerRadius = UDim.new(0, 20)
LoadCorner.Parent = LoadFrame

local LoadStroke = Instance.new("UIStroke")
LoadStroke.Thickness = 1
LoadStroke.Color = Color3.fromHex("#5a5a9e")
LoadStroke.Transparency = 0.3
LoadStroke.Parent = LoadFrame

local LoadGradient = Instance.new("UIGradient")
LoadGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromHex("#151521")),
	ColorSequenceKeypoint.new(1, Color3.fromHex("#101018"))
})
LoadGradient.Rotation = 90
LoadGradient.Parent = LoadFrame

local LoadLogoContainer = Instance.new("Frame")
LoadLogoContainer.Size = UDim2.new(0, 80, 0, 80)
LoadLogoContainer.Position = UDim2.new(0.5, -40, 0, 20)
LoadLogoContainer.BackgroundTransparency = 1
LoadLogoContainer.Parent = LoadFrame

local LoadLogo = Instance.new("Frame")
LoadLogo.Size = UDim2.new(1, 0, 1, 0)
LoadLogo.BackgroundColor3 = Color3.fromHex("#6b6bb6")
LoadLogo.Parent = LoadLogoContainer

local LoadLogoCorner = Instance.new("UICorner")
LoadLogoCorner.CornerRadius = UDim.new(0, 16)
LoadLogoCorner.Parent = LoadLogo

local LoadLogoGrad = Instance.new("UIGradient")
LoadLogoGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromHex("#6b6bb6")),
	ColorSequenceKeypoint.new(1, Color3.fromHex("#4b4bff"))
})
LoadLogoGrad.Rotation = 45
LoadLogoGrad.Parent = LoadLogo

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Size = UDim2.new(1, 0, 0, 44)
LoadTitle.Position = UDim2.new(0, 0, 0, 105)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "Astra V1"
LoadTitle.Font = Enum.Font.GothamBlack
LoadTitle.TextSize = 32
LoadTitle.TextColor3 = Color3.new(1,1,1)
LoadTitle.TextXAlignment = Enum.TextXAlignment.Center
LoadTitle.Parent = LoadFrame

local LoadTeam = Instance.new("TextLabel")
LoadTeam.Size = UDim2.new(1, 0, 0, 24)
LoadTeam.Position = UDim2.new(0, 0, 0, 150)
LoadTeam.BackgroundTransparency = 1
LoadTeam.Text = "开发团队：Astra Team"
LoadTeam.Font = Enum.Font.Gotham
LoadTeam.TextSize = 16
LoadTeam.TextColor3 = Color3.fromHex("#a0a0c0")
LoadTeam.TextXAlignment = Enum.TextXAlignment.Center
LoadTeam.Parent = LoadFrame

local ProgressContainer = Instance.new("Frame")
ProgressContainer.Size = UDim2.new(0, 320, 0, 12)
ProgressContainer.Position = UDim2.new(0.5, -160, 0, 200)
ProgressContainer.BackgroundColor3 = Color3.fromHex("#181825")
ProgressContainer.Parent = LoadFrame

local ProgressCorner = Instance.new("UICorner")
ProgressCorner.CornerRadius = UDim.new(0, 6)
ProgressCorner.Parent = ProgressContainer

local ProgressBar = Instance.new("Frame")
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
ProgressBar.BackgroundColor3 = Color3.fromHex("#6b6bb6")
ProgressBar.Parent = ProgressContainer

local ProgressGrad = Instance.new("UIGradient")
ProgressGrad.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromHex("#6b6bb6")),
	ColorSequenceKeypoint.new(1, Color3.fromHex("#4b4bff"))
})
ProgressGrad.Rotation = 0
ProgressGrad.Parent = ProgressBar

local ProgressCornerBar = Instance.new("UICorner")
ProgressCornerBar.CornerRadius = UDim.new(0, 6)
ProgressCornerBar.Parent = ProgressBar

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 740, 0, 460)
MainFrame.Position = UDim2.new(0.5, -370, 0.5, -230)
MainFrame.BackgroundColor3 = Color3.fromHex("#101018")
MainFrame.BackgroundTransparency = 1
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
MainFrame.ZIndex = 10
MainFrame.Visible = false

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 20)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1
MainStroke.Color = Color3.fromHex("#5a5a9e")
MainStroke.Transparency = 0.3
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 48)
TopBar.BackgroundColor3 = Color3.fromHex("#1a1a29")
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 20)
TopCorner.Parent = TopBar

local TopGradient = Instance.new("UIGradient")
TopGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromHex("#1a1a29")),
	ColorSequenceKeypoint.new(1, Color3.fromHex("#2b2b4a"))
})
TopGradient.Parent = TopBar

local TitleIcon = Instance.new("ImageLabel")
TitleIcon.Size = UDim2.new(0, 28, 0, 28)
TitleIcon.Position = UDim2.new(0, 22, 0.5, -14)
TitleIcon.BackgroundColor3 = DarkMode and Color3.fromHex("#6b6bb6") or Color3.fromHex("#4b4bff")
TitleIcon.BackgroundTransparency = 0
TitleIcon.Image = "rbxassetid://74258009459412"
TitleIcon.Parent = TopBar

local IconCorner = Instance.new("UICorner")
IconCorner.CornerRadius = UDim.new(0, 6)
IconCorner.Parent = TitleIcon

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -180, 1, 0)
Title.Position = UDim2.new(0, 60, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Astra"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = Color3.fromHex("#ffffff")
Title.Parent = TopBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 36, 0, 36)
CloseButton.Position = UDim2.new(1, -42, 0.5, -18)
CloseButton.BackgroundColor3 = Color3.fromHex("#ff4d4d")
CloseButton.Text = "?"
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18
CloseButton.Parent = TopBar
CloseButton.AutoButtonColor = false

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

local MinButton = Instance.new("TextButton")
MinButton.Size = UDim2.new(0, 36, 0, 36)
MinButton.Position = UDim2.new(1, -86, 0.5, -18)
MinButton.BackgroundColor3 = Color3.fromHex("#3b3b5c")
MinButton.Text = "-"
MinButton.TextColor3 = Color3.new(1,1,1)
MinButton.Font = Enum.Font.GothamBold
MinButton.TextSize = 18
MinButton.Parent = TopBar
MinButton.AutoButtonColor = false

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(1, 0)
MinCorner.Parent = MinButton

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 190, 1, -48)
Sidebar.Position = UDim2.new(0, 0, 0, 48)
Sidebar.BackgroundColor3 = Color3.fromHex("#151521")
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 20)
SidebarCorner.Parent = Sidebar

local SidebarList = Instance.new("UIListLayout")
SidebarList.FillDirection = Enum.FillDirection.Vertical
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Padding = UDim.new(0, 10)
SidebarList.Parent = Sidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 18)
SidebarPadding.PaddingLeft = UDim.new(0, 14)
SidebarPadding.PaddingRight = UDim.new(0, 14)
SidebarPadding.PaddingBottom = UDim.new(0, 18)
SidebarPadding.Parent = Sidebar

local ModeToggle = Instance.new("TextButton")
ModeToggle.Size = UDim2.new(1, 0, 0, 42)
ModeToggle.BackgroundColor3 = Color3.fromHex("#2b2b4a")
ModeToggle.TextColor3 = Color3.new(1,1,1)
ModeToggle.Text = "?? 酷炫黑"
ModeToggle.Font = Enum.Font.GothamBold
ModeToggle.TextSize = 15
ModeToggle.LayoutOrder = 100
ModeToggle.Parent = Sidebar
ModeToggle.AutoButtonColor = false

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ModeToggle

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Thickness = 1
ToggleStroke.Color = Color3.fromHex("#6b6bb6")
ToggleStroke.Parent = ModeToggle

local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -190, 1, -48)
ContentArea.Position = UDim2.new(0, 190, 0, 48)
ContentArea.BackgroundTransparency = 1
ContentArea.Parent = MainFrame

local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Size = UDim2.new(1,0,1,0)
ContentScroll.BackgroundTransparency = 1
ContentScroll.BorderSizePixel = 0
ContentScroll.ClipsDescendants = true
ContentScroll.CanvasSize = UDim2.new(0,0,0,0)
ContentScroll.ScrollBarThickness = 6
ContentScroll.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ContentScroll.ScrollBarImageColor3 = DarkMode and Color3.fromHex("#5a5a9e") or Color3.fromHex("#c0c4e0")
ContentScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
ContentScroll.Parent = ContentArea

local ContentPadding = Instance.new("UIPadding")
ContentPadding.PaddingTop = UDim.new(0, 24)
ContentPadding.PaddingLeft = UDim.new(0, 24)
ContentPadding.PaddingRight = UDim.new(0, 24)
ContentPadding.PaddingBottom = UDim.new(0, 24)
ContentPadding.Parent = ContentScroll

local ContentList = Instance.new("UIListLayout")
ContentList.FillDirection = Enum.FillDirection.Vertical
ContentList.SortOrder = Enum.SortOrder.LayoutOrder
ContentList.Padding = UDim.new(0, 14)
ContentList.HorizontalAlignment = Enum.HorizontalAlignment.Center
ContentList.Parent = ContentScroll

local function ClearContent()
	for _, child in ipairs(ContentScroll:GetChildren()) do
		if child:IsA("Frame") or child:IsA("TextLabel") or child:IsA("TextButton") then
			child:Destroy()
		end
	end
	AllButtons = {}
	AllLabels = {}
	AllTextboxes = {}
end

local colorThemes = {
	dark = {
		bg_primary      = Color3.fromHex("#101018"),
		bg_secondary    = Color3.fromHex("#25253a"),
		bg_textbox_row  = Color3.fromHex("#181825"),
		bg_textbox_input= Color3.fromHex("#303048"),
		text_primary    = Color3.new(1, 1, 1),
		text_secondary  = Color3.fromHex("#a0a0c0"),
		border          = Color3.fromHex("#4a4a7a"),
		fov_circle      = Color3.new(1, 0, 0)
	},
	light = {
		bg_primary      = Color3.fromHex("#f8f9fc"),
		bg_secondary    = Color3.fromHex("#e8ebf5"),
		bg_textbox_row  = Color3.fromHex("#eef0f8"),
		bg_textbox_input= Color3.fromHex("#ffffff"),
		text_primary    = Color3.new(0, 0, 0),
		text_secondary  = Color3.fromHex("#505070"),
		border          = Color3.fromHex("#c0c4e0"),
		fov_circle      = Color3.new(0, 0, 1)
	}
}

local function GetThemeColor(key)
	local theme = DarkMode and colorThemes.dark or colorThemes.light
	return theme[key] or Color3.new(1,1,1)
end

local function UpdateTheme()
	local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local dark = DarkMode

	TweenService:Create(MainFrame, tweenInfo, {BackgroundColor3 = GetThemeColor("bg_primary")}):Play()
	TweenService:Create(MainStroke, tweenInfo, {Color = GetThemeColor("border")}):Play()
	TweenService:Create(TopBar, tweenInfo, {BackgroundColor3 = dark and Color3.fromHex("#1a1a29") or Color3.fromHex("#e4e7f0")}):Play()

	TopGradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, dark and Color3.fromHex("#1a1a29") or Color3.fromHex("#e4e7f0")),
		ColorSequenceKeypoint.new(1, dark and Color3.fromHex("#2b2b4a") or Color3.fromHex("#d4d7e4"))
	})

	TweenService:Create(Sidebar, tweenInfo, {BackgroundColor3 = dark and Color3.fromHex("#151521") or Color3.fromHex("#f1f2f8")}):Play()
	TweenService:Create(ModeToggle, tweenInfo, {BackgroundColor3 = dark and Color3.fromHex("#2b2b4a") or Color3.fromHex("#d4d7e4")}):Play()
	TweenService:Create(MinButton, tweenInfo, {BackgroundColor3 = dark and Color3.fromHex("#3b3b5c") or Color3.fromHex("#a8acb8")}):Play()
	TweenService:Create(Title, tweenInfo, {TextColor3 = GetThemeColor("text_primary")}):Play()
	TweenService:Create(TitleIcon, tweenInfo, {BackgroundColor3 = dark and Color3.fromHex("#6b6bb6") or Color3.fromHex("#4b4bff")}):Play()

	if ToggleStroke then
		TweenService:Create(ToggleStroke, tweenInfo, {Color = dark and Color3.fromHex("#6b6bb6") or Color3.fromHex("#c0c4e0")}):Play()
	end

	ContentScroll.ScrollBarImageColor3 = dark and Color3.fromHex("#5a5a9e") or Color3.fromHex("#c0c4e0")

	for _, tab in ipairs(AllTabs) do
		if tab and tab.Parent then
			TweenService:Create(tab, tweenInfo, {
				BackgroundColor3 = (tab == CurrentTab) and (dark and Color3.fromHex("#6b6bb6") or Color3.fromHex("#4b4bff")) or GetThemeColor("bg_secondary"),
				TextColor3 = GetThemeColor("text_primary")
			}):Play()
			local stroke = tab:FindFirstChildOfClass("UIStroke")
			if stroke then
				TweenService:Create(stroke, tweenInfo, {Color = GetThemeColor("border")}):Play()
			end
		end
	end

	-- 新增：更新所有Label的文字颜色
	for _, label in ipairs(AllLabels) do
		if label and label.Parent then -- 确保Label未被销毁
			TweenService:Create(label, tweenInfo, {
				TextColor3 = GetThemeColor("text_primary") -- 同步主题文字颜色
			}):Play()
		end
	end

	-- 新增：更新所有Textbox相关的文字/背景颜色（可选，避免Textbox主题不同步）
	for _, textboxRow in ipairs(AllTextboxes) do
		if textboxRow and textboxRow.Parent then
			-- 更新Textbox行背景
			TweenService:Create(textboxRow, tweenInfo, {
				BackgroundColor3 = GetThemeColor("bg_textbox_row")
			}):Play()
			-- 更新Label文字
			local label = textboxRow:FindFirstChild("Label")
			if label then
				TweenService:Create(label, tweenInfo, {
					TextColor3 = GetThemeColor("text_primary")
				}):Play()
			end
			-- 更新Input框背景/文字
			local input = textboxRow:FindFirstChild("Input")
			if input then
				TweenService:Create(input, tweenInfo, {
					BackgroundColor3 = GetThemeColor("bg_textbox_input"),
					TextColor3 = GetThemeColor("text_primary"),
					PlaceholderColor3 = dark and Color3.fromHex("#6a6a8a") or Color3.fromHex("#a0a0c0")
				}):Play()
				-- 更新Input的描边
				local inputStroke = input:FindFirstChildOfClass("UIStroke")
				if inputStroke then
					TweenService:Create(inputStroke, tweenInfo, {
						Color = GetThemeColor("border")
					}):Play()
				end
			end
		end
	end

	-- 新增：更新所有Button的背景/文字/描边颜色（可选，避免Button主题不同步）
	for _, button in ipairs(AllButtons) do
		if button and button.Parent then
			-- 区分当前hover/非hover状态，这里取默认非hover背景
			local targetBg = GetThemeColor("bg_secondary")
			-- 如果是Tab的选中态，跳过（Tab已有独立逻辑）
			if not table.find(AllTabs, button) then
				TweenService:Create(button, tweenInfo, {
					BackgroundColor3 = targetBg,
					TextColor3 = GetThemeColor("text_primary")
				}):Play()
				-- 更新Button描边
				local stroke = button:FindFirstChildOfClass("UIStroke")
				if stroke then
					TweenService:Create(stroke, tweenInfo, {
						Color = GetThemeColor("border")
					}):Play()
				end
			end
		end
	end

	if typeof(UpdateAimbotUI) == "function" then
		UpdateAimbotUI()
	end
end

local function CreateRipple(parent)
	local ripple = Instance.new("Frame")
	ripple.Size = UDim2.new(0,0,0,0)
	local ap = parent.AbsolutePosition
	local as = parent.AbsoluteSize
	local gp = ScreenGui.AbsolutePosition
	ripple.Position = UDim2.new(0, ap.X + as.X/2 - gp.X, 0, ap.Y + as.Y/2 - gp.Y)
	ripple.BackgroundColor3 = DarkMode and Color3.new(1,1,1) or Color3.new(0,0,0)
	ripple.BackgroundTransparency = 0.7
	ripple.BorderSizePixel = 0
	ripple.AnchorPoint = Vector2.new(0.5,0.5)
	ripple.ZIndex = 999
	ripple.Parent = ScreenGui

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1,0)
	corner.Parent = ripple

	local info = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local t = TweenService:Create(ripple, info, {
		Size = UDim2.new(0,120,0,120),
		BackgroundTransparency = 1
	})
	t:Play()
	task.delay(0.6, function() ripple:Destroy() end)
end

local function CreateLabel(text)
	local label = Instance.new("TextLabel")
	label.Name = "AstraLabel"
	label.Size = UDim2.new(1, 0, 0, 24)
	label.BackgroundTransparency = 1
	label.Text = text or ""
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.TextSize = 15
	label.TextColor3 = GetThemeColor("text_primary")
	label.Font = Enum.Font.Ubuntu
	label.Parent = ContentScroll
	table.insert(AllLabels, label)
	return label
end

local function CreateButton(text)
	local button = Instance.new("TextButton")
	button.Name = "AstraButton"
	button.Size = UDim2.new(1, 0, 0, 36)
	button.BackgroundColor3 = GetThemeColor("bg_secondary")
	button.Text = text or "按钮"
	button.TextSize = 15
	button.TextColor3 = GetThemeColor("text_primary")
	button.Font = Enum.Font.Ubuntu
	button.AutoButtonColor = false
	button.Parent = ContentScroll

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = button

	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1
	stroke.Color = GetThemeColor("border")
	stroke.Parent = button

	button.MouseEnter:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {
			BackgroundColor3 = DarkMode and Color3.fromHex("#353550") or Color3.fromHex("#d0d4e8")
		}):Play()
	end)

	button.MouseLeave:Connect(function()
		TweenService:Create(button, TweenInfo.new(0.2), {
			BackgroundColor3 = GetThemeColor("bg_secondary")
		}):Play()
	end)

	table.insert(AllButtons, button)
	return button
end

local function CreateTextbox(labelText, defaultValue, minVal, maxVal)
	local row = Instance.new("Frame")
	row.Name = "AstraTextboxRow"
	row.Size = UDim2.new(1, 0, 0, 42)
	row.BackgroundColor3 = GetThemeColor("bg_textbox_row")
	row.BackgroundTransparency = 0
	row.Parent = ContentScroll

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 10)
	corner.Parent = row

	local label = Instance.new("TextLabel")
	label.Name = "Label"
	label.Size = UDim2.new(0, 200, 1, 0)
	label.Position = UDim2.new(0, 12, 0, 0)
	label.BackgroundTransparency = 1
	label.Text = labelText or "标签"
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Center
	label.TextSize = 15
	label.TextColor3 = GetThemeColor("text_primary")
	label.Font = Enum.Font.Ubuntu
	label.Parent = row

	local input = Instance.new("TextBox")
	input.Name = "Input"
	input.Size = UDim2.new(0, 70, 0, 28)
	input.AnchorPoint = Vector2.new(1, 0.5)
	input.Position = UDim2.new(1, -12, 0.5, 0)
	input.BackgroundColor3 = GetThemeColor("bg_textbox_input")
	input.Text = tostring(defaultValue or 0)
	input.TextSize = 14
	input.TextColor3 = GetThemeColor("text_primary")
	input.PlaceholderColor3 = DarkMode and Color3.fromHex("#6a6a8a") or Color3.fromHex("#a0a0c0")
	input.ClearTextOnFocus = false
	input.Font = Enum.Font.Ubuntu
	input.Parent = row

	local inputCorner = Instance.new("UICorner")
	inputCorner.CornerRadius = UDim.new(0, 6)
	inputCorner.Parent = input

	local inputStroke = Instance.new("UIStroke")
	inputStroke.Thickness = 1
	inputStroke.Color = GetThemeColor("border")
	inputStroke.Parent = input

	input.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local num = tonumber(input.Text) or defaultValue
			num = math.clamp(num, minVal or 0, maxVal or 100)
			input.Text = tostring(num)
		end
	end)

	table.insert(AllTextboxes, row)
	return row, input
end

local function CreateTab(name, func)
	local Tab = Instance.new("TextButton")
	Tab.Size = UDim2.new(1, 0, 0, 42)
	Tab.BackgroundColor3 = GetThemeColor("bg_secondary")
	Tab.Text = name
	Tab.TextColor3 = GetThemeColor("text_primary")
	Tab.Font = Enum.Font.Ubuntu
	Tab.TextSize = 15
	Tab.Parent = Sidebar
	Tab.ClipsDescendants = true
	Tab.AutoButtonColor = false

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = Tab

	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 1
	stroke.Color = GetThemeColor("border")
	stroke.Parent = Tab

	Tab.MouseButton1Click:Connect(function()
		CreateRipple(Tab)
		if Tab == CurrentTab then
			return
		end
		if CurrentTab then
			TweenService:Create(CurrentTab, TweenInfo.new(0.2), {
				BackgroundColor3 = GetThemeColor("bg_secondary")
			}):Play()
		end
		CurrentTab = Tab
		TweenService:Create(Tab, TweenInfo.new(0.2), {
			BackgroundColor3 = DarkMode and Color3.fromHex("#6b6bb6") or Color3.fromHex("#4b4bff")
		}):Play()
		ClearContent()
		if func then func() end
	end)

	Tab.MouseEnter:Connect(function()
		if Tab ~= CurrentTab then
			TweenService:Create(Tab, TweenInfo.new(0.2), {
				BackgroundColor3 = DarkMode and Color3.fromHex("#353550") or Color3.fromHex("#d0d4e8")
			}):Play()
		end
	end)

	Tab.MouseLeave:Connect(function()
		if Tab ~= CurrentTab then
			TweenService:Create(Tab, TweenInfo.new(0.2), {
				BackgroundColor3 = GetThemeColor("bg_secondary")
			}):Play()
		end
	end)

	table.insert(AllTabs, Tab)
	return Tab
end

local dragging, dragStart, startPos
TopBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = MainFrame.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

CloseButton.MouseButton1Click:Connect(function()
	CreateRipple(CloseButton)
	TweenService:Create(MainFrame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
	task.wait(0.3)
	MainFrame.Visible = false
end)

MinButton.MouseButton1Click:Connect(function()
	CreateRipple(MinButton)
	IsMinimized = not IsMinimized
	if IsMinimized then
		TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {
			Size = UDim2.new(0, 260, 0, 48),
			Position = UDim2.new(0.5, -130, MainFrame.Position.Y.Scale, MainFrame.Position.Y.Offset)
		}):Play()
		Sidebar.Visible = false
		ContentArea.Visible = false
	else
		TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {
			Size = UDim2.new(0, 740, 0, 460),
			Position = UDim2.new(0.5, -370, MainFrame.Position.Y.Scale, MainFrame.Position.Y.Offset)
		}):Play()
		Sidebar.Visible = true
		ContentArea.Visible = true
	end
end)

ModeToggle.MouseButton1Click:Connect(function()
	CreateRipple(ModeToggle)
	DarkMode = not DarkMode
	ModeToggle.Text = DarkMode and "?? 酷炫黑" or "?? 高调白"
	UpdateTheme()
end)

TweenService:Create(LoadFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()

local loadProgress = 0
local loadConnection = nil
loadConnection = RunService.RenderStepped:Connect(function(dt)
	if loadProgress < 100 then
		loadProgress = math.min(loadProgress + dt * 35, 100)
		TweenService:Create(ProgressBar, TweenInfo.new(0.1), {Size = UDim2.new(loadProgress/100, 0, 1, 0)}):Play()

		if loadProgress == 100 then
			if loadConnection then
				loadConnection:Disconnect()
				loadConnection = nil
			end
			task.wait(0.6)

			TweenService:Create(LoadFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, -210, 0.5, -140 + 50)
			}):Play()

			task.wait(0.4)
			LoadFrame:Destroy()

			MainFrame.Visible = true
			TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart), {
				BackgroundTransparency = 0
			}):Play()
			UpdateTheme()
		end
	end
end)

--●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
--●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
--●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
--●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●
--●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●

CreateTab("首页",function()
	CreateLabel("欢迎使用Astra天枢V1")
	CreateLabel("Astra已准备好与您开启作弊之旅")
	CreateLabel("天枢Astra用户交流群 1083791316")
	CreateLabel(" ")
	CreateLabel("Astra授权经销商：")
	CreateLabel("Nyan0 3570431729")
	CreateLabel("彭于面 2171537679")
end)







local Aimbot = {
	UI_CREATED = false,
	connections = {},
	ui_elements = {},
	aim_enabled = false,
	holding = false,
	settings = {
		smooth = 4,
		fov = 50,
		distance = 200,
		aim_part = "Head",
		team_check = false,
		show_fov = false,
		auto_aim = false,
		through_wall = false,
		lock_target = false,
	},
	fov_gui = nil,
	locked_target = nil
}

function Aimbot:Destroy()
	if type(self.connections) == "table" then
		for _, conn in ipairs(self.connections) do
			if typeof(conn) == "RBXScriptConnection" and conn.Connected then
				conn:Disconnect()
			end
		end
	end
	self.connections = {}

	if self.fov_gui and self.fov_gui:IsA("ScreenGui") then
		self.fov_gui:Destroy()
	end
	self.fov_gui = nil
	self.UI_CREATED = false
	self.ui_elements = {}
	self.aim_enabled = false
	self.holding = false
	self.locked_target = nil
end

function UpdateAimbotUI()
	if not Aimbot.UI_CREATED then return end
	local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad)

	if type(Aimbot.ui_elements.labels) == "table" then
		for _, lbl in ipairs(Aimbot.ui_elements.labels or {}) do
			if lbl and lbl.Parent then
				TweenService:Create(lbl, tweenInfo, {TextColor3 = GetThemeColor("text_primary")}):Play()
			end
		end
	end

	if type(Aimbot.ui_elements.buttons) == "table" then
		for _, btn in ipairs(Aimbot.ui_elements.buttons or {}) do
			if btn and btn.Parent then
				TweenService:Create(btn, tweenInfo, {
					BackgroundColor3 = GetThemeColor("bg_secondary"),
					TextColor3 = GetThemeColor("text_primary")
				}):Play()
				local stroke = btn:FindFirstChildOfClass("UIStroke")
				if stroke then
					TweenService:Create(stroke, tweenInfo, {Color = GetThemeColor("border")}):Play()
				end
			end
		end
	end

	if type(Aimbot.ui_elements.textboxes) == "table" then
		for _, tbx in ipairs(Aimbot.ui_elements.textboxes or {}) do
			if tbx and tbx.Parent then
				local label = tbx:FindFirstChild("Label")
				local input = tbx:FindFirstChild("Input")
				TweenService:Create(tbx, tweenInfo, {BackgroundColor3 = GetThemeColor("bg_textbox_row")}):Play()
				if label then TweenService:Create(label, tweenInfo, {TextColor3 = GetThemeColor("text_primary")}):Play() end
				if input then
					TweenService:Create(input, tweenInfo, {
						BackgroundColor3 = GetThemeColor("bg_textbox_input"),
						TextColor3 = GetThemeColor("text_primary"),
						PlaceholderColor3 = DarkMode and Color3.fromHex("#6a6a8a") or Color3.fromHex("#a0a0c0")
					}):Play()
					local stroke = input:FindFirstChildOfClass("UIStroke")
					if stroke then TweenService:Create(stroke, tweenInfo, {Color = GetThemeColor("border")}):Play() end
				end
			end
		end
	end

	if Aimbot.fov_gui then
		local fov_circle = Aimbot.fov_gui:FindFirstChildWhichIsA("Frame")
		if fov_circle then
			local stroke = fov_circle:FindFirstChildOfClass("UIStroke")
			if stroke then
				TweenService:Create(stroke, tweenInfo, {Color = GetThemeColor("fov_circle")}):Play()
			end
		end
	end
end

function Aimbot:UpdateUIState()
	if not Aimbot.ui_elements.buttons or #Aimbot.ui_elements.buttons < 7 then return end

	local btn_aim = self.ui_elements.buttons[1]
	local btn_fov = self.ui_elements.buttons[2]
	local btn_part = self.ui_elements.buttons[3]
	local btn_team = self.ui_elements.buttons[4]
	local btn_auto = self.ui_elements.buttons[5]
	local btn_wall = self.ui_elements.buttons[6]
	local btn_lock = self.ui_elements.buttons[7]

	if not btn_aim then return end
	btn_aim.Text   = self.aim_enabled and "? Aimbot 开启" or "? Aimbot 关闭"
	btn_fov.Text   = self.settings.show_fov and "? 显示FOV" or "? 隐藏FOV"
	btn_part.Text  = "瞄准部位: " .. self.settings.aim_part
	btn_team.Text  = "组队检测: " .. (self.settings.team_check and "开启" or "关闭")
	btn_auto.Text  = self.settings.auto_aim and "? 自动瞄准" or "? 手动瞄准"
	btn_wall.Text  = self.settings.through_wall and "? 透墙瞄准" or "? 不透墙瞄准"
	btn_lock.Text  = self.settings.lock_target and "? 锁定目标" or "? 不锁定目标"
end

function Aimbot:IsVisible(target_part, cam, plr, txt_dist)
	if not target_part or not cam or not plr or not txt_dist then return false end
	if not target_part:IsDescendantOf(workspace) then return false end
	if self.settings.through_wall then return true end

	local origin = cam.CFrame.Position
	local dist_val = tonumber(txt_dist.Text) or 200
	local direction = (target_part.Position - origin).Unit * dist_val

	local raycast_params = RaycastParams.new()
	raycast_params.FilterType = Enum.RaycastFilterType.Exclude
	raycast_params.FilterDescendantsInstances = {plr.Character or plr}
	raycast_params.IgnoreWater = true

	local raycast_result = workspace:Raycast(origin, direction, raycast_params)
	if not raycast_result then return false end
	return raycast_result.Instance:IsDescendantOf(target_part.Parent)
end

function Aimbot:GetTarget(cam, plr, txt_dist, txt_fov)
	if not cam or not plr or not txt_dist or not txt_fov then return nil end

	if self.settings.lock_target and self.locked_target and self.locked_target:IsDescendantOf(workspace) then
		return self.locked_target
	end

	local best = nil
	local max_dist = math.huge
	local cam_pos = cam.CFrame.Position
	local cam_look = cam.CFrame.LookVector
	local max_distance = tonumber(txt_dist.Text) or 200
	local fov = tonumber(txt_fov.Text) or 50
	local fov_half_rad = math.rad(fov / 2)
	local fov_cos = math.cos(fov_half_rad)

	for _, p in pairs(game:GetService("Players"):GetPlayers()) do
		if p == plr or not p.Character then continue end
		local humanoid = p.Character:FindFirstChild("Humanoid")
		if not humanoid or humanoid.Health <= 0 then continue end

		local aim_part = p.Character:FindFirstChild(self.settings.aim_part)
		if not aim_part then continue end

		if self.settings.team_check and p.Team and plr.Team and p.Team == plr.Team then continue end
		if not self:IsVisible(aim_part, cam, plr, txt_dist) then continue end

		local dist = (aim_part.Position - cam_pos).Magnitude
		if dist > max_distance then continue end

		local to_target = (aim_part.Position - cam_pos).Unit
		local dot_product = cam_look:Dot(to_target)
		if dot_product < fov_cos then continue end

		if dist < max_dist then
			max_dist = dist
			best = aim_part
		end
	end
	return best
end

CreateTab("独家绿演自瞄", function()
	Aimbot:Destroy()

	Aimbot.UI_CREATED = false
	Aimbot.ui_elements = {labels = {}, buttons = {}, textboxes = {}}
	local Players = game:GetService("Players")
	local UIS = game:GetService("UserInputService")
	local RS = game:GetService("RunService")
	local Workspace = game:GetService("Workspace")
	local plr = Players.LocalPlayer
	local cam = Workspace.CurrentCamera

	if not cam then return end

	local header = CreateLabel("?? Aimbot 瞄准")
	table.insert(Aimbot.ui_elements.labels, header)

	local header1 = CreateLabel("Astra独家绿演")
	table.insert(Aimbot.ui_elements.labels, header1)

	local header2 = CreateLabel("SMOOTH越小越精准，FOV是瞄准范围，推荐SMOOTH 2~50, FOV 15~30")
	table.insert(Aimbot.ui_elements.labels, header2)

	local header3 = CreateLabel("按键为N开启/关闭自瞄，仅支持电脑绿演。")
	table.insert(Aimbot.ui_elements.labels, header3)

	local header4 = CreateLabel("快捷键：7开/关自瞄 8暴力自瞄 9透墙瞄准 0锁定目标")
	table.insert(Aimbot.ui_elements.labels, header4)

	local row_smooth, txt_smooth = CreateTextbox("平滑度", Aimbot.settings.smooth, 1, 20)
	local row_fov, txt_fov = CreateTextbox("FOV", Aimbot.settings.fov, 10, 120)
	local row_dist, txt_dist = CreateTextbox("瞄准距离", Aimbot.settings.distance, 50, 800)
	local row_sense, txt_sense = CreateTextbox("灵敏度", 0.8, 0.1, 2)
	local row_assist, txt_assist = CreateTextbox("辅助强度", 0.5, 0, 1)

	table.insert(Aimbot.ui_elements.textboxes, row_smooth)
	table.insert(Aimbot.ui_elements.textboxes, row_fov)
	table.insert(Aimbot.ui_elements.textboxes, row_dist)
	table.insert(Aimbot.ui_elements.textboxes, row_sense)
	table.insert(Aimbot.ui_elements.textboxes, row_assist)

	local spacer = CreateLabel("")
	table.insert(Aimbot.ui_elements.labels, spacer)

	local btn_aim = CreateButton("? Aimbot 关闭")
	local btn_fov = CreateButton("? 隐藏FOV")
	local btn_part = CreateButton("瞄准部位: Head")
	local btn_team = CreateButton("组队检测: 关闭")
	local btn_auto = CreateButton("? 暴力自瞄")
	local btn_wall = CreateButton("? 透墙瞄准")
	local btn_lock = CreateButton("? 锁定目标")

	local buttons = {btn_aim, btn_fov, btn_part, btn_team, btn_auto, btn_wall, btn_lock}
	for _, btn in ipairs(buttons) do
		table.insert(Aimbot.ui_elements.buttons, btn)
	end

	Aimbot.fov_gui = Instance.new("ScreenGui")
	Aimbot.fov_gui.Name = "AimbotFov"
	Aimbot.fov_gui.Parent = plr.PlayerGui
	local fov_circle = Instance.new("Frame")
	fov_circle.Size = UDim2.new(0,0,0,0)
	fov_circle.Position = UDim2.new(0.5,0,0.5,0)
	fov_circle.AnchorPoint = Vector2.new(0.5, 0.5)
	fov_circle.BackgroundTransparency = 1
	fov_circle.Parent = Aimbot.fov_gui
	local stroke = Instance.new("UIStroke")
	stroke.Thickness = 2
	stroke.Color = GetThemeColor("fov_circle")
	stroke.Parent = fov_circle
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(1,0)
	corner.Parent = fov_circle

	table.insert(Aimbot.connections, RS.RenderStepped:Connect(function()
		fov_circle.Visible = Aimbot.aim_enabled and Aimbot.settings.show_fov
		if Aimbot.settings.show_fov then
			local fov_value = tonumber(txt_fov.Text) or 50
			local fov_size = cam.ViewportSize.X / 2 * math.tan(math.rad(fov_value/2))
			fov_circle.Size = UDim2.new(0, fov_size*2, 0, fov_size*2)
		end
		if not Aimbot.aim_enabled then return end
		local target = Aimbot:GetTarget(cam, plr, txt_dist, txt_fov)
		if not target then return end
		if Aimbot.holding or Aimbot.settings.auto_aim then
			local target_cf = CFrame.new(cam.CFrame.Position, target.Position)
			local smooth_val = tonumber(txt_smooth.Text) or 4
			local sense = tonumber(txt_sense.Text) or 0.8
			local assist = tonumber(txt_assist.Text) or 0.5
			local speed = (0.3 * sense * (1 + assist)) / smooth_val
			cam.CFrame = cam.CFrame:Lerp(target_cf, speed)
		end
	end))

	table.insert(Aimbot.connections, UIS.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Keyboard then
			local key = input.KeyCode
			if key == Enum.KeyCode.Seven then
				Aimbot.aim_enabled = not Aimbot.aim_enabled
				Aimbot:UpdateUIState()
			elseif key == Enum.KeyCode.Eight then
				Aimbot.settings.auto_aim = not Aimbot.settings.auto_aim
				Aimbot:UpdateUIState()
			elseif key == Enum.KeyCode.Nine then
				Aimbot.settings.through_wall = not Aimbot.settings.through_wall
				Aimbot:UpdateUIState()
			elseif key == Enum.KeyCode.Zero then
				Aimbot.settings.lock_target = not Aimbot.settings.lock_target
				Aimbot.locked_target = Aimbot.settings.lock_target and Aimbot:GetTarget(cam, plr, txt_dist, txt_fov) or nil
				Aimbot:UpdateUIState()
			end
		elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
			Aimbot.holding = true
		end
	end))

	table.insert(Aimbot.connections, UIS.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			Aimbot.holding = false
		end
	end))

	btn_aim.MouseButton1Click:Connect(function()
		CreateRipple(btn_aim)
		Aimbot.aim_enabled = not Aimbot.aim_enabled
		Aimbot:UpdateUIState()
	end)

	btn_fov.MouseButton1Click:Connect(function()
		CreateRipple(btn_fov)
		Aimbot.settings.show_fov = not Aimbot.settings.show_fov
		Aimbot:UpdateUIState()
	end)

	btn_part.MouseButton1Click:Connect(function()
		CreateRipple(btn_part)
		local parts = {"Head","UpperTorso","LowerTorso","HumanoidRootPart"}
		local idx = table.find(parts, Aimbot.settings.aim_part) or 1
		Aimbot.settings.aim_part = parts[idx % #parts + 1]
		Aimbot:UpdateUIState()
	end)

	btn_team.MouseButton1Click:Connect(function()
		CreateRipple(btn_team)
		Aimbot.settings.team_check = not Aimbot.settings.team_check
		Aimbot:UpdateUIState()
	end)

	btn_auto.MouseButton1Click:Connect(function()
		CreateRipple(btn_auto)
		Aimbot.settings.auto_aim = not Aimbot.settings.auto_aim
		Aimbot:UpdateUIState()
	end)

	btn_wall.MouseButton1Click:Connect(function()
		CreateRipple(btn_wall)
		Aimbot.settings.through_wall = not Aimbot.settings.through_wall
		Aimbot:UpdateUIState()
	end)

	btn_lock.MouseButton1Click:Connect(function()
		CreateRipple(btn_lock)
		Aimbot.settings.lock_target = not Aimbot.settings.lock_target
		Aimbot.locked_target = Aimbot.settings.lock_target and Aimbot:GetTarget(cam, plr, txt_dist, txt_fov) or nil
		Aimbot:UpdateUIState()
	end)

	Aimbot.UI_CREATED = true
	Aimbot:UpdateUIState()
	UpdateAimbotUI()
end)

