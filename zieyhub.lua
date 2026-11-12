local _G = (getgenv and getgenv()) or _G
for _, v in ipairs({"__ZieyHUB"}) do
    if _G[v] and _G[v].Cleanup then
        pcall(_G[v].Cleanup)
    end
    _G[v] = nil
end

local _0x1 = {}
_G.__ZieyHUB = _0x1

local function _0x2()
    return _G.__ZieyHUB == _0x1 and not _0x1.Failed
end

do
    local _0x3, _0x4
    local _0x5, _0x6 = "Memulai Script ziey", os.clock()
    
    function _0x1.GuiParent(_0x7)
        if not _0x7 then
            local _0x8 = game:GetService("Players").LocalPlayer
            _0x7 = _0x8 and (_0x8:FindFirstChildOfClass("PlayerGui") or _0x8:FindFirstChild("PlayerGui"))
        end
        local _0x9 = _0x7
        if type(gethui) == "function" then
            local _0xa, _0xb = pcall(gethui)
            if _0xa and _0xb then
                _0x9 = _0xb
            end
        end
        if _0x9 then
            local _0xc = Instance.new("ScreenGui")
            local _0xd = pcall(function()
                _0xc.Parent = _0x9
            end)
            pcall(function()
                _0xc:Destroy()
            end)
            if _0xd then
                return _0x9
            end
        end
        assert(_0x7, "PlayerGui belum tersedia; tunggu game selesai masuk")
        return _0x7
    end

    local function _0xe(_0xf)
        if not _0x4 then
            pcall(function()
                _0x3 = Instance.new("ScreenGui")
                _0x3.Name = "ZieyHUBStartup"
                _0x3.ResetOnSpawn = false
                _0x3.IgnoreGuiInset = true
                _0x3.DisplayOrder = 2000000
                _0x3.Parent = _0x1.GuiParent()

                local _0x10 = Instance.new("Frame")
                _0x10.AnchorPoint = Vector2.new(0.5, 1)
                _0x10.Position = UDim2.new(0.5, 0, 0.97, 0)
                _0x10.Size = UDim2.new(0.9, 0, 0, 154)
                _0x10.BackgroundColor3 = Color3.fromRGB(20, 22, 29)
                _0x10.Parent = _0x3

                _0x4 = Instance.new("TextLabel")
                _0x4.Position = UDim2.new(0, 10, 0, 8)
                _0x4.Size = UDim2.new(1, -42, 1, -16)
                _0x4.BackgroundTransparency = 1
                _0x4.Font = Enum.Font.Code
                _0x4.TextSize = 13
                _0x4.TextColor3 = Color3.fromRGB(245, 245, 245)
                _0x4.TextWrapped = true
                _0x4.TextXAlignment = Enum.TextXAlignment.Left
                _0x4.TextYAlignment = Enum.TextYAlignment.Top
                _0x4.Parent = _0x10

                local _0x11 = Instance.new("TextButton")
                _0x11.Size = UDim2.new(0, 26, 0, 26)
                _0x11.Position = UDim2.new(1, -30, 0, 4)
                _0x11.Text = "X"
                _0x11.Parent = _0x10
                _0x11.MouseButton1Click:Connect(function()
                    _0x1.CloseBoot()
                end)
            end)
        end
        if _0x4 then
            pcall(function()
                _0x4.Text = "ziey HUB Script\n" .. tostring(_0xf):sub(1, 1100)
            end)
        end
    end

    function _0x1.Report(_0xf)
        _0x5, _0x6 = tostring(_0xf), os.clock()
        warn("[ziey HUB startup] " .. _0x5)
        _0xe(_0x5)
    end

    function _0x1.CloseBoot()
        if _0x3 then
            pcall(function()
                _0x3:Destroy()
            end)
        end
        _0x3, _0x4 = nil, nil
    end

    function _0x1.FailStartup(_0xf)
        _0x1.Failed = true
        _0x1.ResetPartial()
        _0x1.Report("GAGAL: " .. _0x5 .. "\n" .. tostring(_0xf) .. "\nKirim screenshot kotak ini.")
    end

    function _0x1.ResetPartial()
        if _0x1.UnbindInput then
            pcall(_0x1.UnbindInput)
        end
        for _, _0x12 in ipairs(_0x1.StartupConnections or {}) do
            pcall(function()
                _0x12:Disconnect()
            end)
        end
        for _, _0x13 in ipairs(_0x1.StartupGuis or {}) do
            pcall(function()
                _0x13:Destroy()
            end)
        end
        if _0x1.StartupWindow then
            pcall(function()
                _0x1.StartupWindow:Destroy()
            end)
        end
    end

    _0x1.Cleanup = function()
        _0x1.ResetPartial()
        _0x1.CloseBoot()
    end

    _0x1.Report(_0x5)
    task.spawn(function()
        while _0x2() and not _0x1.Ready and not _0x1.Failed do
            task.wait(0.5)
            local _0x14 = math.floor(os.clock() - _0x6)
            if not _0x1.Ready and not _0x1.Failed and _0x14 >= 10 then
                _0xe("Masih memuat (" .. _0x14 .. " detik): " .. _0x5 .. "\nKirim screenshot jika tetap berhenti di sini.")
            end
        end
    end)
