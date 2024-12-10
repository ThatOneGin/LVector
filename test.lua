--[[

file for testing functions, ignore.

]]

local Lvector = require("lvector")
local String_view = require("string_view")
local shapes = require("shapes")
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

shapes:shape("test", {
  __call = function ()
    return shapes:get_shape("test")
  end,
  test_field = "null"
})
shapes:hasField("test", "test_field")
local test = shapes:get_shape("test")

local my_sv = String_view("hello world")
print(my_sv:l_str())
local splitstr = my_sv.split("hello, world", " ")
print(splitstr[1], splitstr[2])