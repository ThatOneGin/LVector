---@class Shapes_lib
local shapes = {
  Lib_version = "0.0.1",
  Lua_version = _VERSION or "Lua 5.4",
  github_link = "https://github.com/ThatOneGin/null-l",
}
shapes.shapes = {}
shapes.shape_types = {}

---@param name string
---@param shape table
function shapes:shape(name, shape, ...)
  local arg = {...}
  
  if #arg > 0 then
    local num_index = 1
    for i, v in pairs(shape) do
      if type(shape[i]) ~= arg[num_index] then
        error(string.format("Mismatched interface types got: `%s` expected: `%s`.", type(shape[i]), arg[num_index]));
      end
      num_index = num_index + 1
    end
  end

  if #arg == 0 then
    local n_i = 1
    for i, v in pairs(shape) do
      arg[n_i] = type(v)
      n_i = n_i + 1
    end
  end

  self.shape_types[name] = arg
  self.shapes[name] = function ()
    return shape
  end
end

---@param name string
---@param new_shape table
function shapes:reshape(name, new_shape)
  if self.shape_types[name] ~= nil then
    local j = 1
    for i, v in pairs(new_shape) do
      if type(new_shape[i]) ~= self.shape_types[name][j] then
        error(string.format("Mismatched types when reshaping interface got: `%s` expected: `%s`.", type(new_shape[i]), self.shape_types[name][j]))
      end
      
      j = j + 1
    end
  end
  
  self.shapes[name] = function ()
    return new_shape
  end
end

---@param name string
---@param field string
---@return boolean
function shapes:hasField(name, field)
  if self.shapes[name] == nil then
    return false
  end

  for i, _ in pairs(self.shapes[name]()) do
    if i == field then
      return true
    end
  end

  return false
end

---@param name string
---@return table
function shapes:get_shape(name)
  local generic_metatable = {
    __call = function (t)
      return t
    end
  }
  
  local required_shape = self.shapes[name] == nil and setmetatable({}, generic_metatable) or self.shapes[name]
  
  return required_shape()
end

return shapes