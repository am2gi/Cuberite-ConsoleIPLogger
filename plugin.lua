function Initialize(Plugin)
    Plugin:SetName("ConsoleIPLogger")
    Plugin:SetVersion(1)
    cPluginManager:AddHook(cPluginManager.HOOK_HANDSHAKE, OnHandshake)
    return true
end

function OnHandshake(Client, Username, ServerAddress, ServerPort, ServerVersion)
    local success, ip = pcall(function() return Client:GetIPString() end)
    if success and ip then
        LOG("Nick: " .. tostring(Username) .. " | IP: " .. tostring(ip))
    end
    return false
end