end

local _0x15, _0x16 = xpcall(function()
    do
        local _0x17 = getthreadidentity or get_thread_identity or getidentity or (syn and syn.get_thread_identity)
        if type(_0x17) == "function" then
            pcall(function()
                _0x1.Ident = _0x17()
            end)
        end
        _0x1.Exec = coroutine.create(function(_0x18)
            while true do
                _0x18.ok, _0x18.err = pcall(_0x18.fn)
                _0x18.done = true
                _0x1.ExecBusy = false
                _0x18 = coroutine.yield()
            end
        end)
    end

    local _0x19 = game:GetService("Players")
    local _0x1a = game:GetService("ReplicatedStorage")
    local _0x1b = game:GetService("RunService")
    local _0x1c = game:GetService("VirtualUser")
    local _0x1d = game:GetService("UserInputService")
    local _0x1e = _0x19.LocalPlayer
    
    _0x1.Report("Menunggu PlayerGui")
    assert(_0x1e, "Masuk ke game Roblox terlebih dahulu")
    local _0x1f = _0x1e:WaitForChild("PlayerGui", 15)
    assert(_0x1f, "PlayerGui belum tersedia setelah 15 detik; masuk world lalu execute ulang")

    local _0x20 = (function()
        local _0x21 = { Modules = {}, Errors = {}, Sources = {}, Missing = {}, Version = "startup r10" }
        local _0x22 = { itemdb = true, inventory = true, net = true, particles = true, worldmenu = true, roles = true, sfx = true, splice = true }
        local _0x23, _0x24, _0x25, _0x26 = {}, {}, nil, nil

        local function _0x27(_0x28)
            _0x1.Report("Data game: " .. tostring(_0x28))
            local _0x29 = _0.PianLaunchReport
            if type(_0x29) == "function" then
                pcall(_0x29, "Startup r10: " .. _0x28)
            end
        end

        local function _0x2a(_0x2b, _0x2c)
            local _0x2d, _0x2e = pcall(function()
                return _0x2b[_0x2c]
            end)
            if _0x2d then return _0x2e end
        end

        local function _0x2f(_0x30)
            local _0x2d, _0x2e = pcall(function()
                return _0x30:GetFullName()
            end)
            return _0x2d and tostring(_0x2e) or tostring(_0x2a(_0x30, "Name") or "modul")
        end

        local function _0x31(_0x32)
            if _0x23[_0x32] then return end
            _0x23[_0x32] = true
            local _0x28 = _0x2a(_0x32, "Name")
            if type(_0x28) ~= "string" then return end
            local _0x33 = string.lower(_0x28)
            if _0x33 == "worldremotes" and not _0x25 then _0x25 = _0x32 end
            if _0x33 == "gamegui" and not _0x26 then _0x26 = _0x32 end
            if not _0x22[_0x33] then return end
            local _0x2d, _0x34 = pcall(function()
                return _0x32:IsA("ModuleScript")
            end)
            if not (_0x2d and _0x34) then return end
            local _0x35 = _0x21.Modules[_0x33]
            if not _0x35 then
                _0x35 = {}
                _0x21.Modules[_0x33] = _0x35
            end
            if #_0x35 < 8 then
                _0x35[#_0x35 + 1] = _0x32
            end
        end

        local _0x36 = _0x1a:FindFirstChild("Shared")
        if _0x36 then
            local _0x2d, _0x37 = pcall(function()
                return _0x36:GetChildren()
            end)
            if _0x2d then
                for _, _0x30 in ipairs(_0x37) do
                    _0x31(_0x30)
                end
            end
        end

        _0x24[#_0x24 + 1] = _0x1a
        _0x24[#_0x24 + 1] = _0x1f
        local _0x38 = _0x1e:FindFirstChild("PlayerScripts")
        if _0x38 then _0x24[#_0x24 + 1] = _0x38 end
        local _0x39, _0x3a = pcall(game.GetService, game, "ReplicatedFirst")
        if _0x39 and _0x3a then _0x24[#_0x24 + 1] = _0x3a end

        _0x27("mencari modul yang tersedia")
        for _, _0x3b in ipairs(_0x24) do
            _0x31(_0x3b)
            local _0x2d, _0x3c = pcall(function()
                return _0x3b:GetDescendants()
            end)
            if _0x2d and type(_0x3c) == "table" then
                for _0x3d, _0x30 in ipairs(_0x3c) do
                    _0x31(_0x30)
                    if _0x3d % 400 == 0 then task.wait() end
                end
            end
        end

        for _, _0x3e in ipairs({ getloadedmodules or false, getnilinstances or false }) do
            if type(_0x3e) == "function" then
                local _0x2d, _0x3f = pcall(_0x3e)
                if _0x2d and type(_0x3f) == "table" then
                    for _, _0x30 in pairs(_0x3f) do
                        _0x31(_0x30)
                    end
                end
            end
        end

        function _0x21:FindFirstChild(_0x28)
            local _0x35 = self.Modules[string.lower(tostring(_0x28))]
            return _0x35 and _0x35[1] or nil
        end

        function _0x21.catalog(_0x40)
            if type(_0x40) ~= "table" then return false end
            local _0x41, _0x42 = 0, 0
            for _0x43, _0x44 in next, _0x40 do
                _0x42 += 1
                if type(_0x43) == "number" and type(_0x44) == "table"
                    and type(rawget(_0x44, "name")) == "string"
                    and (type(rawget(_0x44, "hits")) == "number" or type(rawget(_0x44, "solid")) == "boolean"
                        or type(rawget(_0x44, "grow")) == "number") then
                    _0x41 += 1
                    if _0x41 >= 3 then return true end
                end
                if _0x42 >= 64 then break end
            end
            return false
        end

        function _0x21.network(_0x40)
            if type(_0x40) ~= "table" then return false end
            local _0x45, _0x46 = rawget(_0x40, "tile"), rawget(_0x40, "act")
            return type(_0x45) == "table" and type(_0x2a(_0x45, "send")) == "function"
                and type(_0x46) == "table" and type(_0x2a(_0x46, "send")) == "function"
        end

        local function _0x47(_0x30)
            if not (task and type(task.spawn) == "function" and type(task.wait) == "function") then
                return false, "task.spawn / task.wait tidak tersedia"
            end
            local _0x48 = { done = false }
            local _0x49 = task.spawn(function()
                _0x48.ok, _0x48.value = pcall(require, _0x30)
                _0x48.done = true
            end)
            local _0x4a = os.clock()
            while not _0x48.done and os.clock() - _0x4a < 3 do task.wait() end
            if not _0x48.done then
                if type(task.cancel) == "function" then pcall(task.cancel, _0x49) end
                return false, "require melewati batas 3 detik"
            end
            return _0x48.ok, _0x48.value
        end

        local function _0x4b(_0x28, _0x4c)
            local _0x4d = _0x21.Modules[string.lower(_0x28)] or {}
            for _, _0x30 in ipairs(_0x4d) do
                _0x27("memuat " .. _0x28 .. " dari " .. _0x2f(_0x30))
                local _0x2d, _0x40 = _0x47(_0x30)
                if _0x2d and type(_0x40) == "table" and (not _0x4c or _0x4c(_0x40)) then
                    _0x21.Sources[_0x28] = _0x2f(_0x30)
                    return true, _0x40
                end
                _0x21.Errors[#_0x21.Errors + 1] = _0x28 .. " @ " .. _0x2f(_0x30) .. ": "
                    .. (_0x2d and "format modul tidak cocok" or tostring(_0x40))
            end
            return false, nil
        end

        function _0x21:Load(_0x28)
            return _0x4b(_0x28)
        end

        local _0x4e
        _0x4e, _0x21.ItemDB = _0x4b("ItemDB", _0x21.catalog)
        _, _0x21.Inventory = _0x4b("Inventory")
        _, _0x21.Net = _0x4b("Net", _0x21.network)
        _, _0x21.Particles = _0x4b("Particles")
        _, _0x21.Menu = _0x4b("WorldMenu")
        _, _0x21.Roles = _0x4b("Roles")
        _, _0x21.Sfx = _0x4b("Sfx")

        if (not _0x4e or not _0x21.NetOK) and type(getgc) == "function" then
            _0x27("mencari data item / jaringan yang sudah dimuat game")
            local _0x2d, _0x4f = pcall(getgc, true)
            if _0x2d and type(_0x4f) == "table" then
                local function _0x50(_0x40, _0x51)
                    if type(_0x40) ~= "table" or _0x40 == _G or _0x40 == _G or _0x40 == _0x21 then return end
                    if not _0x4e and _0x21.catalog(_0x40) then
                        _0x4e, _0x21.ItemDB = true, _0x40
                        _0x21.Sources.ItemDB = _0x51
                    end
                    if not _0x21.NetOK and _0x21.network(_0x40) then
                        _0x21.NetOK, _0x21.Net = true, _0x40
                        _0x21.Sources.Net = _0x51
                    end
                end
                local _0x52 = 0
                for _, _0x40 in pairs(_0x4f) do
                    _0x50(_0x40, "data game yang sudah dimuat (getgc)")
                    _0x52 += 1
                    if _0x4e and _0x21.NetOK then break end
                    if _0x52 % 300 == 0 then task.wait() end
                end
                if not _0x4e or not _0x21.NetOK then
                    _0x27("menelusuri data modul yang ditangkap fungsi game")
                    local _0x53 = getupvalues or (debug and debug.getupvalues)
                    local _0x54 = getupvalue or (debug and debug.getupvalue)
                    for _, _0x55 in pairs(_0x4f) do
                        if type(_0x55) == "function" then
                            local _0x56
                            if type(_0x53) == "function" then
                                local _0x57, _0x58 = pcall(_0x53, _0x55)
                                if _0x57 and type(_0x58) == "table" then _0x56 = _0x58 end
                            end
                            if _0x56 then
                                for _, _0x40 in pairs(_0x56) do _0x50(_0x40, "upvalue fungsi game") end
                            elseif type(_0x54) == "function" then
                                for _0x3d = 1, 40 do
                                    local _0x59, _0x5a, _0x5b = pcall(_0x54, _0x55, _0x3d)
                                    if not _0x59 or (_0x5a == nil and _0x5b == nil) then break end
                                    _0x50(_0x5b ~= nil and _0x5b or _0x5a, "upvalue fungsi game")
                                end
                            end
                        end
                        _0x52 += 1
                        if _0x4e and _0x21.NetOK then break end
                        if _0x52 % 200 == 0 then task.wait() end
                    end
                end
            end
        end

        _0x21.Inventory = _0x21.Inventory or {}
        _0x21.GameGui = _0x26 or _0x1f
        _0x21.Remotes = _0x25
        if not _0x25 then
            _0x21.EmptyRemotes = Instance.new("Folder")
            _0x21.EmptyRemotes.Name = "ZieyHUBRemotes"
            _0x21.Remotes = _0x21.EmptyRemotes
        end
        for _, _0x5c in ipairs({ {"Inventory", _0x21.InventoryOK}, {"Net", _0x21.NetOK},
            {"Particles", _0x21.ParticlesOK}, {"WorldMenu", _0x21.MenuOK}, {"Roles", _0x21.RolesOK}, {"Sfx", _0x21.SfxOK} }) do
            if not _0x5c[2] then _0x21.Missing[#_0x21.Missing + 1] = _0x5c[1] end
        end
        _0x21.Status = "ItemDB: " .. tostring(_0x21.Sources.ItemDB or "belum ditemukan")
            .. (#_0x21.Missing > 0 and (" | modul opsional belum terbaca: " .. table.concat(_0x21.Missing, ", ")) or "")
        if not _0x4e then
            local _0x5d = {}
            for _0x28, _0x4d in pairs(_0x21.Modules) do
                if #_0x4d > 0 then _0x5d[#_0x5d + 1] = _0x28 .. " @ " .. _0x2f(_0x4d[1]) end
            end
            table.sort(_0x5d)
            local _0x28 = "ItemDB belum ditemukan. Script tidak akan menunggu Shared tanpa batas.\n"
                .. "Modul terbaca: " .. (#_0x5d > 0 and table.concat(_0x5d, "; ") or "tidak ada nama modul lama")
                .. (#_0x21.Errors > 0 and ("\n" .. table.concat(_0x21.Errors, "\n")) or "")
            _0x27(_0x28)
            pcall(function()
                local _0x3 = Instance.new("ScreenGui")
                _0x3.Name = "ZieyHUBStartupProblem"
                _0x3.ResetOnSpawn = false
                _0x3.DisplayOrder = 1000000
                _0x3.Parent = _0x1f
                local _0x4 = Instance.new("TextLabel")
                _0x4.Size = UDim2.new(0.9, 0, 0.55, 0)
                _0x4.Position = UDim2.new(0.05, 0, 0.4, 0)
                _0x4.BackgroundColor3 = Color3.fromRGB(20, 22, 29)
                _0x4.TextColor3 = Color3.new(1, 1, 1)
                _0x4.TextWrapped = true
                _0x4.TextSize = 15
                _0x4.Text = "PIAN STARTUP r10\n" .. _0x28:sub(1, 1400) .. "\nKirim screenshot kotak ini."
                _0x4.Parent = _0x3
            end)
            if _0x21.EmptyRemotes then _0x21.EmptyRemotes:Destroy() end
            error(_0x28, 0)
        end
        _0x27(_0x21.Status)
        return _0x21
    end)()

    local _0x5e = _0x20.Remotes
    local _0x5f = _0x5e:FindFirstChild("SetTile")
    local _0x60 = _0x20.ItemDB
    local _0x61 = _0x20.Inventory
    local _0x62, _0x63 = _0x20.NetOK, _0x20.Net
    local _0x64 = _0x20.GameGui
    local _0x65, _0x66 = _0x20.ParticlesOK, _0x20.Particles
    local _0x67, _0x68 = _0x20.MenuOK, _0x20.Menu
    local _0x69, _0x6a = _0x20.RolesOK, _0x20.Roles
    local _0x6b, _0x6c = _0x20.SfxOK, _0x20.Sfx

    local _0x6d = (function()
        local _0x6e = {
            "https://github.com/Footagesus/WindUI/releases/download/1.6.66/main.lua",
            "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua",
        }
        local _0x6f = {}
        for _0x3d, _0x70 in ipairs(_0x6e) do
            _0x1.Report(("Mengunduh UI (%d/%d)"):format(_0x3d, #_0x6e))
            local _0x48 = { done = false }
            local _0x49 = task.spawn(function()
                _0x48.ok, _0x48.body = pcall(game.HttpGet, game, _0x70)
                _0x48.done = true
            end)
            local _0x71 = os.clock()
            while not _0x48.done and _0x2() and os.clock() - _0x71 < 12 do task.wait(0.05) end
            if not _0x2() then error("Sesi tes sudah diganti / ditutup", 0) end
            if not _0x48.done then
                if type(task.cancel) == "function" then pcall(task.cancel, _0x49) end
                _0x6f[#_0x6f + 1] = "Jalur " .. _0x3d .. ": HTTP melewati 12 detik"
            elseif not _0x48.ok or type(_0x48.body) ~= "string" or #_0x48.body < 1000 then
                _0x6f[#_0x6f + 1] = "Jalur " .. _0x3d .. ": " .. tostring(_0x48.body):sub(1, 150)
            else
                _0x1.Report("Memuat pustaka UI dari jalur " .. _0x3d)
                local _0x72, _0x73 = loadstring(_0x48.body, "=ZieyHUBWindUI")
                if _0x72 then
                    if type(getfenv) == "function" and type(setfenv) == "function" then
                        local _0x59, _0x74 = pcall(getfenv, _0x72)
                        if _0x59 and type(_0x74) == "table" then
                            local _0x75 = setmetatable({
                                gethui = function() return _0x1.GuiParent(_0x1f) end,
                            }, { __index = _0x74, __newindex = _0x74 })
                            pcall(setfenv, _0x72, _0x75)
                        end
                    end
                    local _0x2d, _0x76 = pcall(_0x72)
                    if _0x2d and type(_0x76) == "table" and type(_0x76.CreateWindow) == "function" then return _0x76 end
                    _0x6f[#_0x6f + 1] = "Jalur " .. _0x3d .. ": " .. tostring(_0x76):sub(1, 180)
                else
                    _0x6f[#_0x6f + 1] = "Jalur " .. _0x3d .. ": " .. tostring(_0x73):sub(1, 180)
                end
            end
        end
        error("WindUI gagal dimuat. " .. table.concat(_0x6f, " | "), 0)
    end)()

    local _0x77 = {
        Running = false,
        Mode = "Place + Break",
        PlaceMs = 250,
        BreakMs = 220,
        AfterBreakMs = 300,
        HitsOverride = 0,
        BreakBackground = true,
        MultiTarget = 1,
        SelectedId = nil,
        Offsets = {},
        CalibX = 0,
        CalibY = 0,
        AntiAfk = true,
        MutePunch = true,
        Visual = true,
        LiteMode = false,
        AutoCollect = true,
        CollectAround = false,
        CollectRadius = 3,
        CollectMode = "Sentuhan",
        Override = nil,
        Quiet = false,
        Cycles = 0,
        Placed = 0,
        Broken = 0,
        Collected = 0,
        CollectFail = 0,
        LastAction = "-",
        SeedDrop = false,
        SeedDropAt = 190,
        SeedKeep = 0,
        Dropped = 0,
        DropPause = false,
    }

    local _0x78 = {
        Speed = 100,
        InfJump = false,
        Ghost = false,
        UpHeld = false,
        DownHeld = false,
        CustomName = true,
        NameText = "ziey HUB",
    }

    local _0x79 = {
        Running = false,
        IncludeBg = true,
        UseBlock = true,
        ScaffoldId = nil,
        Collect = true,
        Sweep = "Kiri → Kanan",
        Skip = {},
        TopRow = -1,
        DirRow = nil,
        Dir = nil,
        Broken = 0,
        Remaining = -1,
        Status = "-",
    }

    local _0x7a = {
        Running = false,
        Roam = true,
        Roaming = false,
        A = nil,
        B = nil,
        Ms = 300,
        Made = 0,
        Planted = 0,
        Fail = {},
        Skip = {},
        Status = "-",
        Row = {},
    }

    local _0x7b = {
        X0 = 0, X1 = 99,
        Y0 = 2,
        Gap = 2,
        Rows = 10,
        Stairs = true,
    }

    local _0x7c = {
        Running = false,
        BlockId = nil,
        UseBlock = true,
        Produce = true,
        ThenPabrik = false,
        Placed = 0,
        Phase = "-",
        Status = "-",
        Skip = {},
        FieldSkip = {},
        Row = {},
        Harvested = 0,
        Planted = 0,
        Dug = 0,
        Carved = {},
        Surface = nil,
        Under = {},
        BreakTimes = {},
        LavaSkip = {},
        LavaCleared = 0,
        PunchMs = 200,
        Reserve = 0,
        RESERVE = 10,
        BreakX = -1, BreakY = -1,
        Tiles = {},
    }

    local _0x7d = {
        Running = false,
        Mode = "Isi stock dari drop",
        Point = "",
        Status = "-",
        Stocked = 0, Taken = 0, Dropped = 0,
        Picked = {},
        Items = {},
        Kind = "Semua",
        Seen = {},
        DropX = -1, DropY = -1,
        Carry = {},
    }

    local _0x7e = {
        Running = false,
        SeedId = nil,
        BlockId = nil,
        WholeWorld = false,
        Tiles = {},
        BreakX = -1, BreakY = -1,
        BreakSec = 60,
        Drop = true,
        Keep = 50,
        DropAt = 200,
        DropWorld = "",
        DropX = -1, DropY = -1,
        Harvested = 0,
        Planted = 0,
        Dropped = 0,
        Skip = {},
        Status = "-",
        Traveling = false,
        Home = "",
        Zone = nil,
        Row = {},
    }

    local _0x7f = {
        On = false,
        Who = "Staff (Mod/Dev)",
        StopAll = true,
        Leave = false,
        AutoBack = true,
        BackSec = 60,
        CalmSec = 5,
        Mode = "idle",
        Allow = {},
        Alerted = {},
        Saved = nil,
        Token = 0,
        BackAt = 0,
        CalmAt = nil,
        LeftFg = nil,
        BackText = nil,
        Status = "Mati",
        Detected = 0,
    }

    local _0x80 = {
        Running = false,
        Harvest = true,
        HarvestOnly = true,
        Plant = false,
        Collect = true,
        UseBlock = false,
        ScaffoldId = nil,
        HarvestMs = 250,
        PlantMs = 250,
        SeedId = nil,
        Skip = {},
        Harvested = 0,
        Planted = 0,
        Status = "-",
        Drop = false,
        DropAt = 190,
        Keep = 50,
        Dropped = 0,
        Got = {},
        Row = {},
    }

    local _0x81 = { active = false, left = false, right = false, jump = false, down = false }

    local _0x82 = {
        On = false,
        Texts = {},
        IntervalSec = 6,
        Index = 1,
        Sent = 0,
        Last = "-",
    }

    local _0x83 = {
        World = nil,
        Inv = nil,
        SetTile = nil,
        State = nil,
        Punch = nil,
        Particles = {},
        Menu = nil,
        Gems = nil,
        Hud = nil,
        Trees = nil,
        Others = nil,
    }

    local _0x84 = { list = nil, update = nil, brokeAt = {} }
    local _0x85 = { fn = nil, idx = nil, set = nil }
    local _0x86 = {}
    local _0x87 = {}

    function _0x87.ident()
        local _0x17 = getthreadidentity or get_thread_identity or getidentity or (syn and syn.get_thread_identity)
        if type(_0x17) ~= "function" then return nil end
        local _0x2d, _0x88 = pcall(_0x17)
        return _0x2d and _0x88 or nil
    end

    function _0x87.exec(_0x28)
        local _0x89 = setthreadidentity or set_thread_identity or setidentity or (syn and syn.set_thread_identity)
        local function _0x8a()
            if _0x1.Ident and type(_0x89) == "function" then pcall(_0x89, _0x1.Ident) end
        end
        local _0x49 = _0x1.Exec
        if _0x49 and not _0x1.ExecBusy and coroutine.status(_0x49) == "suspended" then
            local _0x18 = { fn = function() _0x8a(); _0x28() end }
            _0x1.ExecBusy = true
            local _0x59, _0x8b = coroutine.resume(_0x49, _0x18)
            if _0x59 then
                local _0x8c = os.clock() + 10
                while not _0x18.done do
                    if not _0x2() then return false, "Sesi script sudah ditutup" end
                    if os.clock() >= _0x8c then return false, "Pekerjaan UI belum selesai setelah 10 detik" end
                    task.wait()
                end
                return _0x18.ok, _0x18.err
            end
            _0x1.ExecBusy = false
            return false, tostring(_0x8b)
        end
        _0x8a()
        local _0x59, _0x8b = pcall(_0x28)
        if _0x59 then return true end
        return false, tostring(_0x8b)
    end

    _0x87.Jobs = {}
    function _0x87.later(_0x8d, _0x28, _0x8e)
        _0x87.Jobs[_0x8d] = { fn = _0x28, at = os.clock() + (_0x8e or 0) }
    end

    function _0x87.runJobs()
        local _0x8f = os.clock()
        local _0x90 = {}
        for _0x8d, _0x48 in pairs(_0x87.Jobs) do
            if _0x8f >= _0x48.at then _0x90[#_0x90 + 1] = _0x8d end
        end
        for _, _0x8d in ipairs(_0x90) do
            local _0x48 = _0x87.Jobs[_0x8d]
            if _0x48 and _0x8f >= _0x48.at then
                _0x87.Jobs[_0x8d] = nil
                local _0x59, _0x8b = pcall(_0x48.fn)
                if not _0x59 then warn("[ziey HUB] UI job " .. tostring(_0x8d) .. ": " .. tostring(_0x8b)) end
            end
        end
    end

    local _0x91 = {}
    _0x1.StartupConnections = _0x91
    local _0x92 = {}
    local _0x93 = {}

    local _0x94 = { Lang = "id", Saved = "id", Ask = true }
    do
        local function _0x95()
            _0x94.EN = {
                ["Fitur"] = "Features", ["Keamanan"] = "Security", ["Setelan"] = "Setup",
                ["Pengaturan"] = "Settings", ["Penjaga"] = "Guard", ["Statistik"] = "Stats", ["Tas"] = "Bag",
                ["Dirt Farm"] = "Dirt Farm", ["Pabrik"] = "Factory", ["Koneksi"] = "Connection",
                ["Kontrol"] = "Controls", ["Mode & Kecepatan"] = "Mode & Speed", ["Kecepatan"] = "Speed",
                ["Karakter"] = "Character", ["Opsi"] = "Options", ["Pesan"] = "Messages",
                ["Aksi saat terdeteksi"] = "Action when detected", ["Waktu"] = "Timing", ["Lainnya"] = "Other",
                ["Quest Harian"] = "Daily Quests", ["Pohon (siap panen)"] = "Trees (ready to harvest)",
                ["Auto Recycle (buang item)"] = "Auto Recycle (trash items)", ["Bentuk Dirt Farm"] = "Dirt Farm shape",
                ["Pilihan"] = "Options", ["Posisi & tile break"] = "Break position & tiles",
                ["Koreksi posisi"] = "Position correction", ["Yang dikirim"] = "What to send",
                ["Bisa juga lewat tombol START di Grid"] = "Can also use the START button in the Grid",
                ["Ambil drop di tile yang dipilih"] = "Pick up drops on the selected tiles",
                ["Collect di sekitar karakter"] = "Collect around character",
                ["Ambil semua drop dalam radius, kapan saja"] = "Pick up all drops within the radius, anytime",
                ["Radius collect (tile)"] = "Collect radius (tiles)",
                ["Dipakai juga Clear, Farmer, Splice & Pabrik. Terlalu jauh bisa ditolak server"] =
                    "Also used by Clear, Farmer, Splice & Factory. Too far may be rejected by the server",
                ["Buka Grid Tile"] = "Open Tile Grid",
                ["Kotak 5x5, tengah = karakter"] = "5x5 grid, center = character",
                ["Status Clear"] = "Clear Status",
                ["Bersihkan dari baris atas ke bawah"] = "Clear from the top row down",
                ["Arah sapu"] = "Sweep direction",
                ["Zig-zag lebih cepat (tidak balik ke kiri)"] = "Zig-zag is faster (no going back left)",
                ["Pakai block pijakan"] = "Use scaffold blocks",
                ["Taruh block untuk lewat jurang / naik ke block melayang"] = "Place blocks to cross gaps / reach floating blocks",
                ["Block pijakan"] = "Scaffold block",
                ["Block yang dipakai untuk pijakan"] = "Block used as scaffold",
                ["Auto collect tiap habis pecah"] = "Auto collect after each break",
                ["Ambil drop di sekitar karakter"] = "Pick up drops around the character",
                ["Reset tile yang dilewati"] = "Reset skipped tiles",
                ["Coba lagi tile yang tadi gagal"] = "Retry tiles that failed",
                ["Status Farmer"] = "Farmer Status",
                ["Jalankan Farmer"] = "Run Farmer",
                ["Panen pohon siap & tanam seed otomatis"] = "Harvest ready trees & plant seeds automatically",
                ["Seed untuk ditanam"] = "Seed to plant",
                ["Hanya seed yang ada di inventori"] = "Only seeds in your inventory",
                ["Refresh daftar seed"] = "Refresh seed list",
                ["Hanya pohon yang sudah siap"] = "Only trees that are ready",
                ["Tanam di atas block yang kosong"] = "Plant on top of empty blocks",
                ["Ambil hasil panen di sekitar karakter"] = "Pick up harvest drops around the character",
                ["Jeda setelah tiap panen"] = "Delay after each harvest",
                ["Jeda setelah tiap tanam seed"] = "Delay after each seed planted",
                ["Taruh block kalau tidak ada jalan (block tetap tertinggal)"] = "Place blocks when there is no path (blocks stay behind)",
                ["Place semua tile dulu, lalu break"] = "Place all tiles first, then break",
                ["Jeda setelah tiap place"] = "Delay after each place",
                ["Jeda tiap pukulan (normal 220). Dipakai juga Clear"] = "Delay per hit (normal 220). Also used by Clear",
                ["Auto Farm: tile dipukul bergantian (seperti 2 jari). Pakai Rayman's Fist = 2-3 tile segaris sekali pukul"] =
                    "Auto Farm: tiles are hit in turns (like 2 fingers). With Rayman's Fist = 2-3 tiles in a line per punch",
                ["Jeda setelah hancur (ms)"] = "Delay after break (ms)",
                ["Tunggu sebelum lanjut ke tile berikutnya"] = "Wait before moving to the next tile",
                ["Mode Lite"] = "Lite Mode",
                ["Matikan particle & suara (HP low-end)"] = "Turn off particles & sounds (low-end phones)",
                ["Mute suara pukulan"] = "Mute punch sounds",
                ["Pukulan per block (cadangan)"] = "Hits per block (fallback)",
                ["Dipakai kalau 'Pukul: TIDAK'. 0 = otomatis"] = "Used when 'Punch: NO'. 0 = automatic",
                ["Pilih Block"] = "Select Block",
                ["Hanya item yang bisa di-place"] = "Only placeable items",
                ["Refresh daftar"] = "Refresh list",
                ["Lompat di udara (bisa kena rollback)"] = "Jump mid-air (may get rolled back)",
                ["Fly + Tembus Block"] = "Fly + Noclip",
                ["Tembus block, pakai tombol ▲/▼ (bisa kena rollback)"] = "Pass through blocks, use the ▲/▼ buttons (may get rolled back)",
                ["Bahasa / Language"] = "Language / Bahasa",
                ["Titik Drop"] = "Drop Point", ["Atur titik drop"] = "Set drop point", ["Drop otomatis"] = "Auto drop",
                ["Seed sudah banyak: jeda, drop ke titik drop (tab Titik Drop), balik ke posisi farm"] =
                    "Too many seeds: pause, drop at the drop point (Drop Point tab), return to farm position",
                ["Seed dari block yang dipilih"] = "Seeds of the selected block",
                ["Drop kalau hampir penuh"] = "Drop when almost full",
                ["Hasil panen (block & seed) dibawa ke titik drop (tab Titik Drop)"] =
                    "Harvest items (blocks & seeds) are taken to the drop point (Drop Point tab)",
                ["Drop kalau item sudah"] = "Drop when an item reaches",
                ["Maksimal 200 per item"] = "Max 200 per item",
                ["Sisakan seed tanam"] = "Seeds to keep for planting",
                ["Seed yang dipilih untuk ditanam tidak di-drop semua"] = "The planting seed is not dropped completely",
                ["Ke titik drop (tab Titik Drop)"] = "To the drop point (Drop Point tab)",
                ["Block kurang diproduksi dulu, lalu dipasang dari atas seperti ular (tanpa pijakan)"] =
                    "Missing blocks are produced first, then placed from the top like a snake (no scaffolding)",
                ["Gali dulu dari permukaan sampai bawah, lalu pasang baris naik sampai atas (baris jadi jembatan). Block habis: produksi 1 baris"] =
                    "Digs from the surface down to the bottom first, then places rows upward to the top (each row is its own bridge). Out of blocks: produces on 1 row",
                ["Baris block paling atas. Baris di bawahnya otomatis sampai di atas bedrock (tanah digali)"] =
                    "Top block row. Rows below go automatically down to just above bedrock (dirt is dug out)",
                ["Berdiri di atas block pertama baris paling atas, lalu tekan (tangga kiri di sebelah kirinya)"] =
                    "Stand on the first block of the top row, then press (left stairs go to its left)",
                ["Baris block paling atas. Baris di bawahnya dibuat otomatis sampai tanah"] =
                    "Top block row. Rows below are made automatically down to the ground",
                ["Ganti bahasa, lalu execute ulang"] = "Change language, then re-execute",
                ["Mode collect"] = "Collect mode", ["Sentuhan"] = "Touch",
                ["Berlaku untuk semua fitur. Sentuhan = seperti main manual. Remote = ambil dari jauh (cara lama, cepat)"] =
                    "Applies to all features. Touch = like manual play. Remote = picks up from a distance (old method, fast)",
                ["Ambil drop di semua tile grid (caranya ikut Mode collect)"] = "Pick up drops on all grid tiles (method follows Collect mode)",
                ["Radius collect (mode Remote)"] = "Collect radius (Remote mode)",
                ["Jarak ambil drop di sekitar karakter (tile)"] = "Pickup distance around the character (tiles)",
                ["Animasi aksi"] = "Action animation",
                ["Tangan bergerak saat break / place / tanam / panen + efek place. Matikan untuk hemat FPS"] =
                    "Arm moves on break / place / plant / harvest + place effect. Turn off to save FPS",
                ["Jenis item"] = "Item type",
                ["Berlaku untuk isi stock (drop yang dipungut) dan kosongkan (vending yang diambil)"] =
                    "Applies to stock (drops picked up) and empty (vendings taken from)",
                ["Block saja"] = "Blocks only", ["Seed saja"] = "Seeds only",
                ["Item yang diambil"] = "Items to take",
                ["Bisa pilih banyak. Kosong = semua item. Daftar: isi vending, tas & drop yang terlihat"] =
                    "Multi-select. Empty = all items. List: vending contents, backpack & seen drops",
                ["Muat ulang daftar item"] = "Reload item list",
                ["Pilih item"] = "Pick items",
                ["Tambah item yang dipegang"] = "Add the held item",
                ["Pilih item di tas game (dipegang), lalu tekan. Masuk ke daftar item yang diambil"] =
                    "Select an item in the game backpack (held), then press. Adds it to the items to take",
                ["Hapus pilihan item"] = "Clear item selection",
                ["Kembali ke semua item"] = "Back to all items",
                ["Simpan posisi drop vending (posisi karakter)"] = "Save vending drop position (character position)",
                ["Berdiri di tempat drop (boleh di world titik drop), lalu tekan. Dipakai mode isi stock & kosongkan"] =
                    "Stand at the drop spot (can be in the drop-point world), then press. Used by stock & empty
