local M = {}

M.bg = "#000000"
M.fg = "#ffffff"
M.day_brightness = 0.3

---@param hex_str string hexadecimal value of a color
local hex_to_rgb = function(hex_str)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

  local red, green, blue = string.match(hex_str, pat)
  return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

---@param foreground string forecrust color
---@param background string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, background, alpha)
  local bg = hex_to_rgb(background)
  local fg = hex_to_rgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or M.bg, math.abs(amount))
end

function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or M.fg, math.abs(amount))
end

function M.hex2rgb(hex)
  return tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
end

function M.invert_color(color)
  local hsluv = require("utils.hsluv")
  if color ~= "NONE" then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[3] = 100 - hsl[3]
    if hsl[3] < 40 then
      hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
    end
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

--- Get highlight properties for a given highlight name
-- @param name highlight group name
-- @return table of highlight group properties
function M.get_highlight(name)
  return vim.api.nvim_get_hl(0, { name = name, link = false })
end

return M
