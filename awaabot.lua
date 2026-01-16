-- Fish It Webhook (LUA)

local WEBHOOK_URL = "https://discord.com/api/webhooks/ISI_WEBHOOK_KAMU"
local HttpService = game:GetService("HttpService")
local Player = game.Players.LocalPlayer

function SendFishWebhook(fishName, fishWeight, fishType)
    local payload = {
        username = "Fish It Logger",
        embeds = {{
            title = "🎣 Fish Obtained!",
            color = 10181046,
            fields = {
                { name = "👤 Player", value = Player.Name, inline = true },
                { name = "🐟 Fish", value = fishName or "Unknown", inline = true },
                { name = "⚖️ Weight", value = tostring(fishWeight) .. " kg", inline = true },
                { name = "🌟 Type", value = fishType or "Normal", inline = true }
            },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }

    local req = http_request or request or syn.request
    if req then
        req({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(payload)
        })
    end
end

-- Contoh panggil:
-- SendFishWebhook("Ancient Shark", 12.4, "Mythic")
