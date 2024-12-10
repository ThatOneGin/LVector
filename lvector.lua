---Simple vector library made for lua in lua.
---@class VectorLib
local meta_vector = {
  Lib_version = "0.0.1",
  Lua_version = _VERSION or "Lua 5.4",
  github_link = "https://github.com/ThatOneGin/null-l",
}
---@class Vector
local vector = {}
vector.__index = vector

---@param v table|Vector
---@return boolean
local function isvector(v)
  return getmetatable(v) == vector
end

---Returns a new vector based on (x, y).
---@param x number
---@param y number
---@return Vector
local function new_vector(x, y)
  return setmetatable({x = x, y = y}, vector)
end

local function round(v) return tonumber(string.format("%0.f", v)) end

---Returns a vector with random values.
---@return Vector
local function random()
  return new_vector(round(math.random()), round(math.random()))
end

---Clone a vector and returns it.
---@return Vector
function vector:clone()
  return new_vector(self.x, self.y)
end

---@param a Vector
---@param b Vector
---@return Vector
function vector.__div(a, b)
  assert(isvector(a) and isvector(b), "Expected <vector> in operation __div.")
  return new_vector(a.x/b.x, a.y/b.y)
end

---@param a Vector
---@param b Vector
---@return Vector
function vector.__add(a, b)
  assert(isvector(a) and isvector(b), "Expected <vector> in operation __add.")
  return new_vector(a.x+b.x, a.y+b.y)
end

---@param a Vector
---@param b Vector
---@return Vector
function vector.__sub(a, b)
  assert(isvector(a) and isvector(b), "Expected <vector> in operation __sub.")
  return new_vector(a.x-b.x, a.y-b.y)
end

---@param a Vector
---@param b Vector
---@return Vector
function vector.__mul(a, b)
  assert(isvector(a) and isvector(b), "Expected <vector> in operation __mul.")
  return new_vector(a.x*b.x, a.y*b.y)
end

function vector:__tostring()
  return string.format("{x = %2.f, y = %2.f}", self.x, self.y)
end

---Unpack the vector in x, y.
---@return number, number
function vector:unpack()
  return self.x, self.y
end

---Pack the vector and returning it as a new vector.
---@param v number, number
---@return Vector
function vector.pack(v)
  local packed_args = table.pack(v)
  local x = packed_args[1]
  local y = packed_args[2]

  return new_vector(x, y)
end

local function clamp_value(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    else
        return value
    end
end

---Set the values of a vector.
---@param newx number
---@param newy number
---@return Vector
function vector:modify(newx, newy)
  self.x = newx or self.x
  self.y = newy or self.y
  return self
end

---Clamp given vectors.
---@param min Vector
---@param max Vector
---@return Vector
function vector:clamp(min, max)
  return new_vector(
    clamp_value(self.x, min.x, max.x),
    clamp_value(self.y, min.y, max.y))
end

---Returns the dot product of given vector and self.
---@param v any
---@return number
function vector:dot(v)
  return self.x * v.x + self.y * v.y
end

local function magnitude(v)
  return math.sqrt(v.x^2 + v.y^2)
end

---Returns the vector in an array format.
---@return table
function vector:toarray()
  return {self.x, self.y}
end

---Rotate the vector in `angle` degress (radians).
---@param angle number
---@return Vector
function vector:rotate(angle)
  local cos_a = math.cos(angle)
  local sin_a = math.sin(angle)

  local newx = self.x * cos_a - self.y * sin_a
  local newy = self.x * sin_a - self.y * cos_a

  return self:modify(newx, newy)
end

---Normalize vector.
---@return Vector
function vector:normalize()
  local mag = magnitude(self)

  if mag == 0 then return new_vector(0, 0)
  else
    self:modify(self.x / mag, self.y / mag)
  end

  return self
end

meta_vector.random = random
meta_vector.new = new_vector
return setmetatable(meta_vector, {__call = function (_, ...) return new_vector(...) end})