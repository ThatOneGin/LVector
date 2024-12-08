--[[

file for testing functions, ignore.

]]

local Lvector = require("lvector")
local x1 = Lvector.new(90, 90)
local x2 = Lvector.new(90, 91)
local clamp_vec = Lvector.new(38, 75)

print(x1 + x2)
print(x1 * x2)
print(x1 - x2)
print(x1 / x2)
print(x1:dot(x2))
print(x1:clamp(clamp_vec, x2))
print(x1:clone())
print(x1:normalize())
print(x1:rotate(math.pi / 2))