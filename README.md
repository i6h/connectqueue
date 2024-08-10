# 🚀 ConnectQueue

A lightweight and easy-to-use queue system for FiveM, packed with features:

- 🛠️ **Simple API** for seamless integration
- 🏅 **Priority System** to manage player queues efficiently
- ⚙️ **Extensive Configuration Options**:
  - 🔒 Whitelist-only mode
  - 🎮 Steam requirement
  - 🌐 Multiple language support
- 💬 **Supports the latest Discord API** for robust and up-to-date integration

🐞 **Please report any bugs via the [GitHub Issues](https://github.com/i6h/connectqueue/issues).**

## 📥 Installation

1. 📂 Extract the folder into your `resources` directory.
2. 📜 Add `start connectqueue` to your `server.cfg` (preferably at the top).
3. 🔧 Configure ConVars as needed.
4. ✏️ Open `connectqueue/server/sv_queue_config.lua` and customize it to your needs.

> **Note:** Renaming the resource folder may cause issues.

## 🔧 ConVars

Set the following ConVars in your `server.cfg`:

```bash
set sv_debugqueue true    # Enables debug messages in the console
set sv_displayqueue true  # Displays the queue count in the server name '[count] server name'
```

## 🛠️ Usage and Examples

### 🚦 OnReady

This event is triggered when the queue functions are ready to be used.

```lua
Queue.OnReady(function() 
    print("Queue system is ready!")
end)
```

### 🚪 OnJoin

This event is triggered when a player attempts to join the server. The `allow` function controls their access. If `allow` is called with a string, the player is denied entry with the given message.

```lua
Queue.OnJoin(function(source, allow)
    allow("Sorry, you cannot join at this time.")
end)
```

### 🎟️ AddPriority

Adds a player identifier to the priority list with a specified power level, either individually or in a table.

```lua
-- Individual priority
Queue.AddPriority("STEAM_0:1:33459672", 100)
Queue.AddPriority("steam:110000103fd1bb1", 10)
Queue.AddPriority("ip:127.0.0.1", 25)

-- Multiple priorities
local prioritize = {
    ["STEAM_0:1:33459672"] = 100,
    ["steam:110000103fd1bb1"] = 10,
    ["ip:127.0.0.1"] = 25,
}
Queue.AddPriority(prioritize)
```

### ❌ RemovePriority

Removes priority from a player.

```lua
Queue.RemovePriority("STEAM_0:1:33459672")
```

### ✅ IsReady

Checks if the queue's exports are ready to be used.

```lua
print(Queue.IsReady())
```

### 🔍 Other Queue Functions

Access various queue functions via `sh_queue.lua`.

```lua
local ids = Queue.Exports:GetIds(src)

-- Set player to position 1 in the queue
Queue.Exports:SetPos(ids, 1)
-- Check if the player has any priority
Queue.Exports:IsPriority(ids)
-- Get the current queue size
Queue.Exports:GetSize()
-- And more...
```

## 🛡️ Discord Whitelist and Role Priority

To enable Discord Whitelist with support for the latest Discord API, update `sv_queue_config.lua` (lines 71 to 85) in the `server` directory:

```lua
Config.enableDiscordWhitelist = true -- Enable Discord whitelist system
Config.discordServerGuild = ""       -- Discord Server ID to check membership
Config.discordBotToken = ""          -- Discord Bot Token, create at https://discord.com/developers/applications

Config.Roles = {
    member = {
        roleID = "",  -- Role ID
        point = 15,   -- Queue priority points (higher points move the player up in the queue)
    },
    vip = {
        roleID = "",  -- Role ID
        point = 20,   -- Queue priority points (higher points move the player up in the queue)
    },
}
```

## 🤖 Discord Priority Bot

Manage player queue priorities with our Discord Priority Bot. Automatically assign or remove roles with seamless ConnectQueue integration.

🔗 **Get it here:** [Discord Priority Bot](https://github.com/i6h/priority-bot)

## Acknowledgments 🌟

A big thank you to the Nick78111 for their work on the original project! 🙌 This repository is forked from [Re2team/connectqueue](https://github.com/Re2team/connectqueue/). 🚀


