-- Warning : Some executors, especially bad ones might bug out resulting into you not being able to leave, be cautious.

makefolder("plsdontclickme")
local videos = {
{name = "pitchbend.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/pitchbend.mp4"},
{name = "anameforacertainfile.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/anameforacetainfile.mp4"},
{name = "idontknowthetitle.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/idontknowthetitle.mp4"},
{name = "notes.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/notes.mp4"},
{name = "seemsprettycool.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/seemsprettycool.mp4"},
{name = "rat.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/videoplayback%20(5).mp4"},
{name = "whatarethoselol.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/whatarethoselol.mp4"},
{name = "whatisavideo.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/whatisavideo.mp4"}
{name = "coolvideoiguess.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/coolvideoiguess.mp4"}
{name = "hellarethose.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/hellarethose.mp4"}
{name = "randomizingyoursongs.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/randomizingyoursongs.mp4"}
{name = "synthoutgoesinsne.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/synthoutgoesinsne.mp4"}
{name = "thisvideohasmusicinit.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/thisvideohasmusicinit.mp4"}
{name = "whatisareversereverb.mp4", url = "https://github.com/HashtagDad/trollsynthouing/raw/refs/heads/main/whatisareversereverb.mp4"}
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
local listofvideos = {
	"isthat7granddad.mp4"
}
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
        mousemoverel(-50000, -50000)
        keypress(0x1B)
        keyrelease(0x1B)
    end)
end
function wronggame()
    repeat task.wait() until isrbxactive()
    nosounds()
    stuckcursor()
    destroyui()
	videoplay(tostring(listofvideos[math.random(1, #listofvideos)]))
end
repeat task.wait() until isrbxactive()
nosounds()
disablelimitations()
destroyui()
videoplay(chosen.name)
