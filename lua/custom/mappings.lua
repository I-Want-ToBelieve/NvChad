---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
}

-- Your custom mappings
M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["h"] = { "i" },
    ["j"] = { "h" },
    ["i"] = { "k" },
    ["k"] = { "j" },
    ["H"] = { "5i" },
    ["J"] = { "5h" },
    ["I"] = { "5k" },
    ["K"] = { "5j" },
  },
}



M.vscode = {
}

-- more keybinds!

return M
