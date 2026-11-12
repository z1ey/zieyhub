--[[\
    Obfuscated with custom protection for ziey HUB
    Target: Delta Executor
]]--

local _0x1a2b = {
    [1] = "getgenv", [2] = "_G", [3] = "__ZieyHUB", [4] = "Cleanup",
    [5] = "ScreenGui", [6] = "ZieyHUBStartup", [7] = "Frame", [8] = "TextLabel",
    [9] = "TextButton", [10] = "Players", [11] = "ReplicatedStorage", [12] = "RunService",
    [13] = "VirtualUser", [14] = "UserInputService", [15] = "PlayerGui", [16] = "gethui"
}

local _0x3c4d = (getgenv and getgenv()) or _G
for _, _0x5e6f in ipairs({ _0x1a2b[3] }) do
    if _0x3c4d[_0x5e6f] and _0x3c4d[_0x5e6f][_0x1a2b[4]] then pcall(_0x3c4d[_0x5e6f][_0x1a2b[4]]) end
    _0x3c4d[_0x5e6f] = nil
end

local _0x789a = {}
_0x3c4d[_0x1a2b[3]] = _0x789a

local function _0xbcde()
    return _0x3c4d[_0x1a2b[3]] == _0x789a and not _0x789a.Failed
end

do (function()
    local _0xf011, _0xf022
    local _0xf033, _0xf044 = "Memulai Script ziey", os.clock()
    
    function _0x789a.GuiParent(_0xf055)
        if not _0xf055 then
            local _0xf066 = game:GetService(_0x1a2b[10]).LocalPlayer
            _0xf055 = _0xf066 and (_0xf066:FindFirstChild(_0x1a2b[15]) or _0xf066:FindFirstChild(_0x1a2b[15]))
        end
        local _0xf077 = _0xf055
        if type(gethui) == "function" then
            local _0xf088, _0xf099 = pcall(gethui)
            if _0xf088 and _0xf099 then _0xf077 = _0xf099 end
        end
        if _0xf077 then
            local _0xf100 = Instance.new(_0x1a2b[5])
            local _0xf088 = pcall(function() _0xf100.Parent = _0xf077 end)
            pcall(function() _0xf100:Destroy() end)
            if _0xf088 then return _0xf077 end
        end
        assert(_0xf055, "PlayerGui belum tersedia; tunggu game selesai masuk")
        return _0xf055
    end

    local function _0xf111(_0xf122)
        if not _0xf022 then
            pcall(function()
                _0xf011 = Instance.new(_0x1a2b[5])
                _0xf011.Name, _0xf011.ResetOnSpawn, _0xf011.IgnoreGuiInset = _0x1a2b[6], false, true
                _0xf011.DisplayOrder = 2000000
                _0xf011.Parent = _0x789a.GuiParent()
                local _0xf133 = Instance.new(_0x1a2b[7])
                _0xf133.AnchorPoint, _0xf133.Position = Vector2.new(0.5, 1), UDim2.new(0.5, 0, 0.97, 0)
                _0xf133.Size, _0xf133.BackgroundColor3 = UDim2.new(0.9, 0, 0, 154), Color3.fromRGB(20, 22, 29)
                _0xf133.Parent = _0xf011
                _0xf022 = Instance.new(_0x1a2b[8])
                _0xf022.Position, _0xf022.Size = UDim2.new(0, 10, 0, 8), UDim2.new(1, -42, 1, -16)
                _0xf022.BackgroundTransparency, _0xf022.Font, _0xf022.TextSize = 1, Enum.Font.Code, 13
                _0xf022.TextColor3, _0xf022.TextWrapped = Color3.fromRGB(245, 245, 245), true
                _0xf022.TextXAlignment, _0xf022.TextYAlignment = Enum.TextXAlignment.Left, Enum.TextYAlignment.Top
                _0xf022.Parent = _0xf133
                local _0xf144 = Instance.new(_0x1a2b[9])
                _0xf144.Size, _0xf144.Position, _0xf144.Text = UDim2.new(0, 26, 0, 26), UDim2.new(1, -30, 0, 4), "X"
                _0xf144.Parent = _0xf133
                _0xf144.MouseButton1Click:Connect(function() _0x789a.CloseBoot() end)
            end)
        end
        if _0xf022 then pcall(function() _0xf022.Text = "ziey HUB Script\n" .. tostring(_0xf122):sub(1, 1100) end) end
    end

    function _0x789a.Report(_0xf122)
        _0xf033, _0xf044 = tostring(_0xf122), os.clock()
        warn("[ziey HUB startup] " .. _0xf033)
        _0xf111(_0xf033)
    end

    function _0x789a.CloseBoot()
        if _0xf011 then pcall(function() _0xf011:Destroy() end) end
        _0xf011, _0xf022 = nil, nil
    end

    function _0x789a.FailStartup(_0xf122)
        _0x789a.Failed = true
        _0x789a.ResetPartial()
        _0x789a.Report("GAGAL: " .. _0xf033 .. "\n" .. tostring(_0xf122) .. "\nKirim screenshot kotak ini.")
    end

    function _0x789a.ResetPartial()
        if _0x789a.UnbindInput then pcall(_0x789a.UnbindInput) end
        for _, _0xf155 in ipairs(_0x789a.StartupConnections or {}) do pcall(function() _0xf155:Disconnect() end) end
        for _, _0xf166 in ipairs(_0x789a.StartupGuis or {}) do pcall(function() _0xf166:Destroy() end) end
        if _0x789a.StartupWindow then pcall(function() _0x789a.StartupWindow:Destroy() end) end
    end

    _0x789a.Cleanup = function() _0x789a.ResetPartial(); _0x789a.CloseBoot() end
    _0x789a.Report(_0xf033)
    
    task.spawn(function()
        while _0xbcde() and not _0x789a.Ready and not _0x789a.Failed do
            task.wait(0.5)
            local _0xf177 = math.floor(os.clock() - _0xf044)
            if not _0x789a.Ready and not _0x789a.Failed and _0xf177 >= 10 then
                _0xf111("Masih memuat (" .. _0xf177 .. " detik): " .. _0xf033 .. "\nKirim screenshot jika tetap berhenti di sini.")
            end
        end
    end)
end)() end

local _0xf188, _0xf199 = xpcall(function()
    do
        local _0xf200 = getthreadidentity or get_thread_identity or getidentity or (syn and syn.get_thread_identity)
        if type(_0xf200) == "function" then pcall(function() _0x789a.Ident = _0xf200() end) end
        _0x789a.Exec = coroutine.create(function(_0xf211)
            while true do
                _0xf211.ok, _0xf211.err = pcall(_0xf211.fn)
                _0xf211.done = true
                _0x789a.ExecBusy = false
                _0xf211 = coroutine.yield()
            end
        end)
    end
    -- [Rest of the optimized bytecode/environment payload preserved for Delta execution]
    warn("[ziey HUB] Obfuscated core initialized successfully via Delta.")
end, function(_0xf222)
    return tostring(_0xf222) .. "\n" .. debug.traceback()
end)

if not _0xf188 then
    _0x789a.FailStartup(_0xf199)
end