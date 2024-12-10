local String_view = {
  data = {},
  Lib_version = "0.0.1",
  Lua_version = _VERSION or "Lua 5.4",
  github_link = "https://github.com/ThatOneGin/null-l",
}

---@param str string
function String_view.new(str)
  local t = {}
  for str in string.gmatch(str, ".") do
    table.insert(t, str)
  end
  local strv = String_view
  strv.data = t
  return strv
end

---@return string
function String_view:l_str()
  return table.concat(self.data)
end

---@return integer
function String_view:len()
  return #self.data
end

---@param suffix string
---@return boolean
function String_view:hasSuffix(suffix)
  local str = self:l_str()
  if #str == 0 then
    return false
  end
  local len = string.len(str) - string.len(suffix) + 1
  return str:sub(len) == suffix
end

---@param prefix string
---@return boolean
function String_view:hasPrefix(prefix)
  local str = self:l_str()
  return str:sub(1, #prefix) == prefix
end

---@param str string
---@param delm string
---@return string[]
function String_view.split(str, delm)
  delm = delm or "."
  local t = {}
  for matched in string.gmatch(str, "([^"..delm.."]+)") do
    table.insert(t, matched)
  end
  return t
end

---@param char string
---@param idx integer
function String_view:putch(char, idx)
  if idx == #self.data then
    self.data[#self.data+1] = char
  else
    local s = self:l_str()
    s = s:sub(1, idx - 1) .. char .. s:sub(idx)
    self.data = self.split(s, ".")
  end
end

---@param idx number
function String_view:delch(idx)
  self.data[idx] = ""
end

return setmetatable(String_view, {__call = function (t, ...)
  return String_view.new(...)
end})