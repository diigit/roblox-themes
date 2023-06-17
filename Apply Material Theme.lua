local httpService = game:GetService('HttpService')
local studioSettings = settings().Studio

local url = `https://raw.githubusercontent.com/diigit/roblox-themes/main/Material%20Theme.json`

local json = httpService:GetAsync(url)
if not json then warn('Could not update theme! Invalid URL (Is the selected theme valid?)') end

for name, color in pairs(httpService:JSONDecode(json)) do
	if not studioSettings[name] then warn(`{name} does not exist!`) continue end	
	studioSettings[name] = Color3.fromRGB(color[1], color[2], color[3])
end