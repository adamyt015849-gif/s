


if game:GetService('ContentProvider').RequestQueueSize > 10 then           
    repeat task.wait()
    until game:GetService('ContentProvider').RequestQueueSize <= 10
end

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)


local shared = {
    version = "V3.0.0";
    folders = {
        main = 'IceWare',
        games = 'IceWare/Games',
        analytics = 'IceWare/Analytics',
    };
}

for _, folder in pairs(shared.folders) do
    if not isfolder(folder) then
        print(string.format("[ ICEWARE ] Setting up %s folder", folder))
        makefolder(folder)
    end
end

writefile("IceWare/Discord.txt", "https://discord.gg/sn2Etx6M8G")

local games = {
    [{93978595733734}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/ViolenceDistrict/Main.lua"; -- Violence District
    [{79546208627805}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/Others/Lobbies.lua"; -- 99 Nights (Lobby)
    [{126509999114328}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/99Night/Main.lua"; -- 99 Nights (Game)
    [{13822562292}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/MidnightChasers/Main.lua"; -- Midnight Chasers (Tokyo)
    [{139048751758942}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/MidnightChasers/Main.lua"; -- Midnight Chasers (Salt Flats)
    [{133327835421432}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/MidnightChasers/Main.lua"; -- Midnight Chasers (Tokyo CUSTOM)
    [{121510074321001}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/MidnightChasers/Main.lua"; -- Midnight Chasers (Salt Flats CUSTOM)
    [{3351674303}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/DrivingEmpire/Main.lua"; -- Driving Empire
    [{1554960397}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/CDT/Main.lua"; -- Car Dealership Tycoon
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        task.wait(); loadstring(game:HttpGet(url))()
    end
end


if getgenv().Settings and getgenv().Settings.Analytics then
    game:GetService("LogService").MessageOut:Connect(function(...) 
        appendfile("IceWare/analytics/" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. "_" .. os.date("%Y-%m-%d") .. ".log", "[" .. os.date("%H:%M:%S") .. "] [" .. identifyexecutor() .. "] " .. select(1, ...) .. "\n") 
    end)
end